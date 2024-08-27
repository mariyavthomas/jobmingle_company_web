import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_web/razorpay_web.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Add Firebase Firestore
import 'package:job_mingle_web/application/getdata/getdatafromcompany_bloc.dart';
import 'package:job_mingle_web/utils/customtextform.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final formkey = GlobalKey<FormState>();
  late Razorpay _razorpay;

  TextEditingController address = TextEditingController();
  TextEditingController summerycontroller = TextEditingController();
  TextEditingController totalemployee = TextEditingController();
  TextEditingController industrycontroller = TextEditingController();
  TextEditingController recuternamecontroller = TextEditingController();

  final ValueNotifier<bool> isFormValid = ValueNotifier<bool>(false);
  bool _isPaymentDone = false;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);

    // Add listeners to text controllers
    address.addListener(_validateForm);
    summerycontroller.addListener(_validateForm);
    totalemployee.addListener(_validateForm);
    industrycontroller.addListener(_validateForm);
    recuternamecontroller.addListener(_validateForm);

    // Check payment status from Firebase
    _checkPaymentStatus();
  }

  Future<void> _checkPaymentStatus() async {
    try {
      var paymentDoc = await FirebaseFirestore.instance
          .collection('company')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();

      if (paymentDoc.exists && paymentDoc.data()?['payment'] == 'Payment Success') {
        setState(() {
          _isPaymentDone = true;
        });
      }
    } catch (e) {
      log('Error checking payment status: $e');
    }
  }

  @override
  void dispose() {
    _razorpay.clear();
    address.dispose();
    summerycontroller.dispose();
    totalemployee.dispose();
    industrycontroller.dispose();
    recuternamecontroller.dispose();
    super.dispose();
  }

  void _validateForm() {
    isFormValid.value = address.text.isNotEmpty &&
        summerycontroller.text.isNotEmpty &&
        totalemployee.text.isNotEmpty &&
        industrycontroller.text.isNotEmpty &&
        recuternamecontroller.text.isNotEmpty;
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_1DP5mmOlF5G5ag',
      'amount': 50000, // Amount in paise (10000 paise = 100 INR)
      'name': 'TechCorp Inc.',
      'description': 'Company Profile Payment',
      'send_sms_hash': true,
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    log('Success Response: $response');
    Fluttertoast.showToast(
        msg: "SUCCESS: ${response.paymentId!}",
        toastLength: Toast.LENGTH_SHORT);

    

    // Save form data after successful payment
    context.read<GetdatafromcompanyBloc>().add(
          CompanydataaddedEvent(
            address: address.text,
            industry: industrycontroller.text,
            recutername: recuternamecontroller.text,
            summery: summerycontroller.text,
            totalemployee: totalemployee.text,
            payment: 'Payment Success',
          ),
        );

    Navigator.pop(context);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    log('Error Response: $response');
    Fluttertoast.showToast(
        msg: "ERROR: ${response.code} - ${response.message!}",
        toastLength: Toast.LENGTH_SHORT);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    log('External SDK Response: $response');
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: ${response.walletName!}",
        toastLength: Toast.LENGTH_SHORT);
  }

  void _showIncompleteFormAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Incomplete Form'),
          content: Text('Please fill in all fields before proceeding.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showPaymentDoneMessage() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Payment Completed'),
          content: Text('You have already completed the payment.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _processPayment() {
    if (_isPaymentDone) {
      _showPaymentDoneMessage();
    } else if (formkey.currentState!.validate() && isFormValid.value) {
      openCheckout();
    } else {
      _showIncompleteFormAlert();
    }
  }

  @override
  Widget build(BuildContext context) {
    double width1 = MediaQuery.of(context).size.width;
    double height2 = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Form(
        key: formkey,
        child: Center(
          child: Container(
            width: width1 * 0.4,
            child: ListView(
              children: [
                Center(
                  child: Text(
                    "Payment",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: height2 * 0.04),
                CustomTextFormField(
                  focusedBorder: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(),
                  controller: address,
                  hintText: "Enter the Company Address",
                  labeltext: "Company Address",
                ),
                SizedBox(height: height2 * 0.01),
                CustomTextFormField(
                  focusedBorder: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(),
                  controller: totalemployee,
                  hintText: "Enter Total Employees",
                  labeltext: "Total Employees",
                ),
                SizedBox(height: height2 * 0.01),
                CustomTextFormField(
                  focusedBorder: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(),
                  controller: recuternamecontroller,
                  hintText: "Senior Recruiter Name",
                  labeltext: "Name",
                ),
                SizedBox(height: height2 * 0.01),
                CustomTextFormField(
                  maxlines: 10,
                  focusedBorder: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(),
                  controller: summerycontroller,
                  hintText: "Enter The Summary About the Company",
                  labeltext: "Summary",
                ),
                SizedBox(height: height2 * 0.01),
                CustomTextFormField(
                  focusedBorder: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(),
                  controller: industrycontroller,
                  hintText: "Enter Industry",
                  labeltext: "Industry",
                ),
                SizedBox(height: height2 * 0.01),
                ValueListenableBuilder<bool>(
                  valueListenable: isFormValid,
                  builder: (context, isValid, child) {
                    return ElevatedButton(
                      onPressed: _processPayment, // Validate and trigger payment
                      child: Text("Make Payment"),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

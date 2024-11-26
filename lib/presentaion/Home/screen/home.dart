import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_mingle_web/application/post_job/postjob_bloc.dart';
import 'package:job_mingle_web/domain/company_model.dart';
import 'package:job_mingle_web/presentaion/Home/widgets/body/cutomcolum.dart';
import 'package:job_mingle_web/presentaion/paymet/screen/payment.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   bool isPaymentSuccessful = false;
  @override
  void initState() {
    super.initState();
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // ignore: unused_local_variable
      final company = Companymodel(companyuid: user.uid);

      BlocProvider.of<PostjobBloc>(context).add(FetchJobs());
      _checkUserPaymentStatus();
    }
  }
  Future<void> _checkUserPaymentStatus() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // Fetch payment status from Firestore
      final docSnapshot = await FirebaseFirestore.instance
          .collection('company')
          .doc(user.uid)
          .get();

      final paymentStatus = docSnapshot.data()?['payment'] ?? null;

      setState(() {
        isPaymentSuccessful = paymentStatus == 'Payment Success';
      });

      if (isPaymentSuccessful) {
        BlocProvider.of<PostjobBloc>(context).add(FetchJobs());
      } else {
        _showPaymentAlert();
      }
    }
  }
  void _showPaymentAlert() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Payment Required'),
        content: Text('You must pay 500 rupees to access this page.'),
        actions: [
          TextButton(
            onPressed: () {
             Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentScreen()));
              // Navigate to payment screen or handle payment logic here
            },
            child: Text('Proceed to Pay'),
          ),
        ],
      ),
    );
  }

  bool isedit = true;
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double width1 = MediaQuery.of(context).size.width;
    // ignore: unused_local_variable
    double height2 = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: 1700,
                decoration: BoxDecoration(color: Colors.blue[50]),
                child:  isPaymentSuccessful ? CutomColum() : SizedBox.shrink())));
  }
}

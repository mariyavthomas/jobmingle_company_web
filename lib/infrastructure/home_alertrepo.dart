import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:job_mingle_web/presentaion/paymet/screen/payment.dart';

class AlertRepo {
  bool _isPaymentIncomplete = false;

  Future<bool> checkPaymentStatus(String companyUid) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
          .instance
          .collection('companies')
          .doc(companyUid)
          .get();

      if (snapshot.exists) {
        var data = snapshot.data();
        if (data != null && data.containsKey('payment')) {
          if (data['payment'] == null) {
            _isPaymentIncomplete = true;
          }
        }
      }
    } catch (e) {
      print("Error fetching payment status: $e");
    }
    return _isPaymentIncomplete;
  }

  void showIncompletePaymentAlert(BuildContext context) {
    if (_isPaymentIncomplete) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Payment Incomplete'),
              content: Text('Please complete your payment to continue.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentScreen(),
                      ),
                    );
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      });
    }
  }
}



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:job_mingle_web/domain/company_model.dart';

class   CompanyGetDataRepo {
  Future<Companymodel?> getcompanydata() async {
    User? company = FirebaseAuth.instance.currentUser;

    try {
      final companydata = await FirebaseFirestore.instance
          .collection("company")
          .where('uid', isEqualTo: company!.uid)
          .get();
      // print("heloo");
      if (companydata.docs.isNotEmpty) {
        return Companymodel.fromJson(companydata.docs.first.data());
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // ignore: unused_field
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<void> addcompanydata(
      String summery,
      String address,
      String totalemployes,
      String industry,
      String recutername,
      String payment) async {
    try {
      await FirebaseFirestore.instance
          .collection("company")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({
        "summery": summery,
        'recutername': recutername,
        'address': address,
        'totalemployee': totalemployes,
        'industry': industry,
        'payment': payment
      });
    } catch (e) {
      print('Error updating education: $e');
    }
  }

  Future<void> update(
      String summery,
      String address,
      String totalemployee,
      String industry,
      String phone,
      String email,
     
      String password) async {
    try {
      await FirebaseFirestore.instance
          .collection('company')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({'summery': summery,
           'address':address,
           'totalemployee':totalemployee,
           'industry':industry,
           'phone':phone,
           'email':email,
           'password':password
           });
    } catch (e) {
        print('Error updating education: $e');
    }
  }
  
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:job_mingle_web/domain/company_model.dart';

class CompanyGetDataRepo {
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
}

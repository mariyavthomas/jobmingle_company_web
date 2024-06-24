import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:job_mingle_web/domain/company_model.dart';

class ProfileRepoCompany{
  Future<Companymodel?>getcompany()async{
    User ?company =FirebaseAuth.instance.currentUser;
     try{
     final data= await FirebaseFirestore.instance.collection('company').where('uid',isEqualTo: company!.uid).get();
     print(data);
     if(data.docs.isNotEmpty){
      return Companymodel.fromJson(data.docs.first.data());
     }
     else{
      print("no user found");
      return null;
     }}
     catch(e){
      print(e.toString());
      return null;
     }

  }
}
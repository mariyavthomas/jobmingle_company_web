import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:job_mingle_web/domain/candidate_model.dart';

class CandidateRepo{
  
  Future<List<CandidateModel>>getallcandidate()async{
    print('keeri');
  final  List<CandidateModel>allcandidate=[];
    User ? company =FirebaseAuth.instance.currentUser;
    final data =await FirebaseFirestore.instance.collection('applyjob').where('companyuid',isEqualTo: company!.uid).get();
    data.docs.forEach((element) { 
      allcandidate.add(CandidateModel.fromJson(element.data()));
    });
    print("hhhh");
    return allcandidate;
  }
  Future<List<CandidateModel>> getspecificcompanyapplicants()async{
    List<CandidateModel> applicants =[];
    try{
       final datas= await FirebaseFirestore.instance.collection('applyjob').where('companyuid',isEqualTo:  FirebaseAuth.instance.currentUser!.uid).get();
       datas.docs.forEach((element) { 
        applicants.add(CandidateModel.fromJson(element.data()));

       });
       return applicants;
    }catch(e){
 return applicants;
    }
  }

}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:job_mingle_web/domain/rejected_candidate.dart';

class RejectedRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<void> addrejectedlist(RejectedCandidateModel rejected) async {
    String rejectedid =
        FirebaseFirestore.instance.collection('rejected').doc().id;
    await _firestore.collection('rejected').doc(rejectedid).set({
      'rejectedid': rejectedid,
      'pic': rejected.pic,
      'companyuid': rejected.companyuid,
      'education': rejected.education,
      'experience': rejected.experience,
      'appyuid': rejected.appyuid,
      'jobid': rejected.jobid,
      'skills': rejected.skills,
      'userid': rejected.userid,
      'username': rejected.username,
      'companyname': rejected.companyname,
      'experiencecomp': rejected.experiencecomp,
      'interviewtime': rejected.interviewtime,
      'jobaddress': rejected.jobaddress,
      'jobtiming': rejected.jobtiming,
      'jobtitle': rejected.jobtitle,
      'qualification': rejected.qualification,
      'salary': rejected.salary,
      'companycontactperson': rejected.companycontactperson,
      'companyphonenumber': rejected.companyphonenumber,
      'conpanycontactpersonumber': rejected.conpanycontactpersonumber,
      'usercourse': rejected.usercourse,
      'usercourseendingyear': rejected.usercourseendingyear,
      'usercousestaringyear': rejected.usercousestaringyear,
      'userexperence': rejected.userexperence,
      'usergrade': rejected.usergrade,
      'userhigereducation': rejected.userhigereducation,
      'usermailid': rejected.usermailid,
      'userphonenumber': rejected.userphonenumber,
      'userresume': rejected.userresume,
      'userspecialice': rejected.userspecialice,
      'useruniversity': rejected.useruniversity,
      'userprofileheadlines': rejected.userprofileheadlines,
      'userprofilesummery': rejected.userprofilesummery,
      'usergender': rejected.usergender,
      'userlanguage': rejected.userlanguage,
      'userdob': rejected.userdob,
      'useruserjobtitle': rejected.useruserjobtitle,
      'useraddress': rejected.useraddress,
      'userhometown': rejected.userhometown,
      'userpincode': rejected.userpincode,
      'userworkstatus': rejected.userworkstatus,
      'usercurrentcity': rejected.usercurrentcity,
      'usercurrentcategory': rejected.usercurrentcategory,
      'usercurrentdeparment': rejected.usercurrentdeparment,
      'usercurrentindustry': rejected.usercurrentindustry,
      'usercurrentjobrole': rejected.usercurrentjobrole
    });
  }
  Future<List<RejectedCandidateModel>>getSpecificrejectedcadidate()async{
    List<RejectedCandidateModel> rejectedlist=[];
    try{
       final datas = await FirebaseFirestore.instance
        .collection('rejected')
        .where('companyuid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    datas.docs.forEach((element) {
      rejectedlist.add(RejectedCandidateModel.fromJson(element.data()));
    });
    return rejectedlist;
    }catch(e){
      return rejectedlist;
    }
  }


   Future<List<RejectedCandidateModel>> searchJobs(String searchtxt) async {
    List<RejectedCandidateModel> jobList = [];
    try {
      final datas =
          await FirebaseFirestore.instance.collection('rejected').get();

      // Filter the results locally to support case-insensitive search
      datas.docs.forEach((element) {
        var data = element.data() as Map<String, dynamic>;
        if (data['jobtitle']
            .toString()
            .toLowerCase()
            .contains(searchtxt.toLowerCase())) {
          jobList.add(RejectedCandidateModel.fromJson(data));
        }
      });

      return jobList;
    } catch (e) {
      print('Error: ${e.toString()}');
      return jobList;
    }
  }

  
}

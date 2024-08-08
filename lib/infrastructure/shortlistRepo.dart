import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:job_mingle_web/domain/shortlist_candidate.dart';

class ShortListRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<void> addshortlist(ShortListCandidatesModel shortlist) async {
    String shortlistid =
        FirebaseFirestore.instance.collection("shortlist").doc().id;
    await _firestore.collection("shortlist").doc(shortlistid).set({
      'shortlistid': shortlistid,
      'pic': shortlist.pic,
      'companyuid': shortlist.companyuid,
      'education': shortlist.education,
      'experience': shortlist.experience,
      'appyuid': shortlist.appyuid,
      'jobid': shortlist.jobid,
      'skills': shortlist.skills,
      'userid': shortlist.userid,
      'username': shortlist.username,
      'companyname': shortlist.companyname,
      'experiencecomp': shortlist.experiencecomp,
      'interviewtime': shortlist.interviewtime,
      'jobaddress': shortlist.jobaddress,
      'jobtiming': shortlist.jobtiming,
      'jobtitle': shortlist.jobtitle,
      'qualification': shortlist.qualification,
      'salary': shortlist.salary,
      'companycontactperson': shortlist.companycontactperson,
      'companyphonenumber': shortlist.companyphonenumber,
      'conpanycontactpersonumber': shortlist.conpanycontactpersonumber,
      'usercourse': shortlist.usercourse,
      'usercourseendingyear': shortlist.usercourseendingyear,
      'usercousestaringyear': shortlist.usercousestaringyear,
      'userexperence': shortlist.userexperence,
      'usergrade': shortlist.usergrade,
      'userhigereducation': shortlist.userhigereducation,
      'usermailid': shortlist.usermailid,
      'userphonenumber': shortlist.userphonenumber,
      'userresume': shortlist.userresume,
      'userspecialice': shortlist.userspecialice,
      'useruniversity': shortlist.useruniversity,
      'userprofileheadlines': shortlist.userprofileheadlines,
      'userprofilesummery': shortlist.userprofilesummery,
      'usergender': shortlist.usergender,
      'userlanguage': shortlist.userlanguage,
      'userdob': shortlist.userdob,
      'useruserjobtitle': shortlist.useruserjobtitle,
      'useraddress': shortlist.useraddress,
      'userhometown': shortlist.userhometown,
      'userpincode': shortlist.userpincode,
      'userworkstatus': shortlist.userworkstatus,
      'usercurrentcity': shortlist.usercurrentcity,
      'usercurrentcategory': shortlist.usercurrentcategory,
      'usercurrentdeparment': shortlist.usercurrentdeparment,
      'usercurrentindustry': shortlist.usercurrentindustry,
      'usercurrentjobrole': shortlist.usercurrentjobrole,
    });
  }

 Future<List<ShortListCandidatesModel>> getspecificcompanyapplicants() async {
  List<ShortListCandidatesModel> shortlist = [];
  try {
    final datas = await FirebaseFirestore.instance
        .collection('shortlist')
        .where('companyuid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    datas.docs.forEach((element) {
      shortlist.add(ShortListCandidatesModel.fromJson(element.data()));
    });
    return shortlist;
  } catch (e) {
    return shortlist;
  }
}

}

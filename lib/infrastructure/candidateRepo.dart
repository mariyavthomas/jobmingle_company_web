import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:job_mingle_web/domain/candidate_model.dart';

class CandidateRepo {
  Future<List<CandidateModel>> getallcandidate() async {
    print('keeri');
    final List<CandidateModel> allcandidate = [];
    User? company = FirebaseAuth.instance.currentUser;
    final data = await FirebaseFirestore.instance
        .collection('applyjob')
        .where('companyuid', isEqualTo: company!.uid)
        .get();
    data.docs.forEach((element) {
      allcandidate.add(CandidateModel.fromJson(element.data()));
    });
    print("hhhh");
    return allcandidate;
  }

  Stream<List<CandidateModel>> getspecificcompanyapplicantsStream() {
  final companyUid = FirebaseAuth.instance.currentUser?.uid;

  if (companyUid == null) {
    return Stream.value([]);
  }

  return FirebaseFirestore.instance
      .collection('applyjob')
      .where('companyuid', isEqualTo: companyUid)
      .snapshots()
      .map((querySnapshot) {
        return querySnapshot.docs
            .map((doc) => CandidateModel.fromJson(doc.data()))
            .toList();
      });
}


  Future<List<CandidateModel>> searchJobs(String searchtxt) async {
    List<CandidateModel> jobList = [];
    try {
      final datas =
          await FirebaseFirestore.instance.collection('applyjob').get();

      // Filter the results locally to support case-insensitive search
      datas.docs.forEach((element) {
        // ignore: unnecessary_cast
        var data = element.data() as Map<String, dynamic>;
        if (data['jobtitle']
            .toString()
            .toLowerCase()
            .contains(searchtxt.toLowerCase())) {
          jobList.add(CandidateModel.fromJson(data));
        }
      });

      return jobList;
    } catch (e) {
      print('Error: ${e.toString()}');
      return jobList;
    }
  }
}

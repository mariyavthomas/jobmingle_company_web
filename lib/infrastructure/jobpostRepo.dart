import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:job_mingle_web/domain/job_model.dart';

class JobRepository {
  final FirebaseFirestore _firestore;
  JobRepository({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;
  
  
  
  Future<List<JobModel>> getJobsByCompany() async {
    List<JobModel> joblist = [];
    User? user = FirebaseAuth.instance.currentUser;
    final snapshot = await FirebaseFirestore.instance
        .collection('jobss')
        .where('companyuid', isEqualTo: user!.uid)
        .get();
    snapshot.docs.forEach((element) {
      joblist.add(JobModel.fromJson(element.data()));
    });
    print(joblist);
    return joblist;
  }

  Future<void> deletejobpost(String jobid) async {
    await _firestore.collection('jobss').doc(jobid).delete();
  }

  Future<void> updatejob(JobModel job) async {
    await _firestore.collection('jobss').doc(job.jobuid).update(job.toJson());
  }


   Future<List<JobModel>> searchJobs(String searchtxt) async {
    List<JobModel> jobList = [];
    try {
      final datas =
          await FirebaseFirestore.instance.collection('jobs').get();

      // Filter the results locally to support case-insensitive search
      datas.docs.forEach((element) {
        var data = element.data() as Map<String, dynamic>;
        if (data['jobtitle']
            .toString()
            .toLowerCase()
            .contains(searchtxt.toLowerCase())) {
          jobList.add(JobModel.fromJson(data));
        }
      });

      return jobList;
    } catch (e) {
      print('Error: ${e.toString()}');
      return jobList;
    }
  }
}

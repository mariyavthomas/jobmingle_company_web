import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:job_mingle_web/domain/job_model.dart';

class JobRepository {
  final FirebaseFirestore _firestore;
  JobRepository({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;
  
  
  
  Future<List<JobModel?>> getJobsByCompany() async {
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
    await _firestore.collection('jobss').doc(job.jobid).update(job.toJson());
  }
}

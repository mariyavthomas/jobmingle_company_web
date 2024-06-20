import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:job_mingle_web/domain/company_model.dart';
import 'package:job_mingle_web/domain/job_model.dart';
import 'package:meta/meta.dart';

part 'postjob_event.dart';
part 'postjob_state.dart';

class PostjobBloc extends Bloc<PostjobEvent, PostjobState> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  PostjobBloc() : super(PostjobInitial()) {
    on<PostJobAdd>(_onAddJob);
    on<LoadJobs>(_onLoadJobs);
  }

  FutureOr<void> _onAddJob(PostJobAdd event, Emitter<PostjobState> emit) async {
    emit(PostJobLoadingState());
    try {
      await _firestore.collection('job').doc(event.job.jobid).set({
        'companyuid': event.job.companyuid,
        'title': event.job.jobtitle,
        'description': event.job.jobdecripation,
        'companyemail': event.job.companyemail,
        'jobaddress': event.job.jobaddress,
        'location': event.job.location,
        'numberofopening': event.job.numberofopening,
        'timeofjobentering': event.job.timeofjobentering,
        'dateofposting': event.job.dateofposting,
        'experience': event.job.experience,
        'contactpersonprofile': event.job.contactpersonprofile,
        'contactpersonname': event.job.contactpersonname,
        'created_at': FieldValue.serverTimestamp(),
      });
      emit(PostJobSuccess());
    } catch (e) {
      emit(PostJobFailure(error: e.toString()));
    }
  }

  FutureOr<void> _onLoadJobs(LoadJobs event, Emitter<PostjobState> emit) async {
    emit(PostJobLoadingState());
    try {
      // final snapshot = await _firestore.collection("Jobs").get();
      // final jobs = snapshot.docs.map((doc) => JobModel.fromFirestore(doc)).toList();
      // emit(PostJobSuccess(jobs: jobs));
    } catch (e) {
      emit(PostJobFailure(error: e.toString()));
    }
  }
}

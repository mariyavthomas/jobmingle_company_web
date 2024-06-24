import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:job_mingle_web/domain/company_model.dart';
import 'package:job_mingle_web/domain/job_model.dart';
import 'package:job_mingle_web/infrastructure/jobpostRepo.dart';
import 'package:meta/meta.dart';

part 'postjob_event.dart';
part 'postjob_state.dart';

class PostjobBloc extends Bloc<PostjobEvent, PostjobState> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final JobRepository jobRepository;
  PostjobBloc(this.jobRepository) : super(PostjobInitial()) {
    on<PostJobAdd>(_onAddJob);
    on<FetchJobs>(_onLoadJobs);
    on<DeleteJobPost>(_deletejobpost);
    on<UpdateJobPost>(_updateJob);
    
  }

  FutureOr<void> _onAddJob(PostJobAdd event, Emitter<PostjobState> emit) async {
    emit(PostJobLoadingState());
    print(event.job.dateofposting);
    try {
      await _firestore.collection('jobss').doc(event.job.jobid).set({
        'jobid':event.job.jobid,
        'companyuid': event.job.companyuid,
        'jobtitle': event.job.jobtitle,
        'jobdecripation': event.job.jobdecripation,
        'companyemail': event.job.companyemail,
        'jobaddress': event.job.jobaddress,
        'numberofopening': event.job.numberofopening,
        'timeofjobentering': event.job.timeofjobentering,
        'dateofposting': event.job.dateofposting,
        'experience': event.job.experience,
        'contactpersonprofile': event.job.contactpersonprofile,
        'contactpersonname': event.job.contactpersonname,
        'created_at': FieldValue.serverTimestamp(),
        'state':event.job.state,
        'country':event.job.country,
        'city':event.job.city,
        'skill':event.job.skill,
        'companyname':event.job.companyname,
        'contactpersonnumber':event.job.contactpersonnumber
      });
      print(event.job.dateofposting);
      emit(PostJobSuccess());
    } catch (e) {
      emit(PostJobFailure(error: e.toString()));
    }
  }

  FutureOr<void> _onLoadJobs(FetchJobs event, Emitter<PostjobState> emit) async {
    emit(PostJobLoadingState());
    try {
        print("helo");
        final jobs = await jobRepository.getJobsByCompany();
        print("mariya");
        print(jobs.length);
      emit(JobLoaded(jobs as List<JobModel>));
    } catch (e) {
      emit(PostJobFailure(error: e.toString()));
    }
  }

  FutureOr<void> _deletejobpost(DeleteJobPost event, Emitter<PostjobState> emit)async {
    emit(PostJobLoadingState());
   try{
    await jobRepository.deletejobpost(event.jobid);
    emit(PostJobDeleted());
   }catch(e){
       emit(PostJobFailure(error: e.toString()));
   }
  }

   Future<void> _updateJob(UpdateJobPost event, Emitter<PostjobState> emit) async {
    emit(PostJobLoadingState());
    try {
      await jobRepository.updatejob(event.job);
      emit(JobUpdated());
    } catch (e) {
      emit(PostJobFailure(error: e.toString()));
    }
  }
}

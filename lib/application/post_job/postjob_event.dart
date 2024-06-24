part of 'postjob_bloc.dart';

@immutable
sealed class PostjobEvent {
  @override
  List<Object> get props => [];
}

class PostJobAdd extends PostjobEvent {
  final JobModel job;
  PostJobAdd ({required this.job});
  @override
  List<Object> get props => [job];
}

class LoadJobs extends PostjobEvent {
  
}
class FetchJobs extends PostjobEvent{
  // final Companymodel  company;
  FetchJobs( );
  @override
   List<Object> get props => [];
}
class DeleteJobPost extends PostjobEvent{
  final String jobid;
  DeleteJobPost({ required this.jobid});
  @override
  List<Object> get props => [jobid];
}
class UpdateJobPost extends PostjobEvent{
  final JobModel job;
  UpdateJobPost({required this.job});
  @override
  List<Object> get props => [job];
}

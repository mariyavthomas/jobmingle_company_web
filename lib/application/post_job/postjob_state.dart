part of 'postjob_bloc.dart';

@immutable
abstract class PostjobState {}

class PostjobInitial extends PostjobState {}

class PostJobLoadingState extends PostjobState {}

class PostJobSuccess extends PostjobState {
  // final List<JobModel> jobs;

  PostJobSuccess();

  
  List<Object> get props => [];
}

class PostJobFailure extends PostjobState {
  final String error;

  PostJobFailure({required this.error});

  
  List<Object> get props => [error];

  @override
  String toString() => 'PostJobFailure { error: $error }';
}
class JobLoaded extends PostjobState{
  final List<JobModel> jobs;
  JobLoaded(this.jobs);
  
  List<Object> get props => [jobs];

}
class PostJobDeleted extends PostjobState{

}
class JobUpdated extends PostjobState {
  
  JobUpdated();

  List<Object> get props => [];
}
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

class LoadJobs extends PostjobEvent {}

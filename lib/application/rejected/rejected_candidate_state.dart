part of 'rejected_candidate_bloc.dart';

@immutable
sealed class RejectedCandidateState {}

final class RejectedCandidateInitial extends RejectedCandidateState {}

class RejectedLoading extends RejectedCandidateState {}

class RejectedSuccess extends RejectedCandidateState {}

class Rejectedcandidateloaded extends RejectedCandidateState {
  final List<RejectedCandidateModel> rejected;
  Rejectedcandidateloaded({required this.rejected});
}
class Rejectederror extends RejectedCandidateState{
final  String error;
  Rejectederror({required this.error});
}
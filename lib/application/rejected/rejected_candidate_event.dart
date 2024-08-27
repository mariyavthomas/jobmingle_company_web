part of 'rejected_candidate_bloc.dart';

@immutable
sealed class RejectedCandidateEvent {}

class RejectedCandidate extends RejectedCandidateEvent {
  final RejectedCandidateModel rejected;
  RejectedCandidate({required this.rejected});
}

class GetRejectedCandidate extends RejectedCandidateEvent {}

class SearchrejectedCandidate extends RejectedCandidateEvent{
   final String ?searchtext;
   SearchrejectedCandidate({required this.searchtext});
  
  List<Object> get props =>[searchtext!];
}

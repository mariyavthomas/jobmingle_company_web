part of 'candidate_bloc.dart';

@immutable
sealed class CandidateEvent {}

class LoadedCandidate extends CandidateEvent{}
class LoadedCandidateCompany extends CandidateEvent{}
// ignore: must_be_immutable
class CandidateShortlist extends CandidateEvent{
  String shortlist;
  CandidateShortlist({required this.shortlist});
}
// ignore: must_be_immutable
class Candidaterejected extends CandidateEvent{
  String rejected;
  Candidaterejected({required this.rejected});
}
class SearchJobEvent extends CandidateEvent{
 final String ?searchtext;
  SearchJobEvent({ this.searchtext});
   // ignore: override_on_non_overriding_member
   List<Object> get props =>[searchtext!];
}
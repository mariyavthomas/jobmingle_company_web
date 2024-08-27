part of 'shortlisted_candidate_bloc.dart';

@immutable
sealed class ShortlistedCandidateEvent {}

class AddedtoShortList extends ShortlistedCandidateEvent{
  final ShortListCandidatesModel shortlist;

  AddedtoShortList( {required this.shortlist});
  
}
class ShortListLoadeddata extends ShortlistedCandidateEvent{}

class SearchShortlist extends ShortlistedCandidateEvent{
   final String ?searchtext;
   SearchShortlist({required this.searchtext});
 
  List<Object> get props =>[searchtext!];
}

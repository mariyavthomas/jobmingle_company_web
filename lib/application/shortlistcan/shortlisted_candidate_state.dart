// ignore_for_file: must_be_immutable

part of 'shortlisted_candidate_bloc.dart';

@immutable
sealed class ShortlistedCandidateState {}

final class ShortlistedCandidateInitial extends ShortlistedCandidateState {}

//--------Loading the state -----------//

class ShortListLoading extends ShortlistedCandidateState {}

//---------Loaded all shortllisted------------//

// class ShortListloaded extends ShortlistedCandidateState {
//   final ShortListCandidatesModel shortlist;
//   ShortListloaded({required this.shortlist});
// }
//--------shortlistSuccess----------//

class ShortlistSucess extends ShortlistedCandidateState {}

//----------erroe mss---------------//

class ShortlistError extends ShortlistedCandidateState {
  String error;
  ShortlistError({required this.error});
}
//----------- Specific Company Applicants----------//

class ShortListCompanyloaded extends ShortlistedCandidateState {
  final List<ShortListCandidatesModel> shortlist1;
  ShortListCompanyloaded({required this.shortlist1});
}


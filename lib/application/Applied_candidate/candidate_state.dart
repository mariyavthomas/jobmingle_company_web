part of 'candidate_bloc.dart';

@immutable
sealed class CandidateState {}

final class CandidateInitial extends CandidateState {}

//-------------------LoadingState----------------------//

class Candidateloading extends CandidateState {}

//-------------------error State----------------------//

// ignore: must_be_immutable
class Candidatefailer extends CandidateState {
  String error;
  Candidatefailer({required this.error});

  List<Object> get props => [error];
}

//-------------------Loadedata for Applied candidate----------------------//

class CandidateLoadeddata extends CandidateState {
  final List<CandidateModel> candidate;
  CandidateLoadeddata({ required this.candidate});
  //List<Object> get props => [candidate];
}

//----------Loadedata specific companydata------------//
class CandidateCompanyLoadeddata extends CandidateState {
  final List<CandidateModel> candidate;
  CandidateCompanyLoadeddata({ required this.candidate});
  //List<Object> get props => [candidate];
}


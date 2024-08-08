part of 'candidate_bloc.dart';

@immutable
sealed class CandidateEvent {}

class LoadedCandidate extends CandidateEvent{}
class LoadedCandidateCompany extends CandidateEvent{}
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:job_mingle_web/domain/candidate_model.dart';
import 'package:job_mingle_web/infrastructure/candidateRepo.dart';
import 'package:meta/meta.dart';

part 'candidate_event.dart';
part 'candidate_state.dart';

class CandidateBloc extends Bloc<CandidateEvent, CandidateState> {
  final CandidateRepo candiadaterepo;
  CandidateBloc(this.candiadaterepo) : super(CandidateInitial()) {
    on<LoadedCandidate>(_getallCandidate);
    on<LoadedCandidateCompany>(_getspecificcompany);
    on<CandidateShortlist>(_shortlistaddd);
    on<SearchJobEvent>(_searchjob);
  }

  //------getAllCandidateData-------//

  FutureOr<void> _getallCandidate(
      LoadedCandidate event, Emitter<CandidateState> emit) async {
    emit(Candidateloading());

    try {
      print("than");
      final candidate = await candiadaterepo.getallcandidate();

      emit(CandidateLoadeddata(candidate: candidate));
    } catch (e) {
      emit(Candidatefailer(error: e.toString()));
    }
  }

  FutureOr<void> _getspecificcompany(
      LoadedCandidateCompany event, Emitter<CandidateState> emit) async {
    emit(Candidateloading());
    try {
      final candidate =
          await candiadaterepo.getspecificcompanyapplicantsStream();
      // print("applicants :${candidate.length}");
      await for (var stream in candidate) {
        emit(CandidateCompanyLoadeddata(candidate: stream));
      }

      print("applicants :${candidate.length}");
    } catch (e) {}
  }

  FutureOr<void> _shortlistaddd(
      CandidateShortlist event, Emitter<CandidateState> emit) async {
    emit(Candidateloading());
    try {} catch (e) {}
  }

  FutureOr<void> _searchjob(
      SearchJobEvent event, Emitter<CandidateState> emit) async {
    emit(Candidateloading());
    try {
      if (event.searchtext!.isNotEmpty) {
        List<CandidateModel> data =
            await candiadaterepo.searchJobs(event.searchtext!);
        emit(CandidateCompanyLoadeddata(candidate: data));
      } else {
        List<CandidateModel> data = await candiadaterepo.getallcandidate();
        emit(CandidateCompanyLoadeddata(candidate: data));
      }
    } catch (e) {
      emit(Candidatefailer(error: e.toString()));
    }
  }
}

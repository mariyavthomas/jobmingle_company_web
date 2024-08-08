import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:job_mingle_web/domain/shortlist_candidate.dart';
import 'package:job_mingle_web/infrastructure/shortlistRepo.dart';
import 'package:meta/meta.dart';

part 'shortlisted_candidate_event.dart';
part 'shortlisted_candidate_state.dart';

class ShortlistedCandidateBloc
    extends Bloc<ShortlistedCandidateEvent, ShortlistedCandidateState> {
  final ShortListRepo shortListRepo;
  ShortlistedCandidateBloc(this.shortListRepo)
      : super(ShortlistedCandidateInitial()) {
    on<AddedtoShortList>(_addedtoShortlist);
    on<ShortListLoadeddata>(_getShortlistapplicatescurrent);
  }

  FutureOr<void> _addedtoShortlist(
      AddedtoShortList event, Emitter<ShortlistedCandidateState> emit) async {
    emit(ShortListLoading());
    try {
      await shortListRepo.addshortlist(event.shortlist);
      emit(ShortlistSucess());
    } catch (e) {
      emit(ShortlistError(error: e.toString()));
    }
  }

  

 FutureOr<void> _getShortlistapplicatescurrent(ShortListLoadeddata event, Emitter<ShortlistedCandidateState> emit) async {
  emit(ShortListLoading());
  try {
    final shortlist = await shortListRepo.getspecificcompanyapplicants();
    emit(ShortListCompanyloaded(shortlist1: shortlist));
  } catch (e) {
    emit(ShortlistError(error: e.toString()));
  }
}
}

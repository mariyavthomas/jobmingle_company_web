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
    on<SearchShortlist>(_search);
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

  FutureOr<void> _search(SearchShortlist event, Emitter<ShortlistedCandidateState> emit)async {
     emit(ShortListLoading());
    try{
   if(event.searchtext!.isNotEmpty){
    List<ShortListCandidatesModel> data= await shortListRepo.searchJobs(event.searchtext!);
    emit(ShortListCompanyloaded(shortlist1: data));

   }else{
    List<ShortListCandidatesModel>data= await shortListRepo.getspecificcompanyapplicants();
    emit(ShortListCompanyloaded(shortlist1: data));
   }
  }catch(e){
      emit(ShortlistError(error: e.toString()));
  }
  }
  }


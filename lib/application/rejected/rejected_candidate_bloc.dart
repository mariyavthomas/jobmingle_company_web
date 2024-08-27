import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:job_mingle_web/domain/rejected_candidate.dart';
import 'package:job_mingle_web/infrastructure/rejectRepo.dart';
import 'package:meta/meta.dart';

part 'rejected_candidate_event.dart';
part 'rejected_candidate_state.dart';

class RejectedCandidateBloc extends Bloc<RejectedCandidateEvent, RejectedCandidateState> {
  final RejectedRepo rejectedRepo;
  RejectedCandidateBloc(this.rejectedRepo) : super(RejectedCandidateInitial()) {
   on<RejectedCandidate>(_rejectedcandidate);
   on<GetRejectedCandidate>(_getrejectedcandidates);
   on<SearchrejectedCandidate>(_search);
  }

  FutureOr<void> _rejectedcandidate(RejectedCandidate event, Emitter<RejectedCandidateState> emit) async{
    emit(RejectedLoading());
    try{
   await rejectedRepo.addrejectedlist(event.rejected);
   emit(RejectedSuccess());
    }catch(e){
      emit(Rejectederror(error: e.toString()));
    }
  }

  FutureOr<void> _getrejectedcandidates(GetRejectedCandidate event, Emitter<RejectedCandidateState> emit)async {
    emit(RejectedLoading());
    try{
   final rejectedlist =  await rejectedRepo.getSpecificrejectedcadidate();
     emit(Rejectedcandidateloaded(rejected: rejectedlist));
    }
     catch(e){
      emit(Rejectederror(error: e.toString()));
     }
  }

  FutureOr<void> _search(SearchrejectedCandidate event, Emitter<RejectedCandidateState> emit) async{
     emit(RejectedLoading());
    try{
   if(event.searchtext!.isNotEmpty){
    List<RejectedCandidateModel> data= await rejectedRepo.searchJobs(event.searchtext!);
    emit(Rejectedcandidateloaded(rejected: data));

   }else{
    List<RejectedCandidateModel>data= await rejectedRepo.getSpecificrejectedcadidate();
    emit(Rejectedcandidateloaded(rejected: data));
   }
  }catch(e){
      emit(Rejectederror(error: e.toString()));
  }
  }
  }


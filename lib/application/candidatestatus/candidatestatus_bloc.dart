import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:job_mingle_web/infrastructure/candidatestudes.dart';
import 'package:meta/meta.dart';
part 'candidatestatus_event.dart';
part 'candidatestatus_state.dart';

class CandidatestatusBloc extends Bloc<CandidatestatusEvent, CandidatestatusState> {
  final CandidateStatus candidateStatus;
  CandidatestatusBloc(this.candidateStatus) : super(CandidatestatusInitial()) {
    on<Fetchstatus>(_fechstatus);
     
  }

  FutureOr<void> _fechstatus(Fetchstatus event, Emitter<CandidatestatusState> emit) async {
  emit(StatusLoading());

  try {
    final stream = candidateStatus.getCandidatesWithStatusStream();
    await for (var status in stream) {
      emit(Candidatestatusloaded(status: status));
    }
  } catch (e) {
     // Use a specific state for errors
  }
}


  
}

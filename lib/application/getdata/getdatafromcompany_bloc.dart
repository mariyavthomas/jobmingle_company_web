import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:job_mingle_web/domain/company_model.dart';
import 'package:meta/meta.dart';

part 'getdatafromcompany_event.dart';
part 'getdatafromcompany_state.dart';

class GetdatafromcompanyBloc extends Bloc<GetdatafromcompanyEvent, GetdatafromcompanyState> {
  GetdatafromcompanyBloc() : super(GetdatafromcompanyInitial()) {
    on<GetdatafromcompanyEvent>(_compantdataget);
  }

  FutureOr<void> _compantdataget(GetdatafromcompanyEvent event, Emitter<GetdatafromcompanyState> emit)async {
   emit(Getdatafromcompanyloadingstate());
   try{
    
   }
   catch(e){

   }
  }
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:job_mingle_web/domain/company_model.dart';
import 'package:job_mingle_web/infrastructure/getdata.dart';
import 'package:meta/meta.dart';

part 'getdatafromcompany_event.dart';
part 'getdatafromcompany_state.dart';

class GetdatafromcompanyBloc
    extends Bloc<GetdatafromcompanyEvent, GetdatafromcompanyState> {
  GetdatafromcompanyBloc() : super(GetdatafromcompanyInitial()) {
    on<GetdatafromcompanyEvent>(_compantdataget);
    on<CompanydataaddedEvent>(_adddata);
    on<UpdateCompany>(_update);
    print("hhhh");
  }

  FutureOr<void> _compantdataget(GetdatafromcompanyEvent event,
      Emitter<GetdatafromcompanyState> emit) async {
    print("heloo");
    emit(Getdatafromcompanyloadingstate());
    print("heloo");
    try {
      var company = await CompanyGetDataRepo().getcompanydata();
      emit(Loadeddatafromcompanystate(user: company!));
    } catch (e) {}
  }

  FutureOr<void> _adddata(CompanydataaddedEvent event,
      Emitter<GetdatafromcompanyState> emit) async {
    emit(Getdatafromcompanyloadingstate());
    try {
      // ignore: unused_local_variable
      final company = await CompanyGetDataRepo().addcompanydata(
          event.summery,
          event.address,
          event.totalemployee,
          event.industry,
          event.recutername,
          event.payment);
      emit(Companydatasuccfully());
    } catch (e) {}
  }

  FutureOr<void> _update(
      UpdateCompany event, Emitter<GetdatafromcompanyState> emit) async {
    emit(Getdatafromcompanyloadingstate());
    try {
      await CompanyGetDataRepo().update(
          event.summery!,
          event.address!,
          event.totalemployee!,
          event.industry!,
          event.phone!,
          event.email!,
          event.password!);
      final company = await CompanyGetDataRepo().getcompanydata();
      emit(Loadeddatafromcompanystate(user: company!));
      emit(UpdateCompanySuccess());
    } catch (e) {
      print(e.toString());
    }
  }
}

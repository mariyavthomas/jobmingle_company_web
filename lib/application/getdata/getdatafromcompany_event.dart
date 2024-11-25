// ignore_for_file: must_be_immutable

part of 'getdatafromcompany_bloc.dart';

@immutable
class GetdatafromcompanyEvent {
  GetdatafromcompanyEvent();
}

class Getcompanydataevent extends GetdatafromcompanyEvent {}

class CompanydataaddedEvent extends Getcompanydataevent {
  String summery;
  String industry;
  String totalemployee;
  String address;
  String recutername;
  String payment;

  CompanydataaddedEvent(
      {required this.address,
      required this.industry,
      required this.recutername,
      required this.summery,
      required this.totalemployee,
      required this.payment});
}

class UpdateCompany extends GetdatafromcompanyEvent {
  String ?summery;
  String ?address;
  String ?totalemployee;
  String? industry;
  String ?phone;
  String ?email;
  String ?password;
  
  UpdateCompany({required this.address,required this.email,required this.industry,required this.password,required this.phone,required this.summery,required this.totalemployee});
}

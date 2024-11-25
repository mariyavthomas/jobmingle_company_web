part of 'getdatafromcompany_bloc.dart';

@immutable
sealed class GetdatafromcompanyState {
  GetdatafromcompanyState();

  List<Object> get props => [];
}

final class GetdatafromcompanyInitial extends GetdatafromcompanyState {}

class Getdatafromcompanyloadingstate extends GetdatafromcompanyState {}

class Loadeddatafromcompanystate extends GetdatafromcompanyState {
  final Companymodel user;
  Loadeddatafromcompanystate({required this.user});
  @override
  List<Object> get props => [user];
}

class Companydataadded extends Getcompanydataevent {
  final Companymodel user;
  Companydataadded({required this.user});
}

class Companydatasuccfully extends GetdatafromcompanyState {}

class UpdateCompanySuccess extends GetdatafromcompanyState {}

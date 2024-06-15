part of 'getdatafromcompany_bloc.dart';

@immutable
sealed class GetdatafromcompanyState {
  GetdatafromcompanyState();
   @override
  List<Object>get props=>[];
}

final class GetdatafromcompanyInitial extends GetdatafromcompanyState {}

class Getdatafromcompanyloadingstate extends GetdatafromcompanyState{}
class Loadeddatafromcompanystate extends GetdatafromcompanyState{
  Companymodel user;
  Loadeddatafromcompanystate({required this.user});
  @override
  List<Object>get props=>[user];
}

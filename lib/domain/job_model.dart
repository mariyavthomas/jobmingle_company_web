class JobModel {
  final jobname;
  List<dynamic > ?joblist;
  String ? jobid;
  String companyemail;
  String ?companyuid;
  String companyname;
  String jobtitle;
  String location;
  String numberofopening;
  String dateofposting;
  String timeofjobentering;
  String jobaddress;
  String experience;
  String contactpersonprofile;
  String contactpersonname;
  String skill;
  String jobdecripation;
  String contactpersonnumber;

  JobModel({
     this.jobid,
    this.jobname,
    this.joblist,
    required this.contactpersonnumber,
    required this.companyemail,
   this.companyuid,
    required this.companyname,
    required this.jobdecripation,
    required this.contactpersonname,
    required this.contactpersonprofile,
    required this.dateofposting,
    required this.experience,
    required this.jobaddress,
    required this.jobtitle,
    required this.location,
    required this.numberofopening,
    required this.skill,
    required this.timeofjobentering,
  });
  Map<String, dynamic> toJson() {
    return {
      'companyemail': companyemail,
      'companyuid': companyuid,
      'companyname': companyname,
      'jobtitle': jobtitle,
      'location': location,
      'numberofopening': numberofopening,
      'dateofposting': dateofposting,
      'timeofjobentering': timeofjobentering,
      'jobaddress': jobaddress,
      'experience': experience,
      'contactpersonprofile': contactpersonprofile,
      'contactpersonname': contactpersonname,
      'skill': skill,
      'jobdecripation': jobdecripation
      
    };
  }

  factory JobModel.fromJson(Map<String, dynamic> json) {
    return JobModel(
      jobname: json['jobname'] as String,
      jobid: json['j_id']  ?? "",
      joblist: json['joblist'] ?? "",
      companyemail: json['companyemail'] ?? "",
      companyuid: json['companyuid'] ?? "",
      companyname: json['companyname'] ?? "",
      contactpersonnumber: json['contacpersonmuber'],
      jobtitle: json['jobtitle'] ?? "",
      location: json['location'] ?? "",
      numberofopening: json['numberofopening'] ?? "",
      dateofposting: json['dateofposting'] ?? "",
      timeofjobentering: json['timeofjobentering'] ?? "",
      jobaddress: json['jobaddress'] ?? "",
      experience: json['experience'] ?? "",
      contactpersonprofile: json['contactpersonprofile'] ?? "",
      contactpersonname: json['contactpersonname'] ?? "",
      skill: json['skill'] ?? "",
      jobdecripation: json['jobdecripation'] ?? "",
    );
  }
}

import 'dart:html' as html;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_mingle_web/application/Applied_candidate/candidate_bloc.dart';
import 'package:job_mingle_web/application/candidatestatus/candidatestatus_bloc.dart';
import 'package:job_mingle_web/application/rejected/rejected_candidate_bloc.dart';
import 'package:job_mingle_web/application/shortlistcan/shortlisted_candidate_bloc.dart';
import 'package:job_mingle_web/domain/candidate_model.dart';
import 'package:job_mingle_web/domain/rejected_candidate.dart';
import 'package:job_mingle_web/domain/shortlist_candidate.dart';
import 'package:job_mingle_web/utils/customcolor.dart';
import 'package:job_mingle_web/utils/notification/notification.dart';
import 'package:lottie/lottie.dart';

class ListofCandidates extends StatefulWidget {
  const ListofCandidates({
    super.key,
    required this.width1,
  });

  final double width1;

  @override
  State<ListofCandidates> createState() => _ListofCandidatesState();
}

class _ListofCandidatesState extends State<ListofCandidates> {
  @override
  void initState() {
    super.initState();
    context.read<CandidateBloc>().add(LoadedCandidateCompany());
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double width1 = MediaQuery.of(context).size.width;
    // ignore: unused_local_variable
    double height2 = MediaQuery.of(context).size.height;
    return BlocBuilder<CandidateBloc, CandidateState>(
      builder: (context, state) {
        if (state is Candidateloading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is CandidateCompanyLoadeddata) {
          print("=====================================");
          print(state.candidate.length);
          if (state.candidate.isEmpty) {
            return Center(
              child: Lottie.asset('lib/assets/image/noting.json',
                  height: 100, width: 100),
            );
          }
          final candidate = state.candidate;
          print(candidate.length);
          print("djjjjjjjjjjj");
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.blue[100],
                ),
                width: widget.width1 * 0.99,
                child: DataTable(
                  columnSpacing: 10,
                  columns: [
                    DataColumn(label: Text('Name')),
                    DataColumn(label: Text('Job Title')),
                    DataColumn(
                      label: Container(
                        padding: EdgeInsets.all(8.0),
                        margin: EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.blue[100],
                        ),
                        child: Text('Experience'),
                      ),
                    ),
                    DataColumn(label: Text('Resume')),
                    DataColumn(label: Text('Current status')),
                    DataColumn(label: Text('Details About the Candidate')),
                  ],
                  rows: state.candidate.map((candidate) {
                    return DataRow(
                      cells: [
                        DataCell(Text(candidate.username.toUpperCase())),
                        DataCell(Text(candidate.jobtitle.toUpperCase())),
                        DataCell(Text(candidate.experience.toUpperCase())),
                        DataCell(TextButton.icon(
                          onPressed: () async {
                            await downloadPDF(context, candidate.userresume,
                                candidate.username);
                          },
                          icon: Icon(Icons.download),
                          label: Text("Resume"),
                        )),
                        DataCell(candidate.candidatestatus==null ? Text("Applied"):
                         Text(candidate.candidatestatus!),
                        ),
                        DataCell(IconButton(
                          onPressed: () {
                            showCandidateDetails(context, candidate);
                          },
                          icon: Icon(Icons.arrow_forward),
                        )),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          );
        } else if (state is Candidatefailer) {
          return Center(child: Text('Error: ${state.error}'));
        }
        return Center(
          child: Lottie.asset('lib/assets/image/noting.json',
              height: 400, width: 400),
        );
      },
    );
  }

  Future<void> downloadPDF(
      BuildContext context, String pdfUrl, String filename) async {
    try {
      // ignore: unused_local_variable
      final anchor = html.AnchorElement(href: pdfUrl)
        ..setAttribute('download', '$filename.pdf')
        ..setAttribute('target', '_blank')
        ..click();
    } catch (e) {
      print('Error downloading PDF: $e');
    }
  }

  void showCandidateDetails(BuildContext context, CandidateModel candidate) {
    bool _showprofession = false;
    bool _showpersonalinfo = false;
    double width1 = MediaQuery.of(context).size.width;
    // ignore: unused_local_variable
    double height2 = MediaQuery.of(context).size.height;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text('Candidate Details'),
              content: Container(
                width: width1 * 0.5,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(candidate.pic),
                          radius: 40,
                        ),
                        SizedBox(width: width1 * 0.01),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(candidate.username.toUpperCase()),
                            Text(candidate.usermailid),
                            Text(candidate.userphonenumber),
                          ],
                        )
                      ]),
                      Divider(color: Colors.black),
                      Text(candidate.userprofilesummery),
                      Divider(color: Colors.black),
                      SizedBox(height: height2 * 0.01),
                      Text('About ${candidate.username.toLowerCase()}',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: height2 * 0.01),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _showprofession = !_showprofession;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Professional Information"),
                            Icon(_showprofession
                                ? Icons.expand_less
                                : Icons.expand_more)
                          ],
                        ),
                      ),
                      if (_showprofession) ...[
                        SizedBox(height: height2 * 0.01),
                        Text("Profession : ${candidate.useruserjobtitle}"),
                        SizedBox(height: height2 * 0.01),
                        Text("Work Experience : ${candidate.userworkstatus}"),
                        SizedBox(height: height2 * 0.01),
                        Text(
                            "Current Industry : ${candidate.usercurrentindustry}"),
                        SizedBox(height: height2 * 0.01),
                        Text(
                            "Current Department : ${candidate.usercurrentdeparment}"),
                        SizedBox(height: height2 * 0.01),
                        Text(
                            "Current Category : ${candidate.usercurrentcategory}"),
                        SizedBox(height: height2 * 0.01),
                        Text("Education : ${candidate.usercourse}"),
                        SizedBox(height: height2 * 0.01),
                        Text("Language : ${candidate.usergender}"),
                        SizedBox(height: height2 * 0.01),
                        Text("Skill : ${candidate.userprofileheadlines}"),
                        SizedBox(height: height2 * 0.01),
                      ],
                      SizedBox(height: height2 * 0.01),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _showpersonalinfo = !_showpersonalinfo;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Personal Information"),
                            Icon(_showpersonalinfo
                                ? Icons.expand_less
                                : Icons.expand_more)
                          ],
                        ),
                      ),
                      if (_showpersonalinfo) ...[
                        SizedBox(height: height2 * 0.01),
                        Text("Gender : ${candidate.userlanguage}"),
                        SizedBox(height: height2 * 0.01),
                        Text("Address : ${candidate.useraddress}"),
                        SizedBox(height: height2 * 0.01),
                        Text("Current Location : ${candidate.usercurrentcity}"),
                        SizedBox(height: height2 * 0.01),
                        Text("Date of Birth : ${candidate.userdob}"),
                        SizedBox(height: height2 * 0.01),
                        Text("Home Town : ${candidate.userhometown}"),
                      ],
                      SizedBox(height: height2 * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.green)),
                            onPressed: () async {
                              ShortListCandidatesModel shortlistmodel =
                                  ShortListCandidatesModel(
                                appyuid: candidate.appyuid,
                                pic: candidate.pic,
                                companyuid: candidate.companyuid,
                                education: candidate.education,
                                experience: candidate.experience,
                                jobid: candidate.jobid,
                                skills: candidate.skills,
                                userid: candidate.userid,
                                username: candidate.username,
                                companyname: candidate.companyname,
                                experiencecomp: candidate.experiencecomp,
                                interviewtime: candidate.interviewtime,
                                jobaddress: candidate.jobaddress,
                                jobtiming: candidate.jobtiming,
                                jobtitle: candidate.jobtitle,
                                qualification: candidate.qualification,
                                salary: candidate.salary,
                                companycontactperson:
                                    candidate.companycontactperson,
                                companyphonenumber:
                                    candidate.companyphonenumber,
                                conpanycontactpersonumber:
                                    candidate.conpanycontactpersonumber,
                                usercourse: candidate.usercourse,
                                usercourseendingyear:
                                    candidate.usercourseendingyear,
                                usercousestaringyear:
                                    candidate.usercousestaringyear,
                                userexperence: candidate.userexperence,
                                usergrade: candidate.usergrade,
                                userhigereducation:
                                    candidate.userhigereducation,
                                usermailid: candidate.usermailid,
                                userphonenumber: candidate.userphonenumber,
                                userresume: candidate.userresume,
                                userspecialice: candidate.userspecialice,
                                useruniversity: candidate.useruniversity,
                                userprofileheadlines:
                                    candidate.userprofileheadlines,
                                userprofilesummery:
                                    candidate.userprofilesummery,
                                usergender: candidate.usergender,
                                userlanguage: candidate.userlanguage,
                                userdob: candidate.userdob,
                                useruserjobtitle: candidate.useruserjobtitle,
                                useraddress: candidate.useraddress,
                                userhometown: candidate.userhometown,
                                userpincode: candidate.userpincode,
                                userworkstatus: candidate.userworkstatus,
                                usercurrentcity: candidate.usercurrentcity,
                                usercurrentcategory:
                                    candidate.usercurrentcategory,
                                usercurrentdeparment:
                                    candidate.usercurrentdeparment,
                                usercurrentindustry:
                                    candidate.usercurrentindustry,
                                usercurrentjobrole:
                                    candidate.usercurrentjobrole,
                              );

                              // Perform a one-time query
                              final querySnapshot = await FirebaseFirestore
                                  .instance
                                  .collection('shortlist')
                                  .where('jobid', isEqualTo: candidate.jobid)
                                  .where('userid', isEqualTo: candidate.userid)
                                  .where('appyuid',
                                      isEqualTo: candidate.appyuid)
                                  .get();
                                   if (querySnapshot.docs.isNotEmpty) {
                                try {
                                  await FirebaseFirestore.instance
                                      .collection('rejected')
                                      .doc(querySnapshot.docs.first.id)
                                      .delete();
                                  TopNotification.show(
                                      context,
                                      "Document deleted successfully",
                                      CustomColor.green());
                                } catch (e) {
                                  print('Error deleting document: $e');
                                  TopNotification.show(
                                      context,
                                      "Failed to delete document",
                                      CustomColor.red());
                                }
                              } else {
                                TopNotification.show(
                                    context,
                                    "No document found to delete",
                                    CustomColor.green());
                              }

                              if (querySnapshot.docs.isNotEmpty) {
                                TopNotification.show(context,
                                    "Already ShortListed", CustomColor.red());
                              } else {
                                context.read<ShortlistedCandidateBloc>().add(
                                    AddedtoShortList(
                                        shortlist: shortlistmodel));
                                TopNotification.show(context, "Shortlisted",
                                    CustomColor.green());
                              }
                              final querySnapshot1 = await FirebaseFirestore
                                  .instance
                                  .collection('applyjob')
                                  .where('jobid', isEqualTo: candidate.jobid)
                                  .where('userid', isEqualTo: candidate.userid)
                                  .where('appyuid',
                                      isEqualTo: candidate.appyuid)
                                  .get();
                              await FirebaseFirestore.instance
                                  .collection('applyjob')
                                  .doc(candidate.appyuid)
                                  .update({"candidatestatus": "Shortlisted"});
                            },
                            child: Text("ShortList"),
                          ),
                          SizedBox(width: width1 * 0.01),
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.red)),
                            onPressed: () async {
                              // Create the RejectedCandidateModel object
                              final RejectedCandidateModel rejectedlist =
                                  RejectedCandidateModel(
                                appyuid: candidate.appyuid,
                                pic: candidate.pic,
                                education: candidate.education,
                                experience: candidate.experience,
                                jobid: candidate.jobid,
                                skills: candidate.skills,
                                userid: candidate.userid,
                                username: candidate.username,
                                companyname: candidate.companyname,
                                experiencecomp: candidate.experiencecomp,
                                interviewtime: candidate.interviewtime,
                                jobaddress: candidate.jobaddress,
                                jobtiming: candidate.jobtiming,
                                jobtitle: candidate.jobtitle,
                                qualification: candidate.qualification,
                                salary: candidate.salary,
                                companyuid: candidate.companyuid,
                                companycontactperson:
                                    candidate.companycontactperson,
                                companyphonenumber:
                                    candidate.companyphonenumber,
                                conpanycontactpersonumber:
                                    candidate.conpanycontactpersonumber,
                                usercourse: candidate.usercourse,
                                usercourseendingyear:
                                    candidate.usercourseendingyear,
                                usercousestaringyear:
                                    candidate.usercousestaringyear,
                                userexperence: candidate.userexperence,
                                usergrade: candidate.usergrade,
                                userhigereducation:
                                    candidate.userhigereducation,
                                usermailid: candidate.usermailid,
                                userphonenumber: candidate.userphonenumber,
                                userresume: candidate.userresume,
                                userspecialice: candidate.userspecialice,
                                useruniversity: candidate.useruniversity,
                                userprofileheadlines:
                                    candidate.userprofileheadlines,
                                userprofilesummery:
                                    candidate.userprofilesummery,
                                usergender: candidate.usergender,
                                userlanguage: candidate.userlanguage,
                                userdob: candidate.userdob,
                                useruserjobtitle: candidate.useruserjobtitle,
                                useraddress: candidate.useraddress,
                                userhometown: candidate.userhometown,
                                userpincode: candidate.userpincode,
                                userworkstatus: candidate.userworkstatus,
                                usercurrentcity: candidate.usercurrentcity,
                                usercurrentcategory:
                                    candidate.usercurrentcategory,
                                usercurrentdeparment:
                                    candidate.usercurrentdeparment,
                                usercurrentindustry:
                                    candidate.usercurrentindustry,
                                usercurrentjobrole:
                                    candidate.usercurrentjobrole,
                              );

                              // Check if the candidate is already in the rejected list
                              final querySnapshot = await FirebaseFirestore
                                  .instance
                                  .collection('rejected')
                                  .where('jobid', isEqualTo: candidate.jobid)
                                  .where('userid', isEqualTo: candidate.userid)
                                  .where('appyuid',
                                      isEqualTo: candidate.appyuid)
                                  .get();

                              if (querySnapshot.docs.isNotEmpty) {
                                TopNotification.show(context,
                                    "Already Rejected", CustomColor.red());
                              } else {
                                context.read<RejectedCandidateBloc>().add(
                                    RejectedCandidate(rejected: rejectedlist));
                                TopNotification.show(
                                    context, "Rejected", CustomColor.red());
                              }

                              // Now, define and fetch the shortlistSnapshot
                              final shortlistSnapshot = await FirebaseFirestore
                                  .instance
                                  .collection('shortlist')
                                  .where('jobid', isEqualTo: candidate.jobid)
                                  .where('userid', isEqualTo: candidate.userid)
                                  .where('appyuid',
                                      isEqualTo: candidate.appyuid)
                                  .get();

                              // Delete the document if it exists in the shortlist collection
                              if (shortlistSnapshot.docs.isNotEmpty) {
                                try {
                                  await FirebaseFirestore.instance
                                      .collection('shortlist')
                                      .doc(shortlistSnapshot.docs.first.id)
                                      .delete();
                                  TopNotification.show(
                                      context,
                                      "Document deleted successfully",
                                      CustomColor.green());
                                } catch (e) {
                                  print('Error deleting document: $e');
                                  TopNotification.show(
                                      context,
                                      "Failed to delete document",
                                      CustomColor.red());
                                }
                              } else {
                                TopNotification.show(
                                    context,
                                    "No document found to delete",
                                    CustomColor.green());
                              }
                              final querySnapshot3 = await FirebaseFirestore
                                  .instance
                                  .collection('applyjob')
                                  .where('jobid', isEqualTo: candidate.jobid)
                                  .where('userid', isEqualTo: candidate.userid)
                                  .where('appyuid',
                                      isEqualTo: candidate.appyuid)
                                  .get();
                              await FirebaseFirestore.instance
                                  .collection('applyjob')
                                  .doc(candidate.appyuid)
                                  .update({"candidatestatus": "Rejected"});
                            },
                            child: Text("Reject"),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Ok"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

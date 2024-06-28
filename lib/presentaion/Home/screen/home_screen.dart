import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:job_mingle_web/application/post_job/postjob_bloc.dart';
import 'package:job_mingle_web/domain/company_model.dart';
import 'package:job_mingle_web/presentaion/Home/home_methoda.dart';
import 'package:job_mingle_web/presentaion/Home/widgets/home_widget.dart';
import 'package:job_mingle_web/presentaion/Postnewjob/Screen/Post_new_job.dart';
import 'package:job_mingle_web/presentaion/Profile/screen/profile_screen.dart';


class CompanyHomeScreen extends StatefulWidget {
  const CompanyHomeScreen({super.key});

  @override
  State<CompanyHomeScreen> createState() => _CompanyHomeScreenState();
}

class _CompanyHomeScreenState extends State<CompanyHomeScreen> {
  @override
  void initState() {
    super.initState();
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final company = Companymodel(companyuid: user.uid);
      BlocProvider.of<PostjobBloc>(context).add(FetchJobs());
    }
  }
 bool isedit=true;
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double width1 = MediaQuery.of(context).size.width;
    // ignore: unused_local_variable
    double height2 = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 10,
              actions: [
                Row(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PostNewJob(isedit: false,)));
                        },
                        child: Text("POST NEW JOB")),
                    SizedBox(
                      width: 15,
                    ),
                    TextButton(onPressed: () {}, child: Text("PRICING")),
                    SizedBox(
                      width: 15,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Profile()));
                        },
                        child: Text("PROFILE")),
                    SizedBox(
                      width: 15,
                    ),
                    TextButton(
                        onPressed: () {
                          sigout(context);
                        },
                        child: Text("SIGN  OUT")),
                    SizedBox(
                      width: 100,
                    )
                  ],
                ),
              ],
              title: Padding(
                padding: const EdgeInsets.only(left: 80),
                child: Text(
                  'Job Mingle',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
            body: Container(
                width: 1700,
                decoration: BoxDecoration(color: Colors.blue[50]),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: "India’s ",
                          style: TextStyle(fontSize: 29, color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                              text: "Leading",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: " Employment Platform\n",
                            ),
                          ],
                        ),
                      ),
                    ),
                    Text(
                      "Find and recruit employees within 48 hours with Job Mingle",
                      style: TextStyle(fontSize: 25, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Container(
                        height: 400,
                        width: 1000,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    "lib/assets/image/undraw_career_progress_ivdb.png"))),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Homeexpanded(),
                  ],
                ))));
  }
}


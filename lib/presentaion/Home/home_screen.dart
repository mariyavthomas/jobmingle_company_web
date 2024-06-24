import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:job_mingle_web/application/post_job/postjob_bloc.dart';
import 'package:job_mingle_web/domain/company_model.dart';
import 'package:job_mingle_web/presentaion/Home/home_methoda.dart';
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
                    Expanded(
                      child: BlocBuilder<PostjobBloc, PostjobState>(
                        builder: (context, state) {
                          if (state is PostJobLoadingState) {
                            return Center(child: CircularProgressIndicator());
                          } else if (state is JobLoaded) {
                            print(state.jobs);
                            return GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                              
                                crossAxisCount: 3,
                                crossAxisSpacing: 10.0,
                                mainAxisSpacing: 10.0,
                                childAspectRatio: 3 / 2,
                              ),
                              itemCount: state.jobs.length,
                              itemBuilder: (BuildContext context, int index) {
                                final job = state.jobs[index];

                                print(job.companyemail);
                                print(job.jobdecripation);
                                print(job.jobtitle);
                                print(job.skill);
                                print(job.contactpersonnumber);
                                return Container(
//height: height2 *0.05,
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 245, 246, 247),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          job.jobtitle.toUpperCase(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.shopping_bag,
                                                color: Colors.grey),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              " 0-${job.experience} Experience",
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                              child: VerticalDivider(
                                                thickness: 2,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            Icon(
                                              Icons.location_on,
                                              color: Colors.grey,
                                            ),
                                            SizedBox(
                                              width: 45,
                                              child: SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: RichText(
                                                  text: TextSpan(
                                                    text: job.city,
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "Skills :${job.skill}",
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Contact Person Name: ${job.contactpersonname.toUpperCase()}",
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 1,
                                            ),
                                            IconButton(
                                              icon: Icon(
                                                Icons.delete,
                                                color: Colors.grey,
                                                size: 18,
                                              ),
                                              onPressed: () {
                                                FirebaseFirestore.instance
                                                    .collection('jobss')
                                                    .doc(job.jobid)
                                                    .delete();
                                                context
                                                    .read<PostjobBloc>()
                                                    .add(FetchJobs());
                                                //  Navigator.pop(context);
                                              },
                                            ),
                                             
                                        IconButton(
                                        onPressed: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>PostNewJob(isedit: true,job:job,)));
                                        },
                                        icon: Icon(
                                          Icons.edit,
                                          size: 20,
                                          color: Colors.grey,
                                        )),
                                          ],
                                        ),
                                        Text(
                                          'Profile of Conatct Person :${job.contactpersonprofile}',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                          ),
                                        ),
                                        
                                        
                                        SizedBox(
                                          height: 1,
                                        ),
                                        Text(
                                          'Conatct Number :${job.contactpersonnumber}',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                          ),
                                        ),
                                       
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          } else if (state is PostJobFailure) {
                            return Center(
                                // child: Text(state.)
                                );
                          } else {
                            return Center(child: Text('No jobs found.'));
                          }
                        },
                      ),
                    ),
                  ],
                ))));
  }
}

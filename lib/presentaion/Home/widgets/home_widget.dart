import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_mingle_web/application/post_job/postjob_bloc.dart';
import 'package:job_mingle_web/presentaion/Postnewjob/Screen/Post_new_job.dart';

class Homeexpanded extends StatelessWidget {
  const Homeexpanded({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
    );
  }
}

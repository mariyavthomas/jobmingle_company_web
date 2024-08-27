import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_mingle_web/application/post_job/postjob_bloc.dart';
import 'package:job_mingle_web/domain/job_model.dart';
import 'package:job_mingle_web/presentaion/Postnewjob/Screen/Post_new_job.dart';
import 'package:job_mingle_web/presentaion/home/widgets/body/searchjob.dart';
import 'package:job_mingle_web/utils/customcolor.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';

class AllJobs extends StatelessWidget {
  const AllJobs({super.key});

  @override
  Widget build(BuildContext context) {
    double width1 = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          Center(
              child: SearchPostJob(
                  height: height)), // Assuming the Search widget is defined
          Expanded(
            child: BlocBuilder<PostjobBloc, PostjobState>(
              builder: (context, state) {
                if (state is PostJobLoadingState) {
                  return Center(
                      child: LoadingAnimationWidget.stretchedDots(
                          color: CustomColor.bluelight(), size: 90));
                } else if (state is JobLoaded) {
                  if (state.jobs.isEmpty) {
                    return Center(
                      child: Lottie.asset('lib/assets/image/noting.json'),
                    );
                  }

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Container(
                        width: width1 * 0.99,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 245, 246, 247),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DataTable(
                            columnSpacing: width1 * 0.001,
                            columns: const [
                              DataColumn(label: Text('Title')),
                              DataColumn(label: Text('Number of Opening')),
                              DataColumn(label: Text('Location')),
                              DataColumn(label: Text('Experience')),
                              DataColumn(label: Text('Contact Person')),
                              DataColumn(label: Text('Delete/Edit')),
                              DataColumn(label: Text("Details")),
                            ],
                            rows: state.jobs.map((job) {
                              return DataRow(
                                cells: [
                                  DataCell(Text(job.jobtitle)),
                                  DataCell(Text(job.numberofopening)),
                                  DataCell(Text(job.state)),
                                  DataCell(Text(job.experience)),
                                  DataCell(Text(job.contactpersonname)),
                                  DataCell(Row(
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => PostNewJob(
                                                isedit: true,
                                                job: job,
                                              ),
                                            ),
                                          );
                                        },
                                        child: const Text("Edit"),
                                      ),
                                      const VerticalDivider(
                                        color: Colors.black,
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          _showDeleteConfirmation(context, job);
                                        },
                                        child: const Text("Delete"),
                                      ),
                                    ],
                                  )),
                                  DataCell(IconButton(
                                    onPressed: () {
                                      _showAlert(context, job);
                                    },
                                    icon: const Icon(Icons.arrow_forward_ios),
                                  )),
                                ],
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                  );
                } else if (state is PostJobFailure) {
                  return const Center(child: Text('Failed to load jobs.'));
                } else {
                  return Center(
                    child: Container(
                      child:
                          Lottie.asset('lib/assets/image/emtyanimation.json'),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showAlert(BuildContext context, JobModel job) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        double width1 = MediaQuery.of(context).size.width;
        // ignore: unused_local_variable
        double height2 = MediaQuery.of(context).size.height;
        return AlertDialog(
          title: const Text("Job Details"),
          content: Container(
            width: width1 * 0.5,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(job.jobdecripation),
                  const Divider(),
                  Text("Title: ${job.jobtitle}"),
                  Text("Location: ${job.state}"),
                  Text("Experience: ${job.experience}"),
                  Text(
                      "Contact Person: ${job.contactpersonname.toUpperCase()}"),
                  Text("Contact Person Number: ${job.contactpersonnumber}"),
                  Text("Job UID: ${job.jobuid}"),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  void _showDeleteConfirmation(BuildContext context, JobModel job) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm Deletion"),
          content:
              Text("Are you sure you want to delete the job: ${job.jobtitle}?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  await FirebaseFirestore.instance
                      .collection('jobss')
                      .doc(job.jobuid)
                      .delete();

                  context.read<PostjobBloc>().add(FetchJobs());

                  Navigator.of(context).pop(); // Close the dialog
                } catch (e) {
                  // Handle error
                  print("Error deleting job: $e");
                }
              },
              child: const Text("Delete"),
            ),
          ],
        );
      },
    );
  }
}

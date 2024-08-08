import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_mingle_web/application/post_job/postjob_bloc.dart';
import 'package:job_mingle_web/domain/job_model.dart';
import 'package:job_mingle_web/presentaion/Postnewjob/Screen/Post_new_job.dart';

class Contact_persondetails extends StatelessWidget {
  const Contact_persondetails({
    super.key,
    required this.job,
  });

  final JobModel job;

  @override
  Widget build(BuildContext context) {
    return Row(
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
                .doc(job.jobuid)
                .delete();
            context.read<PostjobBloc>().add(FetchJobs());
            //  Navigator.pop(context);
          },
        ),
        IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PostNewJob(
                            isedit: true,
                            job: job,
                          )));
            },
            icon: Icon(
              Icons.edit,
              size: 20,
              color: Colors.grey,
            )),
      ],
    );
  }
}

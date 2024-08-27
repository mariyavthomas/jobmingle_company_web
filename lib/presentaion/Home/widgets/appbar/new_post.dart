import 'package:flutter/material.dart';
import 'package:job_mingle_web/presentaion/Postnewjob/Screen/Post_new_job.dart';

class Postnewjob extends StatelessWidget {
  const Postnewjob({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PostNewJob(isedit: false,)));
        },
        child: Text("POST NEW JOB"));
  }
}


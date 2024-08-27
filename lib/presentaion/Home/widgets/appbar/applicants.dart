import 'package:flutter/material.dart';
import 'package:job_mingle_web/presentaion/applicants/screen/allapplicant_screen.dart';

class Applicantshome extends StatelessWidget {
  const Applicantshome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>AllApplicant()));
    }, child: Text("Applicants"));
  }
}
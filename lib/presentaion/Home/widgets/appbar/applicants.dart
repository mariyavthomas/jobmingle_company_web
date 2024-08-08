import 'package:flutter/material.dart';
import 'package:job_mingle_web/presentaion/Applicants/screen/allapplicant_screen.dart';

class Applicants extends StatelessWidget {
  const Applicants({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>AllApplicant()));
    }, child: Text("Applicants"));
  }
}
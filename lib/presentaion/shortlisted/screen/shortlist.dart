import 'package:flutter/material.dart';
import 'package:job_mingle_web/presentaion/shortlisted/screen/allshortlist.dart';
import 'package:job_mingle_web/presentaion/shortlisted/widgets/searchshortlist.dart';

class Shortlist extends StatelessWidget {
  const Shortlist({super.key});

  @override
  Widget build(BuildContext context) {
    double width1 = MediaQuery.of(context).size.width;
    // ignore: unused_local_variable
    double height2 = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          SearchShortList(height: height2),
          SizedBox(
            height: height2 *0.01,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(alignment: Alignment.centerLeft,
            child: Text('All Short Listed Applicants',style:  TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
          ),
          ListShortList(width1: width1)
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:job_mingle_web/presentaion/rejected_candidate/screen/Listofcandidate.dart';
import 'package:job_mingle_web/presentaion/rejected_candidate/wigets/searchrejected.dart';

class RejectedCandidates extends StatelessWidget {
  const RejectedCandidates({super.key});

  @override
  Widget build(BuildContext context) {
     // ignore: unused_local_variable
     double width1 = MediaQuery.of(context).size.width;
    // ignore: unused_local_variable
    double height2 = MediaQuery.of(context).size.height;
    return Scaffold(
       body: Column(
        children: [
          SearchRejectedCandidate(height: height2),
          SizedBox(
            height: height2 *0.01,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(alignment: Alignment.centerLeft,
            child: Text('All Rejected Candidates',style:  TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
          ),
          RejectedList()

        ],
       ),
    );
  }
}
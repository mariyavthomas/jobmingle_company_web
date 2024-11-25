import 'package:flutter/material.dart';
import 'package:job_mingle_web/domain/candidate_model.dart';

class CandidateDetailScreen extends StatefulWidget {
  const CandidateDetailScreen({super.key, required this.candidate});

  final CandidateModel candidate;

  @override
  State<CandidateDetailScreen> createState() => _CandidateDetailScreenState();
}

class _CandidateDetailScreenState extends State<CandidateDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Container(

          decoration: BoxDecoration(border: Border.all()) ,
          child: Row(
            children: [
              Column(
                children: [
                   Text("Highest Education :${widget.candidate.userhigereducation}")
                ],
              )
            ],
          ),
        )
      )),
    );
  }
}

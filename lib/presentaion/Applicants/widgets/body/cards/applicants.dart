import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_mingle_web/application/Applied_candidate/candidate_bloc.dart';
import 'package:job_mingle_web/presentaion/applicants/screen/allapplicant_screen.dart';

class Applicants extends StatelessWidget {
  const Applicants({
    super.key,
    required this.width1,
    required this.height2,
  });

  final double width1;
  final double height2;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CandidateBloc, CandidateState>(
      builder: (context, state) {
        if (state is CandidateCompanyLoadeddata) {
          // ignore: unused_local_variable
          final applicants = state.candidate;
          print("heloo");
          return InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AllApplicant()));
            },
            child: Card(
              elevation: 10,
              child: Center(
                child: Container(
                  width: width1 * 0.1,
                  height: height2 * 0.2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(9))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Stack(children: [
                        Text(
                          "Applicants",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: Text(state.candidate.length.toString()),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, left: 110),
                          child: CircleAvatar(
                            backgroundColor: Color.fromARGB(255, 20, 159, 239),
                            child: Icon(
                              Icons.document_scanner_sharp,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        )
                      ]),
                    ),
                  ),
                ),
              ),
            ),
          );
        }
        return InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AllApplicant()));
          },
          child: Card(
            elevation: 10,
            child: Center(
              child: Container(
                width: width1 * 0.1,
                height: height2 * 0.2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(9))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Stack(children: [
                      Text(
                        "Applicants",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                        
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Text('0'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 110),
                        child: CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 20, 159, 239),
                          child: Icon(
                            Icons.document_scanner_sharp,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      )
                    ]),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_mingle_web/application/rejected/rejected_candidate_bloc.dart';
import 'package:job_mingle_web/presentaion/rejected_candidate/screen/Listofcandidate.dart';
import 'package:job_mingle_web/presentaion/rejected_candidate/screen/rejected.dart';

class Rejected extends StatelessWidget {
  const Rejected({
    super.key,
   
  });

  

  @override
  Widget build(BuildContext context) {
      // ignore: unused_local_variable
    double width1 = MediaQuery.of(context).size.width;
    // ignore: unused_local_variable
    double height2 = MediaQuery.of(context).size.height;
    return BlocBuilder<RejectedCandidateBloc, RejectedCandidateState>(
      builder: (context, state) {
        if (state is Rejectedcandidateloaded) {
          final rejectedcandidatelist = state.rejected;
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RejectedCandidates()));
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
                          "Rejected",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: Text(rejectedcandidatelist.length.toString(),
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, left: 110),
                          child: CircleAvatar(
                            backgroundColor: Color.fromARGB(255, 225, 120, 120),
                            child: Icon(
                              Icons.error,
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
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RejectedList(
                         
                        )));
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
                        "Rejected",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: Text("0",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 110),
                        child: CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 225, 120, 120),
                          child: Icon(
                            Icons.error,
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

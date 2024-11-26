import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_mingle_web/application/shortlistcan/shortlisted_candidate_bloc.dart';

import 'package:job_mingle_web/presentaion/shortlisted/screen/shortlist.dart';

class ShortListed extends StatelessWidget {
  const ShortListed({
    super.key,
    required this.width1,
    required this.height2,
  });

  final double width1;
  final double height2;

  @override
  Widget build(BuildContext context) {
     double width1 = MediaQuery.of(context).size.width;

    // ignore: unused_local_variable
    double height2 = MediaQuery.of(context).size.height;
    return BlocBuilder<ShortlistedCandidateBloc, ShortlistedCandidateState>(
      builder: (context, state) {
        if (state is ShortListCompanyloaded) {
          final shortlistedcandidates = state.shortlist1;
          return InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Shortlist()));
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
                          "ShortList",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: Text(shortlistedcandidates.length.toString(),
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, left: 110),
                          child: CircleAvatar(
                            maxRadius: 25,
                            backgroundColor: Color.fromARGB(255, 182, 125, 215),
                            child: Icon(
                              Icons.meeting_room,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
              ),
            ),
          );
        }
        return Card(
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
                      "ShortList",
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
                        maxRadius: 25,
                        backgroundColor: Color.fromARGB(255, 182, 125, 215),
                        child: Icon(
                          Icons.meeting_room,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

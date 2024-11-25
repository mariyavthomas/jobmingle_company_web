
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_mingle_web/application/post_job/postjob_bloc.dart';
import 'package:job_mingle_web/presentaion/Home/widgets/body/home_widget.dart';

class AllPostedjob extends StatelessWidget {
  const AllPostedjob({
    super.key,
    required this.width1,
    required this.height2,
  });

  final double width1;
  final double height2;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostjobBloc, PostjobState>(
      builder: (context, state) {
        if (state is JobLoaded) {
          final job = state.jobs;
          return InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AllJobs()));
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
                          "All Jobs",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: Text(job.length.toString(),
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, left: 110),
                          child: CircleAvatar(
                            backgroundColor: Color.fromARGB(255, 242, 144, 39),
                            child: Icon(
                              Icons.local_offer,
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
                context, MaterialPageRoute(builder: (context) => AllJobs()));
          },
          child: Card(
            elevation: 10,
            child: Center(
              child: Container(
                width: width1 * 0.2,
                height: height2 * 0.2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(9))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Stack(children: [
                      Text(
                        "All Jobs",
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
                          backgroundColor: Color.fromARGB(255, 242, 144, 39),
                          child: Icon(
                            Icons.local_offer,
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

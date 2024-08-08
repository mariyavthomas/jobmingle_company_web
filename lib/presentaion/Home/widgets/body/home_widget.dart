import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_mingle_web/application/post_job/postjob_bloc.dart';
import 'package:job_mingle_web/presentaion/Home/widgets/body/list_of_data.dart';


class Homeexpanded extends StatelessWidget {
  const Homeexpanded({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<PostjobBloc, PostjobState>(
        builder: (context, state) {
          if (state is PostJobLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is JobLoaded) {
            print(state.jobs);
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 3 / 2,
              ),
              itemCount: state.jobs.length,
              itemBuilder: (BuildContext context, int index) {
                final job = state.jobs[index];

                return List_data(job: job);
              },
            );
          } else if (state is PostJobFailure) {
            return Center(
                // child: Text(state.)
                );
          } else {
            return Center(child: Text('No jobs found.'));
          }
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_mingle_web/application/Applied_candidate/candidate_bloc.dart';
import 'package:job_mingle_web/presentaion/applicants/widgets/body/candidate/cutom_table.dart';
import 'package:lottie/lottie.dart';

class ListofCandidates extends StatefulWidget {
  const ListofCandidates({
    super.key,
    required this.width1,
  });

  final double width1;

  @override
  State<ListofCandidates> createState() => _ListofCandidatesState();
}

class _ListofCandidatesState extends State<ListofCandidates> {
  @override
  void initState() {
    super.initState();
    context.read<CandidateBloc>().add(LoadedCandidateCompany());
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double width1 = MediaQuery.of(context).size.width;
    // ignore: unused_local_variable
    double height2 = MediaQuery.of(context).size.height;
    return BlocBuilder<CandidateBloc, CandidateState>(
      builder: (context, state) {
        if (state is Candidateloading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is CandidateCompanyLoadeddata) {
          print("=====================================");
          print(state.candidate.length);
          if (state.candidate.isEmpty) {
            return Center(
              child: Lottie.asset('lib/assets/image/noting.json',
                  height: 100, width: 100),
            );
          }
          final candidate = state.candidate;
          print(candidate.length);
          print("djjjjjjjjjjj");
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.blue[100],
                  ),
                  width: widget.width1 * 0.99,
                  child: CustomTable(candidates: state.candidate)),
            ),
          );
        } else if (state is Candidatefailer) {
          return Center(child: Text('Error: ${state.error}'));
        }
        return Center(
          child: Lottie.asset('lib/assets/image/noting.json',
              height: 400, width: 400),
        );
      },
    );
  }
}

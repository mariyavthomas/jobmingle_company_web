import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_mingle_web/application/Applied_candidate/candidate_bloc.dart';
import 'package:job_mingle_web/application/post_job/postjob_bloc.dart';
import 'package:job_mingle_web/application/rejected/rejected_candidate_bloc.dart';
import 'package:job_mingle_web/application/shortlistcan/shortlisted_candidate_bloc.dart';
import 'package:job_mingle_web/presentaion/applicants/widgets/body/candidate/custom_colum.dart';


class AllApplicant extends StatefulWidget {
  const AllApplicant({super.key});

  @override
  State<AllApplicant> createState() => _AllApplicantState();
}

class _AllApplicantState extends State<AllApplicant> {
  @override
  void initState() {
    super.initState();
    context.read<CandidateBloc>().add(LoadedCandidateCompany());
    context.read<ShortlistedCandidateBloc>().add(ShortListLoadeddata());
    context.read<RejectedCandidateBloc>().add(GetRejectedCandidate());
     context.read<PostjobBloc>().add(FetchJobs());
  }

  @override
  Widget build(BuildContext context) {
    double width1 = MediaQuery.of(context).size.width;
    // ignore: unused_local_variable
    double height2 = MediaQuery.of(context).size.height;
    return Scaffold(
      body: CustomColum(width1: width1, height2: height2),
    );
  }
}

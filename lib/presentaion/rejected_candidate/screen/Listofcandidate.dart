import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_mingle_web/application/Applied_candidate/candidate_bloc.dart';
import 'package:job_mingle_web/application/rejected/rejected_candidate_bloc.dart';
import 'package:job_mingle_web/domain/shortlist_candidate.dart';
import 'package:job_mingle_web/presentaion/shortlisted/widgets/showdetail.dart';


class RejectedList extends StatefulWidget {
  const RejectedList({
    super.key,
    required this.width1,
  });

  final double width1;

  @override
  State<RejectedList> createState() => _RejectedListState();
}

class _RejectedListState extends State<RejectedList> {
  @override
  void initState() {
    context.read<RejectedCandidateBloc>().add(GetRejectedCandidate());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double width1 = MediaQuery.of(context).size.width;
    // ignore: unused_local_variable
    double height2 = MediaQuery.of(context).size.height;
    return BlocBuilder<RejectedCandidateBloc, RejectedCandidateState>(
      builder: (context, state) {
        if (state is RejectedLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is Rejectedcandidateloaded) {
          final candidateshortlist = state.rejected;
          print(candidateshortlist.length);
          print("djjjjjjjjjjj");
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                 
                ),
                width: widget.width1 * 0.99,
                child: DataTable(
                  columnSpacing: 10,
                  columns: [
                    DataColumn(label: Text('Name')),
                    DataColumn(label: Text('Job Title')),
                    DataColumn(
                      label: Container(
                        padding: EdgeInsets.all(8.0),
                        margin: EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          
                        ),
                        child: Text('Experience'),
                      ),
                    ),
                    DataColumn(label: Text('Resume')),
                   
                    DataColumn(label: Text('Details About the Candidate')),
                  ],
                  rows: state.rejected.map((candidate) {
                    return DataRow(
                      cells: [
                        DataCell(Text(candidate.username.toUpperCase())),
                        DataCell(Text(candidate.jobtitle.toUpperCase())),
                        DataCell(Text(candidate.experience.toUpperCase())),
                        DataCell(TextButton.icon(
                          onPressed: () async {
                            await downloadPDF(context, candidate.userresume,
                                candidate.username);
                          },
                          icon: Icon(Icons.download),
                          label: Text("Resume"),
                        )),
                      
                        DataCell(IconButton(
                          onPressed: () {
                            showCandidateDetails(context, candidate as ShortListCandidatesModel);
                          },
                          icon: Icon(Icons.arrow_forward),
                        )),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          );
        } else if (state is Candidatefailer) {
          return Center(child: Text('Error:'));
        }
        return Center(child: Text('No data available'));
      },
    );
  }

  Future<void> downloadPDF(
      BuildContext context, String pdfUrl, String filename) async {
    try {
      // ignore: unused_local_variable
      final anchor = html.AnchorElement(href: pdfUrl)
        ..setAttribute('download', '$filename.pdf')
        ..setAttribute('target', '_blank')
        ..click();
    } catch (e) {
      print('Error downloading PDF: $e');
    }
  }

 
}

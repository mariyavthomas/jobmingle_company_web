import 'package:flutter/material.dart';
import 'package:job_mingle_web/domain/candidate_model.dart';
import 'package:job_mingle_web/infrastructure/downloadpdfRepo.dart';

class CustomTable extends StatelessWidget {
  final List<CandidateModel> candidates; // Expect a list of candidates

  CustomTable({
    super.key,
    required this.candidates,
  });

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columnSpacing: 8,
      columns: [
        DataColumn(label: Text('Name')),
        DataColumn(label: Text('Job Title')),
        DataColumn(
          label: Container(
            padding: EdgeInsets.all(8.0),
            margin: EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.blue[100],
            ),
            child: Text('Experience'),
          ),
        ),
        DataColumn(label: Text('Resume')),
        DataColumn(label: Text('Current Status')),
        DataColumn(label: Text('Details About')),
      ],
      rows: candidates.map((candidate) {
        return DataRow(
          cells: [
            DataCell(Text(candidate.username.toUpperCase())),
            DataCell(Text(candidate.jobtitle.toUpperCase())),
            DataCell(Text(candidate.experience.toUpperCase())),
            DataCell(TextButton.icon(
              onPressed: () async {
                // Uncomment and implement downloadPDF function
                await MethodRepo().downloadPDF(
                    context, candidate.userresume, candidate.username);
              },
              icon: Icon(Icons.download),
              label: Text("Resume"),
            )),
            DataCell(
              Text(candidate.candidatestatus ?? "Applied"),
            ),
            DataCell(IconButton(
              onPressed: () {
                // Uncomment and implement showCandidateDetails function
                MethodRepo().showCandidateDetails(context, candidate);
              },
              icon: Icon(Icons.arrow_forward),
            )),
          ],
        );
      }).toList(),
    );
  }
}

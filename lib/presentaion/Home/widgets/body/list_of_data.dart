import 'package:flutter/material.dart';
import 'package:job_mingle_web/domain/job_model.dart';
import 'package:job_mingle_web/presentaion/Home/widgets/body/contact_person.dart';
import 'experience.dart';

class List_data extends StatelessWidget {
  const List_data({
    super.key,
    required this.job,
  });

  final JobModel job;

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
          color: Color.fromARGB(255, 245, 246, 247),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              job.jobtitle.toUpperCase(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Experience(job: job),
            SizedBox(
              height: 5,
            ),
            Text(
              "Skills :${job.skill}",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
            Contact_persondetails(job: job),
            Text(
              'Profile of Conatct Person :${job.contactpersonprofile}',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: 1,
            ),
            Text(
              'Conatct Number :${job.contactpersonnumber}',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


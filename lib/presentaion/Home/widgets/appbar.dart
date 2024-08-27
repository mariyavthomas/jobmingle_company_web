import 'package:flutter/material.dart';
import 'package:job_mingle_web/presentaion/home/widgets/appbar/applicants.dart';
import 'package:job_mingle_web/presentaion/home/widgets/appbar/new_post.dart';
//import 'package:job_mingle_web/presentaion/home/widgets/appbar/profilehome.dart';
import 'package:job_mingle_web/presentaion/home/widgets/appbar/signout.dart';
import 'package:job_mingle_web/presentaion/profile/screen/profile_screen.dart';

class Homeappbar extends StatelessWidget {
  const Homeappbar({
    super.key,
    required this.width1,
  });

  final double width1;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 10,
      actions: [
        Row(
          children: [
            Postnewjob(),
            SizedBox(width: width1 * 0.015),
            Applicantshome(),
            SizedBox(width: width1 * 0.015),
            Profilemain(),
            SizedBox(width: width1 * 0.015),
            Signout(),
            SizedBox(width: width1 * 0.1),
          ],
        ),
      ],
      title: Padding(
        padding: const EdgeInsets.only(left: 80),
        child: Text(
          'Job Mingle',
          style: TextStyle(color: Colors.blue),
        ),
      ),
    );
  }
}

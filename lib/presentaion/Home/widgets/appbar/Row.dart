import 'package:flutter/material.dart';
import 'package:job_mingle_web/presentaion/Applicants/widgets/body/cards/applicants.dart';
import 'package:job_mingle_web/presentaion/Home/widgets/appbar/new_post.dart';
import 'package:job_mingle_web/presentaion/Home/widgets/appbar/signout.dart';
import 'package:job_mingle_web/presentaion/Profile/screen/profile_screen.dart';

class RowAppbar extends StatelessWidget {
  const RowAppbar({
    super.key, 
  });

  @override
  Widget build(BuildContext context) {
     // ignore: unused_local_variable
    double width1 = MediaQuery.of(context).size.width;
    // ignore: unused_local_variable
    double height2 = MediaQuery.of(context).size.height;
    return Row(
      children: [
        Postnewjob(),
        SizedBox(
          width: 15,
        ),
        Applicants(width1:width1 , height2:height2 ,),
        SizedBox(
          width: 15,
        ),
        Profile(),
        SizedBox(
          width: 15,
        ),
        Signout(),
        SizedBox(
          width: 100,
        )
      ],
    );
  }
}
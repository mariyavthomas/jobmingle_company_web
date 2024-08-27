
import 'package:flutter/material.dart';
import 'package:job_mingle_web/presentaion/applicants/widgets/body/cards/applicants.dart';
import 'package:job_mingle_web/presentaion/applicants/widgets/body/cards/postedjobs.dart';
import 'package:job_mingle_web/presentaion/applicants/widgets/body/cards/rejected_card.dart';
import 'package:job_mingle_web/presentaion/applicants/widgets/body/cards/shortlist.dart';

class CutomColum extends StatefulWidget {
  const CutomColum({
    super.key,
  });

  @override
  State<CutomColum> createState() => _CutomColumState();
}

class _CutomColumState extends State<CutomColum> {
  @override
  void initState() {
   
    super.initState();
    //context.read<Bloc>()
  }
  @override
  Widget build(BuildContext context) {

    double width1 = MediaQuery.of(context).size.width;

    // ignore: unused_local_variable
    double height2 = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(
          height: height2 * 0.01,
        ),
        Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: "India’s ",
              style: TextStyle(fontSize: 29, color: Colors.black),
              children: <TextSpan>[
                TextSpan(
                  text: "Leading",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: " Employment Platform\n",
                ),
              ],
            ),
          ),
        ),
        Text(
          "Find and recruit employees within 48 hours with Job Mingle",
          style: TextStyle(fontSize: 25, color: Colors.grey),
        ),
        SizedBox(
          height: height2 * 0.01,
        ),
        Center(
          child: Container(
            height: height2 * 0.4,
            width: width1 * 1,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "lib/assets/image/undraw_career_progress_ivdb.png"))),
          ),
        ),
        SizedBox(
          height: height2 * 0.1,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: width1 * 0.02,
            ),
            Applicants(width1: width1, height2: height2),
            SizedBox(
              width: width1 * 0.02,
            ),
            ShortListed(width1: width1, height2: height2),
            SizedBox(
              width: width1 * 0.02,
            ),
            AllPostedjob(width1: width1, height2: height2),
            SizedBox(
              width: width1 * 0.02,
            ),
            Rejected(width1: width1, height2: height2)
          ],
        ),
      ],
    );
  }
}

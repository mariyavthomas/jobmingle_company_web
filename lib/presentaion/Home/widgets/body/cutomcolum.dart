import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
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
  Widget build(BuildContext context) {
    double width1 = MediaQuery.of(context).size.width;
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
                    "lib/assets/image/undraw_career_progress_ivdb.png"),
              ),
            ),
          ),
        ),
        SizedBox(
          height: height2 * 0.1,
        ),
        AnimationLimiter(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: AnimationConfiguration.toStaggeredList(
              duration: const Duration(seconds: 2),
              childAnimationBuilder: (widget) => SlideAnimation(
                horizontalOffset: 50.0,
                child: FadeInAnimation(
                  child: widget,
                ),
              ),
              children: [
                Applicants(width1: width1, height2: height2),
                ShortListed(width1: width1, height2: height2),
                AllPostedjob(width1: width1, height2: height2),
                Rejected(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

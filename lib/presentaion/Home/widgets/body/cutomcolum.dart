import 'package:flutter/material.dart';
import 'package:job_mingle_web/presentaion/Home/widgets/body/home_widget.dart';

class CutomColum extends StatelessWidget {
  const CutomColum({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
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
          height: 10,
        ),
        Center(
          child: Container(
            height: 400,
            width: 1000,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "lib/assets/image/undraw_career_progress_ivdb.png"))),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Homeexpanded(),
      ],
    );
  }
}


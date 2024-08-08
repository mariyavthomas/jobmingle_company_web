import 'package:flutter/material.dart';
import 'package:job_mingle_web/domain/job_model.dart';

class Experience extends StatelessWidget {
  const Experience({
    super.key,
    required this.job,
  });

  final JobModel job;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.shopping_bag, color: Colors.grey),
        SizedBox(
          width: 10,
        ),
        Text(
          " 0-${job.experience} Experience",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        ),
        SizedBox(
          height: 10,
          child: VerticalDivider(
            thickness: 2,
            color: Colors.grey,
          ),
        ),
        Icon(
          Icons.location_on,
          color: Colors.grey,
        ),
        SizedBox(
          width: 45,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: RichText(
              text: TextSpan(
                text: job.city,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:job_mingle_web/presentaion/Applicants/widgets/body/candidate/candidatelist.dart';
import 'package:job_mingle_web/presentaion/Applicants/widgets/body/candidate/search.dart';
import 'package:job_mingle_web/presentaion/Applicants/widgets/body/cards/applicants.dart';
import 'package:job_mingle_web/presentaion/Applicants/widgets/body/cards/offer_send.dart';
import 'package:job_mingle_web/presentaion/Applicants/widgets/body/cards/rejected_card.dart';
import 'package:job_mingle_web/presentaion/Applicants/widgets/body/cards/shortlist.dart';

class CustomColum extends StatelessWidget {
  const CustomColum({
    super.key,
    required this.width1,
    required this.height2,
  });

  final double width1;
  final double height2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
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
              OfferSend(width1: width1, height2: height2),
              SizedBox(
                width: width1 * 0.02,
              ),
              Rejected(width1: width1, height2: height2)
            ],
          ),
        ),
        Search(width1: width1),
        ListofCandidates(width1: width1),
        SizedBox(
          height: height2 * 0.03,
        )
      ],
    );
  }
}


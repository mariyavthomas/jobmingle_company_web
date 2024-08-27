import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_mingle_web/application/Applied_candidate/candidate_bloc.dart';
import 'package:job_mingle_web/application/candidatestatus/candidatestatus_bloc.dart';
import 'package:job_mingle_web/application/post_job/postjob_bloc.dart';
import 'package:job_mingle_web/application/rejected/rejected_candidate_bloc.dart';
import 'package:job_mingle_web/application/shortlistcan/shortlisted_candidate_bloc.dart';
import 'package:job_mingle_web/presentaion/home/widgets/appbar.dart';
import 'package:job_mingle_web/presentaion/home/widgets/body/cutomcolum.dart';
import 'package:job_mingle_web/presentaion/paymet/screen/payment.dart';
import 'package:sidebar_with_animation/animated_side_bar.dart';

class CompanyHomeScreen extends StatefulWidget {
  const CompanyHomeScreen({super.key});

  @override
  State<CompanyHomeScreen> createState() => _CompanyHomeScreenState();
}

class _CompanyHomeScreenState extends State<CompanyHomeScreen> {
  bool _isPaymentIncomplete = false;

  @override
  void initState() {
    super.initState();
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      _checkPaymentStatus(user.uid).then((_) {
        if (_isPaymentIncomplete) {
          _showIncompletePaymentAlert();
        }
      });
    }

    // Load other data
    context.read<CandidateBloc>().add(LoadedCandidateCompany());
    context.read<ShortlistedCandidateBloc>().add(ShortListLoadeddata());
    context.read<RejectedCandidateBloc>().add(GetRejectedCandidate());
    context.read<CandidatestatusBloc>().add(Fetchstatus());
    context.read<PostjobBloc>().add(FetchJobs());
  }

  Future<void> _checkPaymentStatus(String companyUid) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
          .instance
          .collection('company')
          .doc(companyUid)
          .get();

      if (snapshot.exists) {
        var data = snapshot.data();
        if (data != null && data.containsKey('payment')) {
          setState(() {
            _isPaymentIncomplete = data['payment'] == '';
          });
        }
      }
    } catch (e) {
      print("Error fetching payment status: $e");
    }
  }

  void _showIncompletePaymentAlert() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Payment Incomplete'),
            content: Text('Please complete your payment to continue.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentScreen(),
                    ),
                  );
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double width1 = MediaQuery.of(context).size.width;
    double height2 = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(width1 * 0.02, height2 * 0.08),
          child: Homeappbar(width1: width1),
        ),
        body: Row(
          children: [
            SideBarAnimated(
              onTap: (s) {},
              widthSwitch: 700,
              mainLogoImage: 'assets/logo.png',
              sidebarItems: [
                SideBarItem(
                  iconSelected: Icons.home_rounded,
                  iconUnselected: Icons.home_outlined,
                  text: 'Home',
                ),
                SideBarItem(
                  iconSelected: Icons.account_balance_wallet,
                  iconUnselected: Icons.account_balance_wallet_outlined,
                  text: 'Insights',
                ),
                SideBarItem(
                  iconSelected: CupertinoIcons.chart_bar_square_fill,
                  iconUnselected: CupertinoIcons.chart_bar_square,
                  text: 'Feature',
                ),
                SideBarItem(
                  iconSelected: Icons.credit_card_rounded,
                  text: 'Payouts',
                ),
                SideBarItem(
                  iconSelected: Icons.settings,
                  iconUnselected: Icons.settings_outlined,
                  text: 'Settings',
                ),
              ],
            ),
            Expanded(
              child: Container(
                width: 1700,
                decoration: BoxDecoration(color: Colors.blue[50]),
                child: CutomColum(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

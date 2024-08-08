
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_mingle_web/application/auth_company/auth_company_bloc.dart';

import 'package:job_mingle_web/application/post_job/postjob_bloc.dart';
import 'package:job_mingle_web/domain/company_model.dart';
import 'package:job_mingle_web/presentaion/Applicants/screen/allapplicant_screen.dart';

import 'package:job_mingle_web/presentaion/Home/widgets/body/cutomcolum.dart';

import 'package:job_mingle_web/presentaion/Postnewjob/Screen/Post_new_job.dart';
import 'package:job_mingle_web/presentaion/Profile/screen/profile_screen.dart';


class CompanyHomeScreen extends StatefulWidget {
  const CompanyHomeScreen({super.key});

  @override
  State<CompanyHomeScreen> createState() => _CompanyHomeScreenState();
}

class _CompanyHomeScreenState extends State<CompanyHomeScreen> {
  @override
  void initState() {
    super.initState();
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final company = Companymodel(companyuid: user.uid);
      BlocProvider.of<PostjobBloc>(context).add(FetchJobs());
    }
  }
 bool isedit=true;
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double width1 = MediaQuery.of(context).size.width;
    // ignore: unused_local_variable
    double height2 = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 10,
              actions: [
                Row(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PostNewJob(isedit: false,)));
                        },
                        child: Text("POST NEW JOB")),
                    SizedBox(
                      width: 15,
                    ),
                    TextButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>AllApplicant()));
                    }, child: Text("Applicants")),
                    SizedBox(
                      width: 15,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Profile()));
                        },
                        child: Text("PROFILE")),
                    SizedBox(
                      width: 15,
                    ),
                    TextButton(
                        onPressed: () {
                          sigout(context);
                        },
                        child: Text("SIGN  OUT")),
                    SizedBox(
                      width: 100,
                    )
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
            ),
            body: Container(
                width: 1700,
                decoration: BoxDecoration(color: Colors.blue[50]),
                child: CutomColum())));
  }


  Future<dynamic> sigout(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Sign Out'),
          content: Text('Are you sure you want to sign out?'),
          actions:[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
                final authBloc = BlocProvider.of<AuthCompanyBloc>(context);
                authBloc.add(SignOutCompany());

                Navigator.pushNamedAndRemoveUntil(
                    context, '/login', (route) => false);
              },
              child: Text('Sign Out'),
            ),
          ],
        );
      },
    );
  

}
}


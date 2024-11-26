import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_mingle_web/application/post_job/postjob_bloc.dart';
import 'package:job_mingle_web/domain/job_model.dart';
import 'package:job_mingle_web/presentaion/postnewjob/Widgets/Post_job.dart';
import 'package:job_mingle_web/utils/constlist/listofitem.dart';
import 'package:url_launcher/url_launcher.dart';

class PostNewJob extends StatefulWidget {
  PostNewJob({super.key, this.job, required this.isedit});
  final JobModel? job;
  final bool isedit;
  @override
  State<PostNewJob> createState() => _PostNewJobState();
}

class _PostNewJobState extends State<PostNewJob> {
  final TextEditingController qualificationcontroller = TextEditingController();
  final TextEditingController interviewtimecontroller = TextEditingController();
  final TextEditingController jobtimecontroller = TextEditingController();
  final TextEditingController countryCont = TextEditingController();
  final TextEditingController stateCont = TextEditingController();
  final TextEditingController cityCont = TextEditingController();
  final TextEditingController companyuid = TextEditingController();

  final TextEditingController menujobtitleController = TextEditingController();
  final TextEditingController menulocationController = TextEditingController();
  final TextEditingController numberopeingscontroller = TextEditingController();
  TextEditingController datecontroller = TextEditingController();
  TextEditingController timecontroller = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController jobaddresscontroller = TextEditingController();
  final TextEditingController experiencecontroller = TextEditingController();
  final TextEditingController salarycontroller = TextEditingController();
  final TextEditingController contactpersonprofilecontroller =
      TextEditingController();
  final TextEditingController companynamecontroller = TextEditingController();
  final TextEditingController contactpersonnamecontroller =
      TextEditingController();
  final TextEditingController contactnumbercontroller = TextEditingController();
  final TextEditingController decripationofjobcontroller =
      TextEditingController();
  final TextEditingController skillcontroller = TextEditingController();
  final TextEditingController jobidcontroller = TextEditingController();
  final List<String> skills = [];
  ListDropDown? selectedMenujob;
  ListDropDown? selectedMenulocation;
  ListDropDown? selectedcontactperson;
  ListDropDown? selectexperience;

  @override
  Widget build(BuildContext context) {
    if (widget.isedit) {
      salarycontroller.text = widget.job!.salary;
      jobaddresscontroller.text = widget.job!.jobaddress;
      countryCont.text = widget.job!.country;
      stateCont.text = widget.job!.state;
      cityCont.text = widget.job!.city;
      companyuid.text = widget.job!.companyuid!;
      menujobtitleController.text = widget.job!.jobtitle;
      numberopeingscontroller.text = widget.job!.numberofopening;
      datecontroller.text = widget.job!.dateofposting;
      timecontroller.text = widget.job!.timeofjobentering;
      emailController.text = widget.job!.companyemail;
      experiencecontroller.text = widget.job!.experience;
      contactpersonprofilecontroller.text = widget.job!.contactpersonprofile;
      companynamecontroller.text = widget.job!.companyname;
      contactpersonnamecontroller.text = widget.job!.contactpersonname;
      contactnumbercontroller.text = widget.job!.contactpersonnumber;
      decripationofjobcontroller.text = widget.job!.jobdecripation;
      skillcontroller.text = widget.job!.skill;
      // jobidcontroller.text=widget.job!.jobid;
    }
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final formkey = GlobalKey<FormState>();
    return BlocBuilder<PostjobBloc, PostjobState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor:  Colors.blue[50],
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 10,
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      onPressed: () async{
                        final Uri appurl=Uri.parse('https://www.amazon.in/flutter-developer-Job-Miingle/dp/B0DFCBB2BV/ref=sr_1_fkmr0_1?dib=eyJ2IjoiMSJ9.fz9DcrJXXexFBvEKaSzCHpENC9KJuq7WTV-dkwfTmJjGjHj071QN20LucGBJIEps.bnEvXhS8WUbgKfgShed0JSGlltADiFqOfF6BwOsXyE8&dib_tag=se&keywords=Job+Miingle&qid=1724905950&sr=8-1-fkmr0 ');
                         if (await canLaunchUrl(appurl)) {
                          await launchUrl(appurl,
                              mode: LaunchMode.externalApplication);
                        } else {
                          throw 'Could not launch $appurl';
                        }
                      },
                      child: Text("FIND NEW JOB")),
                  SizedBox(width: width * 0.02),
                  TextButton(
                      onPressed: () async {
                        final Uri url = Uri.parse(
                            'https://www.freeprivacypolicy.com/live/82dd94eb-23e5-44ec-b829-64d35ca45b79');
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url,
                              mode: LaunchMode.externalApplication);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      child: Text("FAQ/HELP")),
                  SizedBox(width: width * 0.02),
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
          body: Post_Job(
              qualificationcontroller: qualificationcontroller,
              interviewtimecontroller: interviewtimecontroller,
              jobtimecontroller: jobtimecontroller,
              salarycontroller: salarycontroller,
              isedit: widget.isedit,
              jobidcontroller: jobidcontroller,
              formkey: formkey,
              height: height,
              width: width,
              menujobtitleController: menujobtitleController,
              numberopeingscontroller: numberopeingscontroller,
              cityCont: cityCont,
              countryCont: countryCont,
              stateCont: stateCont,
              contactpersonprofilecontroller: contactpersonprofilecontroller,
              contactnumbercontroller: contactnumbercontroller,
              emailController: emailController,
              experiencecontroller: experiencecontroller,
              datecontroller: datecontroller,
              decripationofjobcontroller: decripationofjobcontroller,
              skillcontroller: skillcontroller,
              timecontroller: timecontroller,
              companynamecontroller: companynamecontroller,
              contactpersonnamecontroller: contactpersonnamecontroller,
              jobaddresscontroller: jobaddresscontroller,
              menulocationController: menulocationController),
        );
      },
    );
  }
}


import 'package:flutter/material.dart';
import 'package:job_mingle_web/presentaion/Postnewjob/Widgets/Container_post.dart';
import 'package:job_mingle_web/presentaion/Postnewjob/Widgets/Submit_button.dart';
import 'package:job_mingle_web/presentaion/Postnewjob/Widgets/basic_details.dart';
import 'package:job_mingle_web/presentaion/Postnewjob/Widgets/company_details.dart';
import 'package:job_mingle_web/presentaion/Postnewjob/Widgets/contact_person.dart';
import 'package:job_mingle_web/presentaion/Postnewjob/Widgets/other_details.dart';

class Post_Job extends StatelessWidget {
  const Post_Job({
    super.key,
    required this.jobidcontroller,
    required this.formkey,
    required this.height,
    required this.width,
    required this.menujobtitleController,
    required this.numberopeingscontroller,
    required this.cityCont,
    required this.countryCont,
    required this.stateCont,
    required this.contactpersonprofilecontroller,
    required this.contactnumbercontroller,
    required this.emailController,
    required this.experiencecontroller,
    required this.datecontroller,
    required this.decripationofjobcontroller,
    required this.skillcontroller,
    required this.timecontroller,
    required this.companynamecontroller,
    required this.contactpersonnamecontroller,
    required this.jobaddresscontroller,
    required this.menulocationController,
    required this.isedit,
  });
 final bool isedit;
  final GlobalKey<FormState> formkey;
  final double height;
  final double width;
  final TextEditingController jobidcontroller;
  final TextEditingController menujobtitleController;
  final TextEditingController numberopeingscontroller;
  final TextEditingController cityCont;
  final TextEditingController countryCont;
  final TextEditingController stateCont;
  final TextEditingController contactpersonprofilecontroller;
  final TextEditingController contactnumbercontroller;
  final TextEditingController emailController;
  final TextEditingController experiencecontroller;
  final TextEditingController datecontroller;
  final TextEditingController decripationofjobcontroller;
  final TextEditingController skillcontroller;
  final TextEditingController timecontroller;
  final TextEditingController companynamecontroller;
  final TextEditingController contactpersonnamecontroller;
  final TextEditingController jobaddresscontroller;
  final TextEditingController menulocationController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formkey,
        child: Column(children: [
          SizedBox(
            height: height * 0.09,
          ),
          Center(
            child: Container_jobPost(height: height, width: width),
          ),
          SizedBox(
            height: height * 0.1,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, bottom: 10),
            child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Basic Job Details",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 19),
                )),
          ),
          SizedBox(
            width: width * 0.03,
          ),
          BasicDetails(
              height: height,
              width: width,
              menujobtitleController: menujobtitleController,
              numberopeingscontroller: numberopeingscontroller,
              cityCont: cityCont,
              countryCont: countryCont,
              stateCont: stateCont),
          SizedBox(
            height: height * 0.05,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, bottom: 10),
            child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Contact Person",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 19),
                )),
          ),
          SizedBox(
            width: width * 0.03,
          ),
          ContactPerson(
              height: height,
              width: width,
              contactpersonprofilecontroller:
                  contactpersonprofilecontroller,
              contactnumbercontroller: contactnumbercontroller,
              emailController: emailController),
          SizedBox(
            height: height * 0.03,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, bottom: 10),
            child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Other Details",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 19),
                )),
          ),
          SizedBox(
            width: width * 0.06,
          ),
          OtherDetails(
              experienceController: experiencecontroller,
              height: height,
              width: width,
              dateController: datecontroller,
              decripationOfJobController: decripationofjobcontroller,
              skillController: skillcontroller,
              timeController: timecontroller),
          SizedBox(
            height: height * 0.02,
          ),
          Text(
            " About Your Company *",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 19),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          CompanyDetails(
            jobid: jobidcontroller,
              height: height,
              width: width,
              companynamecontroller: companynamecontroller,
              contactpersonnamecontroller: contactpersonnamecontroller,
              emailController: emailController,
              jobaddresscontroller: jobaddresscontroller),
          SizedBox(
            height: height * 0.05,
          ),
          SubmitButton(
            isedit: isedit,
              jobidcontroller: jobidcontroller,
              formkey: formkey,
              countryCont: countryCont,
              stateCont: stateCont,
              cityCont: cityCont,
            
              contactnumbercontroller: contactnumbercontroller,
              jobaddresscontroller: jobaddresscontroller,
              decripationofjobcontroller: decripationofjobcontroller,
              menujobtitleController: menujobtitleController,
              menulocationController: menulocationController,
              numberopeingscontroller: numberopeingscontroller,
              datecontroller: datecontroller,
              timecontroller: timecontroller,
              experiencecontroller: experiencecontroller,
              contactpersonprofilecontroller:
                  contactpersonprofilecontroller,
              contactpersonnamecontroller: contactpersonnamecontroller,
              skillcontroller: skillcontroller,
              emailController: emailController,
              companynamecontroller: companynamecontroller),
          SizedBox(
            height: height * 0.05,
          )
        ]),
      ),
    );
  }
}

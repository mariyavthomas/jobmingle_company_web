import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_mingle_web/application/post_job/postjob_bloc.dart';
import 'package:job_mingle_web/domain/job_model.dart';
import 'package:job_mingle_web/presentaion/Home/home_screen.dart';

// ignore: must_be_immutable
class SubmitButton extends StatelessWidget {
   SubmitButton({
    super.key,
    required this.jobidcontroller,
    required this.formkey,
    required this.countryCont,
    required this.stateCont,
    required this.cityCont,
    required this.contactnumbercontroller,
    required this.jobaddresscontroller,
    required this.decripationofjobcontroller,
    required this.menujobtitleController,
    required this.menulocationController,
    required this.numberopeingscontroller,
    required this.datecontroller,
    required this.timecontroller,
    required this.experiencecontroller,
    required this.contactpersonprofilecontroller,
    required this.contactpersonnamecontroller,
    required this.skillcontroller,
    required this.emailController,
    required this.companynamecontroller,
    required this.isedit
  });
  final bool isedit;

  final GlobalKey<FormState> formkey;
  final TextEditingController countryCont;
  final TextEditingController stateCont;
  final TextEditingController cityCont;
  final TextEditingController contactnumbercontroller;
  final TextEditingController jobaddresscontroller;
  final TextEditingController decripationofjobcontroller;
  final TextEditingController menujobtitleController;
  final TextEditingController menulocationController;
  final TextEditingController numberopeingscontroller;
  final TextEditingController datecontroller;
  final TextEditingController timecontroller;
  final TextEditingController experiencecontroller;
  final TextEditingController contactpersonprofilecontroller;
  final TextEditingController contactpersonnamecontroller;
  final TextEditingController skillcontroller;
  final TextEditingController emailController;
  final TextEditingController companynamecontroller;
  final TextEditingController jobidcontroller;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Colors.green),
        minimumSize: MaterialStateProperty.all(
            Size(200, 60)), // specify the desired size
      ),
      onPressed: () {

        if (formkey.currentState!.validate()) {
          if(isedit){
              final User? user=FirebaseAuth.instance.currentUser;
         final String ?companyuid=user?.uid;
         
          final job = JobModel(
            companyuid: companyuid,
            jobid: jobidcontroller.text,
             country:  countryCont.text,
             state: stateCont.text,
             
             city: cityCont.text,
            contactpersonnumber: contactnumbercontroller.text,
            jobaddress: jobaddresscontroller.text,
            jobdecripation: decripationofjobcontroller.text,
            jobtitle: menujobtitleController.text,
           // location: menulocationController.text,
            numberofopening: numberopeingscontroller.text,
            dateofposting: datecontroller.text,
            timeofjobentering: timecontroller.text,
            experience: experiencecontroller.text,
            contactpersonprofile:
                contactpersonprofilecontroller.text,
            contactpersonname: contactpersonnamecontroller.text,
            skill: skillcontroller.text,
            companyemail: emailController.text,
            companyname: companynamecontroller.text,
          );
          context.read<PostjobBloc>().add(UpdateJobPost(job: job));
           WidgetsBinding.instance.addPostFrameCallback((_) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Successfully Updated'),
            backgroundColor: Colors.green,
          ));
        });
         WidgetsBinding.instance.addPostFrameCallback((_) {
           Future.delayed(Duration(seconds: 2), () {
          
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>CompanyHomeScreen()));
        });
         });

          }else{
            final User? user=FirebaseAuth.instance.currentUser;
         final String ?companyuid=user?.uid;
         
          final job = JobModel(
            companyuid: companyuid,
            jobid: jobidcontroller.text,
             country:  countryCont.text,
             state: stateCont.text,
             
             city: cityCont.text,
            contactpersonnumber: contactnumbercontroller.text,
            jobaddress: jobaddresscontroller.text,
            jobdecripation: decripationofjobcontroller.text,
            jobtitle: menujobtitleController.text,
           // location: menulocationController.text,
            numberofopening: numberopeingscontroller.text,
            dateofposting: datecontroller.text,
            timeofjobentering: timecontroller.text,
            experience: experiencecontroller.text,
            contactpersonprofile:
                contactpersonprofilecontroller.text,
            contactpersonname: contactpersonnamecontroller.text,
            skill: skillcontroller.text,
            companyemail: emailController.text,
            companyname: companynamecontroller.text,
          );
          print(decripationofjobcontroller.text);
          context.read<PostjobBloc>().add(PostJobAdd(job: job));
          context.read<PostjobBloc>().add(FetchJobs());
           WidgetsBinding.instance.addPostFrameCallback((_) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Successfully Registered'),
            backgroundColor: Colors.green,
          ));
        });
        WidgetsBinding.instance.addPostFrameCallback((_) {
           Future.delayed(Duration(seconds: 2), () {
          
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>CompanyHomeScreen()));
        });
         });
       
          }
         
        }
      },
      child: isedit ? Text('Update'):Text("Submit"),
    );
  }
}


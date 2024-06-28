import 'package:flutter/material.dart';
import 'package:job_mingle_web/utils/customtextform.dart';
import 'package:job_mingle_web/utils/validator.dart';

class CompanyDetails extends StatelessWidget {
  const CompanyDetails({
    super.key,
    required this.height,
    required this.width,
    required this.companynamecontroller,
    required this.contactpersonnamecontroller,
    required this.emailController,
    required this.jobaddresscontroller,
    required this.jobid
  });

  final double height;
  final double width;
  final TextEditingController companynamecontroller;
  final TextEditingController contactpersonnamecontroller;
  final TextEditingController emailController;
  final TextEditingController jobaddresscontroller;
  final TextEditingController jobid;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height * 0.7,
              width: width * 0.5,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: const Offset(
                        5.0,
                        5.0,
                      ),
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                    ), //BoxShadow
                    BoxShadow(
                      color: Colors.white,
                      offset: const Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ), //BoxShadow
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Company Name*"),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    CustomTextFormField(
                        validator: (value) =>
                            Validator().nameValidator(value),
                        enabledBorder:
                            OutlineInputBorder(borderSide: BorderSide()),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue)),
                        controller: companynamecontroller,
                        hintText: "Company name",
                        labeltext: "Enter the  Company name"),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Text("Contact Person Name *"),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    CustomTextFormField(
                        validator: (value) =>
                            Validator().contactpersonname(value),
                        enabledBorder:
                            OutlineInputBorder(borderSide: BorderSide()),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue)),
                        controller: contactpersonnamecontroller,
                        hintText: "Eg.Riya",
                        labeltext: "Contact Person Name"),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Text("Email Id*"),
                    CustomTextFormField(
                        enabledBorder:
                            OutlineInputBorder(borderSide: BorderSide()),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue)),
                        validator: (value) =>
                            Validator().emailValidator(value),
                        labeltext: 'Email ID',
                        keyboard: TextInputType.emailAddress,
                        controller: emailController,
                        hintText: "Email ID"),
                    Text(
                      "Candidates will send resume on this email-id",
                      style: TextStyle(fontSize: 10, color: Colors.grey),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Text(
                        "Job Address*(Address ONLY shown to registered candidates)"),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Container(
                      height: height * 0.08,
                      child: CustomTextFormField(
                          validator: (value) =>
                              Validator().jobAddress(value),
                          maxlines: 350,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide()),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue)),
                          controller: jobaddresscontroller,
                          hintText: "",
                          labeltext: ""),
                    ),
                    Text(
                      "Job Address*(Address ONLY shown to registered candidates)Please fill complete address, mention Landmark near your office",
                      style: TextStyle(fontSize: 10, color: Colors.grey),
                    ),
                    CustomTextFormField( enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide()),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue)),
                      controller:jobid , hintText: "Job Id", labeltext: "Enter Job Id")
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


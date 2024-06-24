import 'package:flutter/material.dart';
import 'package:job_mingle_web/utils/customtextform.dart';
import 'package:job_mingle_web/utils/validator.dart';

class ContactPerson extends StatelessWidget {
  const ContactPerson({
    super.key,
    required this.height,
    required this.width,
    required this.contactpersonprofilecontroller,
    required this.contactnumbercontroller,
    required this.emailController,
  });

  final double height;
  final double width;
  final TextEditingController contactpersonprofilecontroller;
  final TextEditingController contactnumbercontroller;
  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return 
    SizedBox(
      height: height * 0.6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: height * 0.6,
            width: width * 0.5,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: const Offset(
                      5.0,
                      5.0,
                    ),
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: const Offset(0.0, 0.0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  ),
                ]),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Contact Person *"),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  SizedBox(
                      width: width * 0.9,
                      child: CustomTextFormField(
                        focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1, color: Colors.grey)),
                          validator: (value) =>
                        Validator().contactpersonprofile(value),
                          controller:
                              contactpersonprofilecontroller,
                          hintText: "eg:HR",
                          labeltext: "Enter the Person Profile")),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  Text("Contact Number *"),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  CustomTextFormField(
                    validator: (value) =>
                        Validator().numberValidator(value),
                    controller: contactnumbercontroller,
                    hintText: "",
                    labeltext: "Contact Number",
                    style: TextStyle(fontWeight: FontWeight.w100),
                    keyboard: TextInputType.phone,
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1, color: Colors.grey)),
                    width: width * 0.9,
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  Text("Contact Person's Email *"),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  CustomTextFormField(
                    validator: (value) =>
                        Validator().emailValidator(value),
                    controller: emailController,
                    hintText: "Eg: abc@domain.com",
                    labeltext: "Email",
                    style: TextStyle(fontWeight: FontWeight.w100),
                    keyboard: TextInputType.emailAddress,
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1, color: Colors.grey)),
                    width: width * 0.9,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}





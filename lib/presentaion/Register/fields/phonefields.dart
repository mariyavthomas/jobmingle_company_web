import 'package:flutter/material.dart';
import 'package:job_mingle_web/presentaion/Register/fields/phone.dart';
import 'package:job_mingle_web/utils/customtextform.dart';
import 'package:job_mingle_web/utils/validator.dart';




class Formfieldphonenumber extends StatelessWidget {
 Formfieldphonenumber({
    super.key,
    required TextEditingController phonenumbercontroller,
  }) :phonenumbercontroller = phonenumbercontroller;

   final TextEditingController phonenumbercontroller;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(controller: phonenumbercontroller, hintText: "Enter Phone", labeltext: "Phone number",
     validator: (value) => Validator().numberValidator(value),
     keyboard: TextInputType.number,
     prefixtext: "+91 ",

     );
  }
}

import 'package:flutter/material.dart';
import 'package:job_mingle_web/utils/customtextform.dart';
import 'package:job_mingle_web/utils/validator.dart';


class Formfieldemail extends StatelessWidget {
  const Formfieldemail({
    super.key,
    required TextEditingController emailController,
  }) : _emailController = emailController;

  final TextEditingController _emailController;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      validator: (value) =>Validator().emailValidator(value),
        labeltext: 'Email ID',
        keyboard: TextInputType.emailAddress,
        controller: _emailController,
        hintText: "Email ID");
  }
}
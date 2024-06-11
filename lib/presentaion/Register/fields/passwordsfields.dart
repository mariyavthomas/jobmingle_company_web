import 'package:flutter/material.dart';
import 'package:job_mingle_web/utils/customtextform.dart';
import 'package:job_mingle_web/utils/validator.dart';


class Formfieldpassword extends StatelessWidget {
  const Formfieldpassword({
    super.key,
    required TextEditingController passwordcontroller,
  }) : _passwordcontroller = passwordcontroller;

  final TextEditingController _passwordcontroller;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      validator: (value) => Validator().passwordValidator(value),
        labeltext: 'Password',
        obscureText: true,
        controller: _passwordcontroller,
        hintText: "Password");
  }
}
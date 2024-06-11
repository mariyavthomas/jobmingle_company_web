import 'package:flutter/material.dart';
import 'package:job_mingle_web/utils/customtextform.dart';
import 'package:job_mingle_web/utils/validator.dart';


class FormfieldCompanyname extends StatelessWidget {
  const FormfieldCompanyname({
    super.key,
    required TextEditingController fullnamecontroller,
  }) : _fullnamecontroller = fullnamecontroller;

  final TextEditingController _fullnamecontroller;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      validator: (value) => Validator().nameValidator(value),
        labeltext: 'Company Name',
        controller: _fullnamecontroller,
        hintText: "Company Name");
  }
}


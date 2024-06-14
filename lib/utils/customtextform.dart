import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_mingle_web/application/auth_company/auth_company_bloc.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  final bool readOnly;
  final TextEditingController controller;
  final TextStyle? hintstyle;

  final String hintText;
  final bool obscureText;
  final double? width;
  final double? height;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final TextStyle? errorStyle;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final prefixtext;
  // final type;
  final keyboard;
  final BorderRadius? borderRadius;
  final TextStyle? style;
  final maxlines;
  final String labeltext;
  final FormFieldValidator<String>? validator;
  CustomTextFormField({
    Key? key,
    this.hintstyle,
    this.validator,
    this.prefixtext,
    this.errorStyle,
    this.readOnly = false,
    this.style,
    this.borderRadius,
    this.width,
    this.height,
    required this.controller,
    this.maxlines = 1,
    //this.type = TextInputType.text,
    this.keyboard,
    required this.hintText,
    this.obscureText = false,
    this.enabledBorder,
    this.focusedBorder,
    this.prefixIcon,
    this.suffixIcon,
    required this.labeltext,
  }) : super(key: key);

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCompanyBloc, AuthCompanyState>(
      builder: (context, state) {
        if (state is ObsecurecompanyState) {
          _obscureText = state.obscure;
        }
        return SizedBox(
          height: height,
          width: width,
          child: TextFormField(
              readOnly: readOnly,
              style: Theme.of(context).textTheme.bodySmall,
              maxLines: maxlines,
              keyboardType: keyboard,
              controller: controller,
              decoration: InputDecoration(
                labelText: labeltext,
                errorStyle: TextStyle(color: Colors.red),
                hintStyle: Theme.of(context).textTheme.bodySmall,
                hintText: hintText,
                prefixText: prefixtext,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.black)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      12,
                    ),
                    borderSide: BorderSide(color: Colors.blue, width: 3)),
                prefixIcon: prefixIcon,
                suffixIcon: obscureText
                    ? IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          BlocProvider.of<AuthCompanyBloc>(context).add(
                              ObsecuretextcompanyEvent(obscure: _obscureText));
                        },
                      )
                    : suffixIcon,
              ),
              obscureText: obscureText && _obscureText,
              validator: validator,
              autovalidateMode: AutovalidateMode.onUserInteraction),
        );
        // SizedBox(
        //   height: 10,
        // );
      },
    );
  }
}

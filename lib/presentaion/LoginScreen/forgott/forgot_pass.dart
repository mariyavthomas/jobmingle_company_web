import 'package:flutter/material.dart';
import 'package:job_mingle_web/infrastructure/resetRepo.dart';
import 'package:job_mingle_web/utils/customtextform.dart';
import 'package:job_mingle_web/utils/validator.dart';


// ignore: must_be_immutable
class Forgotpassword extends StatelessWidget {
  Forgotpassword({super.key});
  TextEditingController _emailController = TextEditingController();
  ResetPassRespo pass = ResetPassRespo();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
        backgroundColor: Color.fromARGB(200, 75, 110, 225),
        elevation: 0,
      ),
      body: Center(
        child: Container(
          width: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Text(
                  'Enter Your email and we will send you a password',
                  textAlign: TextAlign.center,
                ),
              ),
              CustomTextFormField(
                validator: (value) => Validator().emailValidator(value),
                  labeltext: 'Email ID',
                  controller: _emailController,
                  hintText: "Enter the Email"),
              MaterialButton(
                onPressed: () {
                  pass.resetPassword(context, _emailController.text);
                },
                child: Text('Reset password'),
                color: Color.fromARGB(200, 75, 110, 225),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_mingle_web/application/auth_company/auth_company_bloc.dart';
import 'package:job_mingle_web/presentaion/LoginScreen/button/googlebutton.dart';
import 'package:job_mingle_web/presentaion/LoginScreen/forgott/forgot_pass.dart';
import 'package:job_mingle_web/utils/customtextform.dart';
import 'package:job_mingle_web/utils/validator.dart';

import 'package:lottie/lottie.dart';

class LoginComapny extends StatelessWidget {
  const LoginComapny({
    super.key,
    required this.loading,
    required TextEditingController usernameController ,
    required TextEditingController passwordcontroller,
  })  : _usernameController  = usernameController ,
        _passwordcontroller = passwordcontroller;

  final TextEditingController _usernameController ;
  final TextEditingController _passwordcontroller;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        child: Lottie.asset('lib/assets/image/splash.json',
            height: 120, width: 120),
      ),
      Text('Log in to JobMingles',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
      SizedBox(
        height: 20,
      ),
      CustomTextFormField(
        
        validator:  (value) => Validator().nameValidator(value),
          labeltext: 'User Name',
          controller: _usernameController ,
          hintText: "Enter the User Name"),
      SizedBox(
        height: 20,
      ),
      CustomTextFormField(
        validator: (value) => Validator().passwordValidator(value),
          labeltext: 'Password',
          obscureText: true,
          controller: _passwordcontroller,
          hintText: "Enter the Password"),
      SizedBox(height: 5),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>Forgotpassword()));
              },
                child: Text(
              'Forgot Password?',
              style: TextStyle(color: Color.fromARGB(255, 7, 42, 167)),
            ))),
      ),
      SizedBox(
        height: 5,
      ),
      // loading
      //     ? CircularProgressIndicator()
      //     : 
          InkResponse(
              onTap: () {
                // Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
                BlocProvider.of<AuthCompanyBloc>(context).add(LoginComapanyEvent(
                    username: _usernameController .text.trim(),
                    password: _passwordcontroller.text.trim()));
              },
              child: Container(
                height: 50,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(200, 75, 110, 225),
                ),
                child: Center(
                  child: Text(
                    'Sign In',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ),
              ),
            ),

      SizedBox(
        height: 10,
      ),
      Text('or'),
      Divider(
        color: Colors.black,
        thickness: 1,
      ),
      SizedBox(
        height: 10,
      ),
     GoogleButton(),
       SizedBox(
        height: 10,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('New here?'),
          TextButton(
              onPressed: () {
              Navigator.pushNamed(context, '/register');
              },
              child: Text('Register now'))
        ],
      )
    ]);
  }
}

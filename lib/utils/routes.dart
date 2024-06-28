import 'package:flutter/material.dart';
import 'package:job_mingle_web/presentaion/Home/screen/home_screen.dart';
import 'package:job_mingle_web/presentaion/LoginScreen/screen/login_screen.dart';
import 'package:job_mingle_web/presentaion/Register/screen/siginup.dart';
import 'package:job_mingle_web/presentaion/onboarding/onboarding.dart';
import 'package:job_mingle_web/presentaion/splash/splash.dart';

class Routers{
  Map<String, Widget Function(BuildContext)>routes={
   '/': (context) => SplashPage(),
     '/onboarding':(context) => Onboarding(),
     '/register':(context)=>RegisterPageCompany(),
     '/login':(context)=>LoginPageCompany(),
     '/home':(context)=>CompanyHomeScreen()
  };
}
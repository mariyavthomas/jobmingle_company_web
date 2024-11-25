import 'package:flutter/material.dart';
import 'package:job_mingle_web/presentaion/loginScreen/screen/login_screen.dart';
import 'package:job_mingle_web/presentaion/paymet/screen/payment.dart';
import 'package:job_mingle_web/presentaion/register/screen/siginup.dart';
import 'package:job_mingle_web/presentaion/onboarding/onboarding.dart';
import 'package:job_mingle_web/presentaion/splash/splash.dart';

class Routers {
  Map<String, Widget Function(BuildContext)> routes = {
    '/splash': (context) => SplashPage(),
    '/onboarding': (context) => Onboarding(),
    '/register': (context) => RegisterPageCompany(),
    '/login': (context) => LoginPageCompany(),
   // '/home': (context) => CompanyHomeScreen(),
    '/payment': (context) => PaymentScreen(),
  };
}

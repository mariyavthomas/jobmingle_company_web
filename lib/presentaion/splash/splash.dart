
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_mingle_web/application/auth_company/auth_company_bloc.dart';
import 'package:job_mingle_web/presentaion/onboarding/onboarding.dart';







import 'package:lottie/lottie.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});
 
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthCompanyBloc, AuthCompanyState>(
          listener: (context, state) {
            if (state is Authenticatedcompany) {
             Navigator.pushNamedAndRemoveUntil(context, '/BottamNavigation', (route) => false);
            } else if (state is UnAuthenticatedcompany) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Onboarding()),
              );
            }
          },
        ),
        
      ],
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Lottie.asset('lib/assets/image/splash.json', height: 200),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}

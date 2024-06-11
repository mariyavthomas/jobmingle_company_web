import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_mingle_web/application/auth_company/auth_company_bloc.dart';
import 'package:job_mingle_web/presentaion/Register/widgets/registercolum.dart';




class RegisterPageCompany extends StatefulWidget {
  RegisterPageCompany({super.key});
  @override
  State<RegisterPageCompany> createState() => _RegisterPageCompanyState();
}

class _RegisterPageCompanyState extends State<RegisterPageCompany> {
  TextEditingController companyemailController = TextEditingController();
  TextEditingController companypasswordcontroller = TextEditingController();
  TextEditingController companynamecontroller = TextEditingController();
  TextEditingController companyphonenumbercontroller = TextEditingController();

  // @override
  // void dispose() {
  //   _emailController.dispose();
  //   _passwordcontroller.dispose();
  //   super.dispose();
  // }

  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCompanyBloc, AuthCompanyState>(
        builder: (context, state) {
      if (state is LogingInitialcompanyEvent) {
        loading = false;
      }
      if (state is AuthCompanyLoading) {
        loading = true;
      }
      if (state is AuthenticatedErrorcomapny) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(state.message),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        BlocProvider.of<AuthCompanyBloc>(context)
                            .add(LogingInitialcompanyEvent());
                      },
                      child: Text('ok'))
                ],
              );
            },
          );
        });
      }

      if (state is Authenticatedcompany) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Successfully Registered'),
            backgroundColor: Colors.green,
          ));
        });
        Future.delayed(Duration(seconds: 2), () {
          Navigator.pushNamedAndRemoveUntil(
              context, '/onboarding', (route) => false);
        });
      }
      return Scaffold(
        body: SafeArea(
          child: Align(
            alignment: Alignment.center,
            child: Container(
              height:800,
              width: 600,
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: RegisterCompanyColumn (
                       
                        loading: loading,
                       
                         companyNameController: companynamecontroller, 
                        companyEmailController: companyemailController,
                         companyPasswordController: companypasswordcontroller, 
                        companyPhoneNumberController: companyphonenumbercontroller,),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_mingle_web/application/auth_company/auth_company_bloc.dart';
import 'package:job_mingle_web/presentaion/LoginScreen/widget/login_widgets.dart';

class LoginPageCompany extends StatefulWidget {
  const LoginPageCompany({super.key});

  @override
  State<LoginPageCompany> createState() => _LoginPageCompanyState();
}

class _LoginPageCompanyState extends State<LoginPageCompany> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();

  @override
  void dispose() {
    _usernameController .dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

  bool loading = false;
  @override
  Widget build(BuildContext context) {
   
    return BlocBuilder<AuthCompanyBloc, AuthCompanyState>(
        builder: (context, state) {
      if (state is AuthCompanyInitial) {
        loading = false;
      } else if (state is AuthCompanyLoading) {
        loading = true;
      } else if (state is Authenticatedcompany) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
          BlocProvider.of<AuthCompanyBloc>(context).add(LogingInitialcompanyEvent());
        });
      } else if (state is AuthenticatedErrorcomapny) {
        // return ScaffoldMessenger.of(context).showSnackBar(
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              state.message,
            ),
            backgroundColor: Colors.red,
          ));
        });
      }
      return Scaffold(
          body: Center(
            child: Container(
              height: 900,
                width:500,
              child: CustomScrollView(slivers: [
                    SliverFillRemaining(
              hasScrollBody: false,
              child: Container(
                
                decoration: BoxDecoration(),
                padding: EdgeInsets.symmetric(horizontal: 30),
                height: double.infinity,
                width:double.infinity,
                child: LoginComapny(
                    loading: loading,
                    usernameController : _usernameController ,
                    passwordcontroller: _passwordcontroller),
              ),
                    )
                  ]),
            ),
          ));
    });
  }
}

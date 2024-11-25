import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_mingle_web/application/auth_company/auth_company_bloc.dart';
import 'package:job_mingle_web/presentaion/home/screen/home_screen.dart';
import 'package:job_mingle_web/presentaion/loginScreen/widget/login_widgets.dart';

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
    _usernameController.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    double width1 = MediaQuery.of(context).size.width;
    double height2 = MediaQuery.of(context).size.height;
    return BlocBuilder<AuthCompanyBloc, AuthCompanyState>(
        builder: (context, state) {
      if (state is AuthCompanyInitial) {
        loading = false;
      } else if (state is AuthCompanyLoading) {
        loading = true;
      } else if (state is Authenticatedcompany) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => CompanyHomeScreen()));
          BlocProvider.of<AuthCompanyBloc>(context)
              .add(LogingInitialcompanyEvent());
        });
      } else if (state is AuthenticatedErrorcomapny) {
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
        body: Stack(
          fit: StackFit.expand,
          children: [
            // Background Image
            Image.asset(
              'lib/assets/image/firstpage.jpg', // Path to your background image
              fit: BoxFit.cover,
            ),
            // Overlay with Login Form
            Center(
              child: Container(
                height: height2 * 0.8,
                width: width1 * 0.4,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8), // Optional: semi-transparent background
                  borderRadius: BorderRadius.circular(10), // Optional: rounded corners
                ),
                child: CustomScrollView(
                  slivers: [
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: LoginComapny(
                          loading: loading,
                          usernameController: _usernameController,
                          passwordcontroller: _passwordcontroller,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}

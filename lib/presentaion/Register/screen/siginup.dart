import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_mingle_web/application/auth_company/auth_company_bloc.dart';
import 'package:job_mingle_web/presentaion/register/widgets/registercolum.dart';

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

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    double width1 = MediaQuery.of(context).size.width;
    double height2 = MediaQuery.of(context).size.height;

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
                      child: Text('ok'),
                    ),
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
                context, '/login', (route) => false);
          });
        }

        return Scaffold(
          body: Stack(
            children: [
              // Background image
              Positioned.fill(
                child: Image.asset(
                  'lib/assets/image/firstpage.jpg', // Replace with your background image path
                  fit: BoxFit.cover,
                ),
              ),
              SafeArea(
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    height: height2 * 0.95,
                    width: width1 * 0.5,
                    child: CustomScrollView(
                      slivers: [
                        SliverFillRemaining(
                          hasScrollBody: false,
                          child: RegisterCompanyColumn(
                            loading: loading,
                            companyNameController: companynamecontroller,
                            companyEmailController: companyemailController,
                            companyPasswordController:
                                companypasswordcontroller,
                            companyPhoneNumberController:
                                companyphonenumbercontroller,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

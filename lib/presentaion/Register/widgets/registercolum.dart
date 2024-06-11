import 'package:flutter/material.dart';
import 'package:job_mingle_web/presentaion/Register/fields/companyname.dart';
import 'package:job_mingle_web/presentaion/Register/fields/emailfielda.dart';
import 'package:job_mingle_web/presentaion/Register/fields/passwordsfields.dart';
import 'package:job_mingle_web/presentaion/Register/fields/phonefields.dart';
import 'package:job_mingle_web/presentaion/Register/widgets/buttonlogin.dart';
import 'package:job_mingle_web/presentaion/Register/widgets/buttonregister.dart';
import 'package:lottie/lottie.dart';

class RegisterCompanyColumn extends StatelessWidget {
  RegisterCompanyColumn({
    super.key,
    required this.loading,
    required this.companyNameController,
    required this.companyEmailController,
    required this.companyPasswordController,
    required this.companyPhoneNumberController,
  });

  final TextEditingController companyNameController;
  final TextEditingController companyEmailController;
  final TextEditingController companyPasswordController;
  final TextEditingController companyPhoneNumberController;
  final bool loading;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back),
              ),
            ),
            Container(
              child: Lottie.asset('lib/assets/image/splash.json', height: 80, width: 200),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Create Your JobMingle Profile',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Register with Email',
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FormfieldCompanyname(
                fullnamecontroller: companyNameController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Formfieldemail(
                emailController: companyEmailController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Formfieldpassword(
                passwordcontroller: companyPasswordController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Formfieldphonenumber(
                
                 phonenumbercontroller: companyPhoneNumberController,
              ),
            ),
            SizedBox(height: 10),
            ButtonCompnyregister(
              loading: loading,
               formkey: formKey, 
               fullcompanynamecontroller: companyNameController, 
               companyemailController: companyEmailController,
                companypasswordcontroller: companyPasswordController,
               companyphonenumbercontroller: companyPhoneNumberController,
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(
                thickness: 1,
                color: Colors.black,
              ),
            ),
            Buttonlogincompany(),
          ],
        ),
      ),
    );
  }
}


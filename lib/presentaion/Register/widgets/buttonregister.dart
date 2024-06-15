import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_mingle_web/application/auth_company/auth_company_bloc.dart';
import 'package:job_mingle_web/domain/company_model.dart';
import 'package:job_mingle_web/presentaion/Register/screen/companydetails.dart';


class ButtonCompnyregister extends StatelessWidget {
   ButtonCompnyregister({
    super.key,
    required this.formkey,
    required this.loading,
    required TextEditingController fullcompanynamecontroller,
    required TextEditingController companyemailController,
    required TextEditingController companypasswordcontroller,
    required TextEditingController companyphonenumbercontroller,
  })  : fullcompanynamecontroller = fullcompanynamecontroller,
        companyemailController = companyemailController,
        companypasswordcontroller = companypasswordcontroller,
        companyphonenumbercontroller = companyphonenumbercontroller;

  final TextEditingController fullcompanynamecontroller;
  final TextEditingController companyemailController;
  final TextEditingController companypasswordcontroller;
  final TextEditingController companyphonenumbercontroller;
 final GlobalKey<FormState>formkey;
 final bool loading;
  @override
  Widget build(BuildContext context) {
    return 
    
    InkResponse(
      onTap: () {

     
        if(formkey.currentState!.validate()){
 Companymodel comapny = Companymodel(
 
           companyemail: companyemailController.text,
           companyname: fullcompanynamecontroller.text,
           companypassword: companypasswordcontroller.text,
           phone: companyphonenumbercontroller.text
            );
              // _authbloc.add(SignupEvent(user:user));
              
        BlocProvider.of<AuthCompanyBloc>(context).add(SignUpCompany(company: comapny));
       
        }
       
      
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
            'Register',
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
      ),
    );
  }
}

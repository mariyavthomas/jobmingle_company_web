import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_mingle_web/application/getdata/getdatafromcompany_bloc.dart';
import 'package:job_mingle_web/utils/customtextform.dart';

// ignore: must_be_immutable
class EditCompanyDetails extends StatefulWidget {
  EditCompanyDetails(
      {super.key,
      required this.address,
      required this.companyname,
      required this.email,
      required this.industry,
      required this.password,
      required this.phone,
      required this.summery,
      required this.totalemployee});

  String? address;
  String? email;
  String? companyname;
  String? phone;
  String? password;
  String? summery;
  String? totalemployee;
  String? industry;

  @override
  State<EditCompanyDetails> createState() => _EditCompanyDetailsState();
}

class _EditCompanyDetailsState extends State<EditCompanyDetails> {
  TextEditingController industrycontroller = TextEditingController();
  TextEditingController totalemployeecontroller = TextEditingController();
  TextEditingController summerycontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController companynamecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  @override
  void initState() {
    addresscontroller = TextEditingController(text: widget.address);
    companynamecontroller = TextEditingController(text: widget.companyname);
    phonecontroller = TextEditingController(text: widget.phone);
    passwordcontroller = TextEditingController(text: widget.password);
    emailController = TextEditingController(text: widget.email);
    summerycontroller = TextEditingController(text: widget.summery);
    totalemployeecontroller = TextEditingController(text: widget.totalemployee);
    industrycontroller = TextEditingController(text: widget.industry);

    super.initState();
  }

  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double width = MediaQuery.of(context).size.width;
    // ignore: unused_local_variable
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Container(
          width: width * 0.5,
          child: Form(
              key: formkey,
              child: ListView(
                children: [
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Text('Company Deatils'),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  CustomTextFormField(
                      focusedBorder: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(),
                      controller: addresscontroller,
                      hintText: "Enter the Company Address",
                      labeltext: "Address"),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  CustomTextFormField(
                      focusedBorder: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(),
                      controller: summerycontroller,
                      hintText: "Enter the About the Company",
                      labeltext: "About"),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  CustomTextFormField(
                      focusedBorder: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(),
                      controller: totalemployeecontroller,
                      hintText: "Enter the Total Employess",
                      labeltext: "Total employees"),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  CustomTextFormField(
                      focusedBorder: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(),
                      controller: industrycontroller,
                      hintText: "Enter the Industry",
                      labeltext: "Industry"),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  CustomTextFormField(
                      focusedBorder: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(),
                      controller: companynamecontroller,
                      hintText: "Enter the Company Name",
                      labeltext: "Company Name"),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  CustomTextFormField(
                      focusedBorder: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(),
                      controller: passwordcontroller,
                      hintText: "Enter the Company Password",
                      labeltext: "Password"),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  CustomTextFormField(
                      focusedBorder: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(),
                      controller: emailController,
                      hintText: "Enter the Company email",
                      labeltext: "Email"),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  CustomTextFormField(
                      focusedBorder: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(),
                      controller: phonecontroller,
                      hintText: "Enter the Company Phone",
                      labeltext: "Phone"),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          context.read<GetdatafromcompanyBloc>().add(
                              UpdateCompany(
                                  address: addresscontroller.text,
                                  email: emailController.text,
                                  industry: industrycontroller.text,
                                  password: passwordcontroller.text,
                                  phone: phonecontroller.text,
                                  summery: summerycontroller.text,
                                  totalemployee: totalemployeecontroller.text));
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Profile Successfully Updated'),
                              backgroundColor: Colors.green,
                            ),
                          );

                          WidgetsBinding.instance
                              .addPostFrameCallback((timeStamp) {
                            context
                                .read<GetdatafromcompanyBloc>()
                                .add(GetdatafromcompanyEvent());
                            Future.delayed(Duration(seconds: 2), () {
                              Navigator.pop(context);
                            });
                          });
                        }
                      },
                      child: Text('Update'))
                ],
              )),
        ),
      ),
    );
  }
}

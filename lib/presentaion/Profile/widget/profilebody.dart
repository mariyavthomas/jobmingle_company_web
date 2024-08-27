// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:job_mingle_web/application/getdata/getdatafromcompany_bloc.dart';
import 'package:job_mingle_web/presentaion/paymet/screen/payment.dart';
import 'package:job_mingle_web/presentaion/profile/screen/edit_pic.dart';
import 'package:job_mingle_web/utils/commonfunction.dart/function.dart';

class ProfileBody extends StatelessWidget {
   ProfileBody({
    super.key,
    required this.width,
    required this.height,
    required this.state
  });

  final double width;
  final double height;
  Loadeddatafromcompanystate state;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            Center(
              child: Text(
                state.user.companyname!.toUpperCase(),
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 8),
            Center(
              child: Text(
                'Senior Recruiter at ${state.user.companyname}',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[600],
                ),
              ),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.phone),
                  iconSize: 30,
                  color: Colors.blue,
                  onPressed: () {
                    Comman().makePhoneCall(state.user.phone!);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.email),
                  iconSize: 30,
                  color: Colors.blue,
                  onPressed: () {
                    Comman().sendEmail(state.user.email!);
                  },
                ),
              ],
            ),
            SizedBox(height: 24),
            Text(
              'Company: ${state.user.recutername}',
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              width: width * 0.27,
              height: height * 0.17,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'For businesses that offer specialized services or custom products, allowing customers to pay an accepted quote eliminates the need for offline interactions.',
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PaymentScreen(),
                        ),
                      );
                    },
                    child: Text("Pay"),
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.02),
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditCompanyDetails(
                        address: state.user.address,
                        companyname: state.user.companyname,
                        email: state.user.email,
                        industry: state.user.industry,
                        password: state.user.companypassword,
                        phone: state.user.phone,
                        summery: state.user.summery,
                        totalemployee: state.user.totalemployee,
                      ),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Company Address :',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: height * 0.01),
                        Text(state.user.address!),
                        SizedBox(height: height * 0.02),
                        Text(
                          "Industry :",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: height * 0.01),
                        Text(state.user.industry!),
                        SizedBox(height: height * 0.02),
                        Text(
                          "Total Employees :",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: height * 0.01),
                        Text(state.user.totalemployee!),
                        SizedBox(height: height * 0.02),
                        Text(
                          "Summary :",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: height * 0.01),
                        Text(state.user.summery!),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("Update"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

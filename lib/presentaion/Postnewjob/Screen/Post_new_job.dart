import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_mingle_web/application/auth_company/auth_company_bloc.dart';
import 'package:job_mingle_web/domain/company_model.dart';
import 'package:job_mingle_web/utils/Dropdownmenu.dart';
import 'package:job_mingle_web/utils/constlist/listofitem.dart';
import 'package:job_mingle_web/utils/customtextform.dart';
import 'package:job_mingle_web/utils/validator.dart';

class PostNewJob extends StatefulWidget {
  PostNewJob({super.key});

  @override
  State<PostNewJob> createState() => _PostNewJobState();
}

class _PostNewJobState extends State<PostNewJob> {
  final TextEditingController menujobtitleController = TextEditingController();
  final TextEditingController menulocationController = TextEditingController();
  final TextEditingController numberopeingscontroller = TextEditingController();
  final TextEditingController datecontroller = TextEditingController();
  final TextEditingController timecontroller = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController jobaddresscontroller = TextEditingController();
  final TextEditingController experiencecontroller = TextEditingController();
  final TextEditingController contactpersonprofilecontroller =
      TextEditingController();

  final TextEditingController companynamecontroller = TextEditingController();
  final TextEditingController contactpersonnamecontroller =
      TextEditingController();
  final TextEditingController contactnumbercontroller = TextEditingController();
  final TextEditingController decripationofjobcontroller =
      TextEditingController();
  final TextEditingController skillcontroller = TextEditingController();
  final List<String> _skills = [];
  ListDropDown? selectedMenujob;
  ListDropDown? selectedMenulocation;
  ListDropDown? selectedcontactperson;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final formkey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 10,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PostNewJob()));
                  },
                  child: Text("FIND NEW JOB")),
              SizedBox(width: width * 0.02),
              TextButton(onPressed: () {}, child: Text("FAQ/HELP")),
              SizedBox(width: width * 0.02),
              TextButton(onPressed: () {}, child: Text("PROFILE")),
              SizedBox(width: width * 0.02),

              // SizedBox(
              //   width: width * 0.1,
              // )
            ],
          ),
        ],
        title: Padding(
          padding: const EdgeInsets.only(left: 80),
          child: Text(
            'Job Mingle',
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: height * 0.09,
          ),
          Center(
            child: Container(
              height: height * 0.3,
              width: width * 0.7,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 181, 204, 245),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Text(
                    'Post your job in just 2 minuts!',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ClipRRect(
                    child: Card(
                        elevation: 50,
                        child: Image.asset(
                          'lib/assets/image/jobmingleimage1.jpg',
                        )),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: height * 0.1,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, bottom: 10),
            child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Basic Job Details",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                )),
          ),
          SizedBox(
            width: width * 0.06,
          ),
          SizedBox(
            height: height * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: height * 0.5,
                  width: width * 0.5,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: const Offset(
                            5.0,
                            5.0,
                          ),
                          blurRadius: 10.0,
                          spreadRadius: 2.0,
                        ), //BoxShadow
                        BoxShadow(
                          color: Colors.white,
                          offset: const Offset(0.0, 0.0),
                          blurRadius: 0.0,
                          spreadRadius: 0.0,
                        ), //BoxShadow
                      ]),
                  child: Form(
                    key: formkey,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Job Title *"),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          BlocBuilder<AuthCompanyBloc, AuthCompanyState>(
                            builder: (context, state) {
                              if( state is Authenticatedcompany){
                               // Text(state.user.displayName);
                              }
                              return CustomTextFormField(
                                  controller: companynamecontroller,
                                  hintText: "",
                                  labeltext: "");
                            },
                          ),
                          SizedBox(
                            width: width * 0.9,
                            child: Dropdownmenu(
                              width,
                              menujobtitleController,
                              "Job Title ",
                              selectedMenujob,
                              jobtitle,
                              (value) {
                                Validator().jobtitle(value);
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            height: height * 0.04,
                          ),
                          Text("Job Location * (Select From The Drop-down)"),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          SizedBox(
                            width: width * 0.9,
                            child: Dropdownmenu(
                              width,
                              menulocationController,
                              "Pick Your City",
                              selectedMenulocation,
                              location,
                              (value) {
                                Validator().location(value);
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            height: height * 0.04,
                          ),
                          Text("No Of Openings *"),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          CustomTextFormField(
                            validator: (value) =>
                                Validator().numberofopening(value),
                            controller: numberopeingscontroller,
                            hintText: "Eg:1",
                            labeltext: "No Of Openings",
                            style: TextStyle(fontWeight: FontWeight.w100),
                            keyboard: TextInputType.number,
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(2),
                                borderSide: BorderSide(color: Colors.blue)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(2),
                                borderSide: BorderSide(color: Colors.grey)),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: width * 0.10,
          ),
          Text(
            "Candidate Requirement",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Center(
            child: Container(
              height: height * 0.5,
              width: width * 0.5,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: const Offset(
                        5.0,
                        5.0,
                      ),
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                    ), //BoxShadow
                    BoxShadow(
                      color: Colors.white,
                      offset: const Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ), //BoxShadow
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Total Experience of Candidate *"),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    SizedBox(
                      width: width * 0.9,
                      child: Dropdownmenu(
                        width,
                        experiencecontroller,
                        "Experience of Candidate ",
                        selectedMenujob,
                        experience,
                        (value) {
                          Validator().experience(value);
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Text("Job Decripation *"),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Container(
                      height: height * 0.08,
                      child: CustomTextFormField(
                          validator: (value) =>
                              Validator().decripationofjob(value),
                          maxlines: 350,
                          enabledBorder:
                              OutlineInputBorder(borderSide: BorderSide()),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue)),
                          controller: decripationofjobcontroller,
                          hintText: "Job Decripation",
                          labeltext: "Job Decripation"),
                    ),
                    Text("Skills *"),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    CustomTextFormField(
                      validator: (value) => Validator().skill(value),
                      enabledBorder:
                          OutlineInputBorder(borderSide: BorderSide()),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)),
                      labeltext: "Skills",
                      controller: skillcontroller,
                      hintText: "Skills",
                      onSubmitted: (value) {
                        if (value.isNotEmpty) {
                          setState(() {
                            _skills.add(value);
                          });
                          skillcontroller.clear();
                        }
                      },
                    ),
                    SizedBox(height: 16),
                    Wrap(
                      spacing: 8.0,
                      runSpacing: 4.0,
                      children: _skills.map((skill) {
                        return Chip(
                          label: Text(skill),
                          onDeleted: () {
                            setState(() {
                              _skills.remove(skill);
                            });
                          },
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.05,
          ),
          Text(
            "Time *",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 19),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Center(
            child: Container(
              height: height * 0.25,
              width: width * 0.5,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: const Offset(
                        5.0,
                        5.0,
                      ),
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                    ), //BoxShadow
                    BoxShadow(
                      color: Colors.white,
                      offset: const Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ), //BoxShadow
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Date *"),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    CustomTextFormField(
                        validator: (value) => Validator().date(value),
                        enabledBorder:
                            OutlineInputBorder(borderSide: BorderSide()),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue)),
                        controller: datecontroller,
                        hintText: "Date",
                        labeltext: "Enter the  Date"),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Text("Time *"),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    CustomTextFormField(
                        validator: (value) => Validator().time(value),
                        enabledBorder:
                            OutlineInputBorder(borderSide: BorderSide()),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue)),
                        controller: datecontroller,
                        hintText: "Enter the Time",
                        labeltext: "Time")
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.05,
          ),
          Text(
            " About Your Company *",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 19),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Center(
            child: Container(
              height: height * 0.8,
              width: width * 0.5,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: const Offset(
                        5.0,
                        5.0,
                      ),
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                    ), //BoxShadow
                    BoxShadow(
                      color: Colors.white,
                      offset: const Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ), //BoxShadow
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Company Name*"),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    CustomTextFormField(
                        validator: (value) => Validator().nameValidator(value),
                        enabledBorder:
                            OutlineInputBorder(borderSide: BorderSide()),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue)),
                        controller: companynamecontroller,
                        hintText: "Company name",
                        labeltext: "Enter the  Company name"),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Text("Contact Person Name *"),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    CustomTextFormField(
                        validator: (value) =>
                            Validator().contactpersonname(value),
                        enabledBorder:
                            OutlineInputBorder(borderSide: BorderSide()),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue)),
                        controller: contactpersonnamecontroller,
                        hintText: "Eg.Riya",
                        labeltext: "Contact Person Name"),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Text("Phone Number*"),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    CustomTextFormField(
                      enabledBorder:
                          OutlineInputBorder(borderSide: BorderSide()),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)),
                      controller: numberopeingscontroller,
                      hintText: "Enter Phone",
                      labeltext: "Phone number",
                      validator: (value) => Validator().numberValidator(value),
                      keyboard: TextInputType.number,
                      prefixtext: "+91 ",
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Text("Email Id*"),
                    CustomTextFormField(
                        enabledBorder:
                            OutlineInputBorder(borderSide: BorderSide()),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue)),
                        validator: (value) => Validator().emailValidator(value),
                        labeltext: 'Email ID',
                        keyboard: TextInputType.emailAddress,
                        controller: emailController,
                        hintText: "Email ID"),
                    Text(
                      "Candidates will send resume on this email-id",
                      style: TextStyle(fontSize: 10, color: Colors.grey),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Text("Contact Person Profile *"),
                    SizedBox(
                      width: width * 0.9,
                      child: Dropdownmenu(
                        width,
                        contactpersonprofilecontroller,
                        "",
                        selectedcontactperson,
                        contactwith,
                        (value) {
                          Validator().contactpersonprofile(value);
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Text(
                        "Job Address*(Address ONLY shown to registered candidates)"),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Container(
                      height: height * 0.08,
                      child: CustomTextFormField(
                          validator: (value) => Validator().jobAddress(value),
                          maxlines: 350,
                          enabledBorder:
                              OutlineInputBorder(borderSide: BorderSide()),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue)),
                          controller: jobaddresscontroller,
                          hintText: "",
                          labeltext: ""),
                    ),
                    Text(
                      "Job Address*(Address ONLY shown to registered candidates)Please fill complete address, mention Landmark near your office",
                      style: TextStyle(fontSize: 10, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.05,
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.green),
              minimumSize: MaterialStateProperty.all(
                  Size(200, 60)), // specify the desired size
            ),
            onPressed: () {
              if (formkey.currentState!.validate()) {
                Companymodel(
                  address: jobaddresscontroller.text,
                  phone: contactnumbercontroller.text,
                  jobtitle: menujobtitleController.text,
                  location: menulocationController.text,
                  numberofopening: numberopeingscontroller.text,
                  dateofposting: datecontroller.text,
                  timeofjobentering: timecontroller.text,
                  experience: experiencecontroller.text,
                  contactpersonprofile: contactpersonprofilecontroller.text,
                  contactpersonname: contactpersonnamecontroller.text,
                  skill: skillcontroller.text,
                );
              }
            },
            child: Text("Submit"),
          ),
          SizedBox(
            height: height * 0.05,
          )
        ]),
      ),
    );
  }
}

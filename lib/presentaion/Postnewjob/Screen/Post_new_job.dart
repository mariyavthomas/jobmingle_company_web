import 'package:flutter/material.dart';
import 'package:job_mingle_web/utils/Dropdownmenu.dart';
import 'package:job_mingle_web/utils/constlist/listofitem.dart';
import 'package:job_mingle_web/utils/customtextform.dart';

class PostNewJob extends StatefulWidget {
  PostNewJob({super.key});

  @override
  State<PostNewJob> createState() => _PostNewJobState();
}

class _PostNewJobState extends State<PostNewJob> {
  final TextEditingController menujobtitleController = TextEditingController();
  final TextEditingController menulocationController = TextEditingController();
  final TextEditingController numberopeingscontroller = TextEditingController();
  ListDropDown? selectedMenujob;
  ListDropDown? selectedMenulocation;
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
                alignment: Alignment.centerLeft,
                child: Text(
                  "Basic Job Details",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                )),
          ),
          Row(
            children: [
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
                              SizedBox(
                                width: width * 0.9,
                                child: Dropdownmenu(
                                  width,
                                  menujobtitleController,
                                  "Job Title ",
                                  selectedMenujob,
                                  jobtitle,
                                ),
                              ),
                              SizedBox(
                                height: height * 0.04,
                              ),
                              Text(
                                  "Job Location * (Select From The Drop-down)"),
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
                                controller: numberopeingscontroller,
                                hintText: "Eg:1",
                                labeltext: "No Of Openings",
                                style: TextStyle(fontWeight: FontWeight.w100),
                                keyboard: TextInputType.number,
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(2),
                                    borderSide: BorderSide(color: Colors.grey)),
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
              ClipRRect(
                child: Image.asset("lib/assets/image/BlurMobile.png",
                    height: height * 0.65),
              )
            ],
          ),
          Text("Candidate Requirement",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19),),
          SizedBox(
                height: height * 0.02,
              ),
          Center(
            child: Container(
              height: height * 0.4,
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
                          height: height *0.01,
                        )
                      ],
                    ),
                  ),
            ),
          )
        ]),
      ),
    );
  }
}

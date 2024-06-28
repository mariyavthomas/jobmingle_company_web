import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:flutter/material.dart';
import 'package:job_mingle_web/utils/customtextform.dart';
import 'package:job_mingle_web/utils/validator.dart';

class BasicDetails extends StatelessWidget {
  const BasicDetails({
    Key? key,
    required this.height,
    required this.interviewtimecontroller,
    required this.jobtimecontroller,
   
    required this.width,
    required this.menujobtitleController,
    required this.numberopeingscontroller,
    required this.countryCont,
    required this.stateCont,
    required this.cityCont,
  }) : super(key: key);

  final TextEditingController countryCont;
  final TextEditingController stateCont;
  final TextEditingController cityCont;
  final double height;
  final double width;
  final TextEditingController menujobtitleController;
  final TextEditingController numberopeingscontroller;
  final TextEditingController  jobtimecontroller;
  final TextEditingController interviewtimecontroller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 0.9,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: height * 0.99,
              width: width * 0.5,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: const Offset(5.0, 5.0),
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: const Offset(0.0, 0.0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  ),
                ],
              ),
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
                      child: CustomTextFormField(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.grey),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.grey),
                        ),
                        validator: (value) => Validator().jobtitle(value),
                        controller: menujobtitleController,
                        hintText: "Job Title",
                        labeltext: "Enter the Job Title",
                      ),
                    ),
                    SizedBox(
                      height: height * 0.04,
                    ),
                    Text("Job Location * (Select From The Drop-down)"),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Container(
                      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                      height: height * 0.3,
                      width: width * 0.9,
                      child: FormField<String>(
                           
                        builder: (FormFieldState<String> state) {
                          
                          return InputDecorator(
                            
                            decoration: InputDecoration(
                              
                              errorText: state.hasError ? state.errorText : null,
                            ),
                            isEmpty: countryCont.text.isEmpty,
                            child: SelectState(
                              onCountryChanged: (value) {
                                countryCont.text = value;
                                state.didChange(value);
                              },
                              onStateChanged: (value) {
                                stateCont.text = value;
                                state.didChange(value);
                              },
                              onCityChanged: (value) {
                                cityCont.text = value;
                                state.didChange(value);
                              },
                            ),
                          );
                        },
                       
                      ),
                      
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Text("No Of Openings *"),
                    SizedBox(
                      height: height * 0.005,
                    ),
                    CustomTextFormField(
                      validator: (value) => Validator().numberofopening(value),
                      controller: numberopeingscontroller,
                      hintText: "Eg:1",
                      labeltext: "No Of Openings",
                      style: TextStyle(fontWeight: FontWeight.w100),
                      keyboard: TextInputType.number,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.grey),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.grey),
                      ),
                      width: width * 0.9,
                    ),
                    
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Text("Job Time *"),
                    SizedBox(
                      height: height * 0.005,
                    ),
                    CustomTextFormField(
                      validator: (value) => Validator().jobtime(value),
                      controller: jobtimecontroller,
                      hintText: "09:30 AM - 06:30 PM | Monday to Saturday",
                      labeltext: "Job Time",
                      style: TextStyle(fontWeight: FontWeight.w100),
                      keyboard: TextInputType.number,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.grey),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.grey),
                      ),
                      width: width * 0.9,
                    ),
                      SizedBox(
                      height: height * 0.01,
                    ),
                    Text("Interview Time *"),
                    SizedBox(
                      height: height * 0.005,
                    ),
                    CustomTextFormField(
                      validator: (value) => Validator().jobtime(value),
                      controller: interviewtimecontroller,
                      hintText: "09:30 AM - 06:30 PM | Monday to Saturday",
                      labeltext: "Interview Time",
                      style: TextStyle(fontWeight: FontWeight.w100),
                      keyboard: TextInputType.number,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.grey),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.grey),
                      ),
                      width: width * 0.9,
                    ),
                  
                    
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

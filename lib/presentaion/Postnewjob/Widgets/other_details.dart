import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:job_mingle_web/utils/customtextform.dart';
import 'package:job_mingle_web/utils/validator.dart';

class OtherDetails extends StatefulWidget {
  OtherDetails(
      {Key? key,
      required this.experienceController,
      required this.height,
      required this.width,
      required this.dateController,
      required this.decripationOfJobController,
      required this.skillController,
      required this.timeController})
      : super(key: key);

  final TextEditingController experienceController;
  final TextEditingController decripationOfJobController;
  final TextEditingController dateController;
  final TextEditingController timeController;
  final TextEditingController skillController;
  final double height;
  final double width;

  @override
  State<OtherDetails> createState() => _OtherDetailsState();
}

class _OtherDetailsState extends State<OtherDetails> {
  @override
  void initState() {
    super.initState();
    widget.dateController.text = DateFormat('yyyy-MM-dd').format(DateTime.now());
    widget.timeController.text = DateFormat('hh:mm a').format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: widget.height * 0.9,
            width: widget.width * 0.5,
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
                  Text("Job Experience *"),
                  SizedBox(height: widget.height * 0.02),
                  SizedBox(
                    width: widget.width * 0.9,
                    child: CustomTextFormField(
                      focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1, color: Colors.grey)),
                      validator: (value) => Validator().experience(value),
                      controller: widget.experienceController,
                      hintText: "Experience",
                      labeltext: "Enter the Experience",
                    ),
                  ),
                  SizedBox(height: widget.height * 0.01),
                  SizedBox(height: widget.height * 0.04),
                  Text("Job Description"),
                  SizedBox(height: widget.height * 0.02),
                  CustomTextFormField(
                    validator: (value) => Validator().jobAddress(value),
                    controller: widget.decripationOfJobController,
                    hintText: "Give a short description of the job",
                    labeltext: "Job Description",
                    style: TextStyle(fontWeight: FontWeight.w100),
                    keyboard: TextInputType.text,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.grey),
                    ),
                    width: widget.width * 0.9,
                  ),
                  SizedBox(height: widget.height * 0.02),
                  Text("Job Date *"),
                  SizedBox(height: widget.height * 0.02),
                  TextFormField(
                    controller: widget.dateController,
                    onTap: () async {
                      FocusScope.of(context).requestFocus(FocusNode());
                      DateTime? date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100),
                        builder: (BuildContext context, Widget? child) {
                          return Theme(
                            data: ThemeData.dark(),
                            child: child!,
                          );
                        },
                      );
                      if (date != null) {
                        widget.dateController.text = DateFormat('yyyy-MM-dd').format(date).toString();
                      }
                    },
                    validator: (value) => Validator().date(value),
                    decoration: InputDecoration(
                      hintText: 'Job Date',
                      border: OutlineInputBorder(),
                      labelText: 'Job Date',
                    ),
                  ),
                  SizedBox(height: widget.height * 0.02),
                  Text("Job Time *"),
                  SizedBox(height: widget.height * 0.02),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: widget.timeController,
                    onTap: () async {
                      FocusScope.of(context).requestFocus(FocusNode());
                      TimeOfDay? picked = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      if (picked != null) {
                        DateTime parsedTime = DateFormat.jm().parse(picked.format(context));
                        String formattedTime = DateFormat('hh:mm a').format(parsedTime);
                        widget.timeController.text = formattedTime;
                      }
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Job Time is required';
                      }
                      String pattern = r'^(0[1-9]|1[0-2]):[0-5][0-9] (AM|PM)$';
                      RegExp regex = RegExp(pattern);
                      if (!regex.hasMatch(value)) {
                        return 'Enter valid time in HH:MM AM/PM format';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Job Time',
                      border: OutlineInputBorder(),
                      labelText: 'Job Time',
                    ),
                  ),
                  SizedBox(
                    height: widget.height *0.02,
                  ),
                  CustomTextFormField(
                     focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1, color: Colors.grey)),
                    controller: widget.skillController , hintText: "Skills", labeltext: "Enter the skills")
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

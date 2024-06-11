import 'package:flutter/material.dart';
import 'package:intl_phone_field_improve/intl_phone_field.dart';
import 'package:job_mingle_web/utils/validator.dart'; // Ensure the import path is correct

class Phonefield extends StatelessWidget {
 
  final String hintText;

 const Phonefield({
    super. key,
    required  TextEditingController  phonecontroller,
    required this.hintText,
  }): controller =  phonecontroller ;
   final TextEditingController controller ;

  @override
  Widget build(BuildContext context) {
   // Initialize the controller with a default phone number if needed
    // Set your default phone number here if needed

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IntlPhoneField(
        validator: (value) => Validator().numberValidator(value),
        controller:  controller,
        decoration: InputDecoration(
          hintText: hintText,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.black),
          ),
          labelText: "Phone Number",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(width: 3, color: Colors.black),
          ),
        ),
        initialCountryCode: 'IN',
        onChanged: (phone) {
          // Update the controller with the full phone number
          controller.text = phone.completeNumber;
        },
      ),
    );
  }
}

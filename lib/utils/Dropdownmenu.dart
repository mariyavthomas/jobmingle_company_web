import 'package:flutter/material.dart';
import 'package:job_mingle_web/utils/constlist/listofitem.dart';

Widget Dropdownmenu(
  double width,
  TextEditingController menuController,
  String label,
  ListDropDown  selectedMenu,
  List<ListDropDown> list,
  FormFieldValidator validator,
) {
  return DropdownButtonFormField<ListDropDown>(
    value:selectedMenu,
    decoration: InputDecoration(
      labelText: label,
      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
    ),
    validator: validator,
    onChanged: (ListDropDown? newValue) {
      // Update selectedMenu with the label or identifier from newValue
      if (newValue != null) {
        selectedMenu = newValue.label as ListDropDown; // Assuming label is a property of ListDropDown
      }
    },
    items: list.map<DropdownMenuItem<ListDropDown>>((ListDropDown item) {
      return DropdownMenuItem<ListDropDown>(
        value: item,
        child: Text(item.label),
      );
    }).toList(),
  );
}

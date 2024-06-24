import 'package:flutter/material.dart';
import 'package:job_mingle_web/utils/constlist/listofitem.dart';


class CustomDropdownMenu extends StatelessWidget {
  final double width;
  final String label;
  final ListDropDown selectedMenu;
  final List<ListDropDown> list;
  final Function(ListDropDown?)? onChanged;
  final String? Function(ListDropDown?)? validator;

  CustomDropdownMenu({
    required this.width,
    required this.label,
    required this.selectedMenu,
    required this.list,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<ListDropDown>(
      value: selectedMenu,
      items: list.map<DropdownMenuItem<ListDropDown>>((ListDropDown value) {
        return DropdownMenuItem<ListDropDown>(
          value: value,
          child: Text(value.label),
        );
      }).toList(),
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:job_mingle_web/utils/constlist/listofitem.dart';

DropdownMenu<ListDropDown> Dropdownmenu(
    double width,
    TextEditingController menuController,
    String label,
    ListDropDown? selectedMenu,
    List<ListDropDown> list) {
  
  return DropdownMenu<ListDropDown>(
    initialSelection: list.first,
    controller: menuController,
    width: width * 0.48,
    requestFocusOnTap: true,
    enableFilter: true,
    label: Text(label),
    onSelected: (ListDropDown? selected) {
      selectedMenu = selected!;
    },
    dropdownMenuEntries: list.map<DropdownMenuEntry<ListDropDown>>(
      (ListDropDown item) {
        return DropdownMenuEntry<ListDropDown>(
          value: item,
          label: item.label,
        );
      },
    ).toList(),
  );
}

 import 'package:flutter/material.dart';
import 'package:job_mingle_web/utils/constlist/listofitem.dart';

DropdownMenu<ListDropDown> Dropdownmenu(double width, TextEditingController menuController,String label,ListDropDown? selectedMenu,List list) {
  final TextEditingController controller =TextEditingController();
   // ignore: unused_local_variable
   ListDropDown  selectedMenu;
    return DropdownMenu<ListDropDown>(
                                initialSelection: jobtitle.first,
                                controller: controller,
                                width: width * 0.48,
                                requestFocusOnTap: true,
                                enableFilter: true,
                                label:Text(label),
                                onSelected: (ListDropDown? menu) {
                                   selectedMenu = menu!;
                                },
                                dropdownMenuEntries: jobtitle
                                    .map<DropdownMenuEntry<ListDropDown>>(
                                        (ListDropDown menu) {
                                  return DropdownMenuEntry<ListDropDown>(
                                      value: menu,
                                      label: menu.label,
                                     );
                                }).toList(),
                              );
  }
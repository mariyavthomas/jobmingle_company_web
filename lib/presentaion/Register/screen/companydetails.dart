// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:job_mingle_web/application/auth_company/auth_company_bloc.dart';
// import 'package:job_mingle_web/utils/customcolor.dart';

// class DetailsofCompany extends StatelessWidget {
//   const DetailsofCompany({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Color.fromARGB(255, 223, 218, 240),
//         body: Align(
//           alignment: Alignment.center,
//           child: Container(
//             decoration: BoxDecoration(
//                 color: CustomColor.bluelight(),
//                 borderRadius: BorderRadius.circular(10)),
//             height: 600,
//             width: 600,
//             child: Center(
//               child: Column(
//                 children: [
//                   SizedBox(
//                     height: 15,
//                   ),
//                   Container(
//                       height: 40,
//                       width: 40,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           color: Colors.grey),
//                       child: Icon(
//                         Icons.contact_emergency_outlined,
//                         color: Colors.black,
//                         size: 30,
//                       )),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   Center(
//                     child: Text(
//                       '''We need these details to identify you 
//           and create your account''',
//                       style: TextStyle(fontSize: 15, color: Colors.grey),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
                  
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

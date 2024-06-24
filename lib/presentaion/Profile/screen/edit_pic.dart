// import 'dart:io';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:job_mingle_web/utils/customcolor.dart';


// // ignore: must_be_immutable
// class ProfilePicturecompany extends StatelessWidget {
//   ProfilePicturecompany({super.key});
 
//   String? pickedImage;
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: ListView(
//           children:[ Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               IconButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   icon: Icon(
//                     Icons.arrow_back,
//                     color: CustomColor.graycolor(),
//                   )),
//               Padding(
//                 padding: const EdgeInsets.only(left: 20),
//                 child: Text(
//                   'Profile picture',
//                   style: TextStyle(
//                       color: CustomColor.blckcolor(),
//                       fontWeight: FontWeight.bold,
//                       fontSize: 25),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 15),
//                 child: Text(
//                   """ Profile with photo has 40% hiher chance of gettong noticed by recruiters""",
//                   style: TextStyle(color: CustomColor.graycolor(), fontSize: 15),
//                 ),
//               ),
//               SizedBox(
//                 height: 100,
//               ),
//               Align(
//                   alignment: Alignment.center,
//                   child: Padding(
//                     padding: const EdgeInsets.only(top: 19),
//                     child: CircleAvatar(
//                       maxRadius: 102,
//                       backgroundColor: Colors.grey,
//                       child: GestureDetector(
//                         onTap: () {
//                           showModalBottomSheet(
//                               context: context,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.vertical(
//                                     top: Radius.circular(20.0)),
//                               ),
//                               builder: (BuildContext context) {
//                                 // ignore: unused_label
        
//                                 return Padding(
//                                   padding: const EdgeInsets.all(16.0),
//                                   child: Column(
//                                     mainAxisSize: MainAxisSize.min,
//                                     children: [
//                                       SizedBox(height: 16.0),
//                                       Align(
//                                         alignment: Alignment.topLeft,
//                                         child: Text(
//                                           'Upload Profile Picture Via',
//                                           style: TextStyle(
//                                               fontSize: 20.0,
//                                               color: CustomColor.blckcolor(),
//                                               fontWeight: FontWeight.bold),
//                                         ),
//                                       ),
//                                       SizedBox(height: 24.0),
//                                       BlocBuilder<UpdatePicBloc, UpdatePicState>(
//                                         builder: (context, state) {
//                                           // if(state is UploadImageSuccess){
//                                           //   // pickedImage=state.image?.path;
//                                           // }
//                                           return Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.start,
//                                             children: [
//                                               SizedBox(
//                                                 width: 230,
//                                               ),
//                                               TextButton(
//                                                 onPressed: () async {
//                                                   // ignore: unused_local_variable
//                                                   context.read<UpdatePicBloc>().add(
//                                                       UploadCameraPictureEvent());
//                                                   // context
//                                                   //     .read<UpdatePicBloc>()
//                                                   //     .add(SaveEvent());
//                                                   pickedImage != null
//                                                       ? FileImage(
//                                                           File(pickedImage!))
//                                                       : null;
        
//                                                   Navigator.pop(context);
//                                                 },
//                                                 child: Text(
//                                                   'Gallery',
//                                                   style: TextStyle(
//                                                       color: Color.fromARGB(
//                                                           200, 75, 110, 225)),
//                                                 ),
//                                               ),
//                                               //SizedBox(width: 100),
//                                               ElevatedButton(
//                                                 style: ButtonStyle(
//                                                     backgroundColor:
//                                                         MaterialStatePropertyAll(
//                                                             Color.fromARGB(200,
//                                                                 75, 110, 225))),
//                                                 onPressed: () async {
//                                                   context.read<UpdatePicBloc>().add(
//                                                       UploadgalleryPictureEvent());
//                                                   //imagefire.uploadImageToFirebase(File(state.file!.path));
//                                                   Navigator.pop(context);
//                                                 },
//                                                 child: Text('Camera'),
//                                               ),
//                                             ],
//                                           );
//                                         },
//                                       ),
//                                     ],
//                                   ),
//                                 );
//                               });
//                         },
//                         child: BlocBuilder<UpdatePicBloc, UpdatePicState>(
//                           builder: (context, state) {
//                             return CircleAvatar(
//                               maxRadius: 100,
//                               backgroundImage: state.file != null
//                                   ? FileImage(File(state.file!.path))
//                                   : null,
//                               backgroundColor: Color.fromARGB(255, 139, 137, 137),
//                               child: state.file != null
//                                   ? SizedBox()
//                                   : Icon(
//                                       Icons.person_add,
//                                       size: 40,
//                                       color: CustomColor.graycolor(),
//                                     ),
//                             );
        
//                           },
//                         ),
//                       ),
//                     ),
//                   )),
//                   Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Text(''' Supported file formate:PNG ,JPG,GIF MAXIMUM FILE Size upto 2 MB''',style: TextStyle(color: Colors.grey),),
//                   ),
//               SizedBox(
//                 height: 250,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   TextButton(
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                       child: Text(
//                         "Cancel",
//                         style: TextStyle(fontSize: 18),
//                       )),
//                   SizedBox(
//                     width: 30,
//                   ),
//                   BlocBuilder<UpdatePicBloc, UpdatePicState>(
//                     builder: (context, state) {
                      
//                       return ElevatedButton(
//                           style: ButtonStyle(),
//                           onPressed: () {
//                             context.read<UpdatePicBloc>().add(Uploadfirebaseimage(file: state.file!, uid: FirebaseAuth.instance.currentUser!.uid));
//                             Navigator.pop(context);
//                           },
//                           child: Text(
//                             "Save",
//                             style: TextStyle(fontSize: 18),
//                           ));
//                     },
//                   )
//                 ],
//               )
//             ],
//           ),
//         ]),
//       ),
//     ));
//   }
// }

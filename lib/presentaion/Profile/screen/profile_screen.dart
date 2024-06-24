import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_mingle_web/application/getdata/getdatafromcompany_bloc.dart';
import 'package:job_mingle_web/utils/customcolor.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();
    final user = FirebaseAuth.instance.currentUser;
   if(user != null){
    BlocProvider.of<GetdatafromcompanyBloc>(context).add(GetdatafromcompanyEvent());
   }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double width = MediaQuery.of(context).size.width;
    // ignore: unused_local_variable
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<GetdatafromcompanyBloc, GetdatafromcompanyState>(
          builder: (context, state) {
            if (state is Loadeddatafromcompanystate) {
              print(state.user.phone);
              return ListView(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: height *0.05,
                      ),
                      InkWell(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => ProfilePicturecompany()));
                        },
                        child: CircleAvatar(
                          radius: 40,
                          child: Icon(
                            Icons.person_add,
                            size: 40,
                            color: CustomColor.graycolor(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height* 0.01,
                      ),
                      Container(
                        width: width *0.9,
                        height: height *0.8,
                        decoration: BoxDecoration(
                          color: Colors.blue[100],
                          borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: height *0.01,),
                            Center(
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: width * 0.01,
                                  ),
                                  Center(
                                    child: Text(
                                      'Company Name : ${  state.user.companyname!.toUpperCase()}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey,
                                          fontSize: 20),
                                    ),
                                  ),
                                  SizedBox(
                                    width: width *0.5,
                                  ),
                                  Icon(
                                    Icons.edit,
                                    color: CustomColor.bluelight(),
                                  ),

                                ],
                              ),
                              
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: width * 0.01,
                                ),
                                Text('Company PhoneNumber: ${state.user.phone}'),
                                SizedBox(
                                  width: width * 0.53,
                                ),
                                Icon(
                                    Icons.edit,
                                    color: CustomColor.bluelight(),
                                  ),
                              ],
                            ),
                             SizedBox(
                              height: height * 0.02,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: width * 0.01,
                                ),
                                Text('Company Email: mariyavthomas2019@gmail.com'),
                                SizedBox(
                                  width: width * 0.44,
                                ),
                                Icon(
                                    Icons.edit,
                                    color: CustomColor.bluelight(),
                                  ),
                              ],
                            ),
                            SizedBox(
                              height: height *0.03,
                            ),
                            Center(child: Text("Basic Details",style: TextStyle(fontWeight: FontWeight.bold),)),
                            SizedBox(
                              height:  height * 0.01,
                            ),
                            Center(
                              child: Container(
                                height: height *0.2,
                                width: width * 0.5,
                                decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
                                child: Column(children: [
                                  SizedBox(
                                    height:  height *0.01,
                                  ),
                                  IconButton(onPressed: (){}, icon: Icon(Icons.upload_file,size: 50,color: Colors.grey,)),
                                  SizedBox(
                                    height: height *0.03,
                                  ),
                                  Text("Company details Documents")
                                ],)
                              ),
                            )

                          ],
                        ),
                      )
                    ],
                  )
                ],
              );
            }
            return Center(
             child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}

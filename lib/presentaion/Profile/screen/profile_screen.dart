// ignore_for_file: must_be_immutable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_mingle_web/application/getdata/getdatafromcompany_bloc.dart';
import 'package:job_mingle_web/presentaion/profile/widget/profilebody.dart';
import 'package:job_mingle_web/utils/customcolor.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Profilemain extends StatefulWidget {
  const Profilemain({super.key});

  @override
  State<Profilemain> createState() => _ProfilemainState();
}

class _ProfilemainState extends State<Profilemain> {
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      context.read<GetdatafromcompanyBloc>().add(GetdatafromcompanyEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocListener<GetdatafromcompanyBloc, GetdatafromcompanyState>(
          listener: (context, state) {
            if (state is UpdateCompanySuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Profile Successfully Updated'),
                  backgroundColor: Colors.green,
                ),
              );
              _loadData(); // Reload the data after successful update
            }
          },
          child: BlocBuilder<GetdatafromcompanyBloc, GetdatafromcompanyState>(
            builder: (context, state) {
              if (state is Loadeddatafromcompanystate) {
                return _buildProfilePage(context, state);
              } else if (state is Getdatafromcompanyloadingstate) {
                return Center(
                  child: LoadingAnimationWidget.stretchedDots(
                      color: CustomColor.bluelight(), size: 90),
                );
              }
              return Center(child: Text('No Data Available'));
            },
          ),
        ),
      ),
    );
  }

  Widget _buildProfilePage(
      BuildContext context, Loadeddatafromcompanystate state) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return ProfileBody(
      width: width,
      height: height,
      state: state,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_mingle_web/presentaion/applicants/widgets/body/cards/rejected_card.dart';
import 'package:job_mingle_web/presentaion/chat/screen/mainchatscreen.dart';
import 'package:job_mingle_web/presentaion/home/screen/home.dart';
import 'package:job_mingle_web/presentaion/rejected_candidate/screen/Listofcandidate.dart';
import 'package:job_mingle_web/presentaion/rejected_candidate/screen/rejected.dart';
import 'package:job_mingle_web/presentaion/shortlisted/screen/shortlist.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:job_mingle_web/application/auth_company/auth_company_bloc.dart';
import 'package:job_mingle_web/application/post_job/postjob_bloc.dart';
import 'package:job_mingle_web/domain/company_model.dart';
import 'package:job_mingle_web/presentaion/Applicants/screen/allapplicant_screen.dart';
import 'package:job_mingle_web/presentaion/Postnewjob/Screen/Post_new_job.dart';
import 'package:job_mingle_web/presentaion/Profile/screen/profile_screen.dart';

class CompanyHomeScreen extends StatefulWidget {
  const CompanyHomeScreen({super.key});

  @override
  State<CompanyHomeScreen> createState() => _CompanyHomeScreenState();
}

class _CompanyHomeScreenState extends State<CompanyHomeScreen> {
  final _sidebarController =
      SidebarXController(selectedIndex: 0, extended: true);

  @override
  void initState() {
    super.initState();
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final company = Companymodel(companyuid: user.uid);
      BlocProvider.of<PostjobBloc>(context).add(FetchJobs());
    }
  }

  Widget _getPageByIndex(int index) {
    switch (index) {
      case 0:
        return HomeScreen();
      case 1:
        return AllApplicant();
      case 2:
        return Profilemain();
      case 3:
        return PostNewJob(isedit: false);
      case 4:
        return Shortlist();
       case 5:
       return RejectedCandidates() ;
       case 6:
       return ChatRoomListScreen();
      case 7:
        return HomeScreen();
      default:
        return Center(child: Text('Page not found'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:  const Color.fromARGB(255, 193, 226, 249),
        body: Row(
          children: [
            SidebarX(
              controller: _sidebarController,
              theme: SidebarXTheme(
                width: 190,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 3, 1, 1).withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(20),
                ),
                textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
                selectedTextStyle: const TextStyle(
                  color: Colors.blue,  // Color for selected text
                  fontSize: 16,
                ),
                itemTextPadding: const EdgeInsets.only(left: 30),
                selectedItemTextPadding: const EdgeInsets.only(left: 30),
                selectedItemDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.blue,
                  ),
                ),
                iconTheme: IconThemeData(
                  color: Colors.black.withOpacity(0.8),
                  size: 20,
                ),
                selectedIconTheme: const IconThemeData(
                  color: Colors.blue,
                  size: 20,
                ),
              ),
              headerBuilder: (context, extended) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: const [
                      CircleAvatar(
                        backgroundImage: AssetImage('lib/assets/image/logo.png'),
                      ),
                      Text('Job Mingle'),
                    ],
                  ),
                );
              },
              items: [
                SidebarXItem(
                  icon: Icons.home,
                  label: 'Home',
                  onTap: () {
                    _sidebarController.selectIndex(0);
                  },
                ),
                SidebarXItem(
                  icon: Icons.people,
                  label: 'All Applicants',
                  onTap: () {
                    _sidebarController.selectIndex(1);
                  },
                ),
                SidebarXItem(
                  icon: Icons.person,
                  label: 'Profile',
                  onTap: () {
                    _sidebarController.selectIndex(2);
                  },
                ),
                SidebarXItem(
                  icon: Icons.add_circle,
                  label: 'Post New Job',
                  onTap: () {
                    _sidebarController.selectIndex(3);
                  },
                ),
                SidebarXItem(
                  icon: Icons.list,
                  label: 'ShortListed',
                  onTap: () {
                    _sidebarController.selectIndex(4); // Selecting index 4
                  },
                ),
                SidebarXItem(
                  icon: Icons.warning,
                  label: 'Rejected',
                  onTap: () {
                    _sidebarController.selectIndex(5); // Selecting index 4
                  },
                ),
                SidebarXItem(
                  icon: Icons.chat,
                  label: 'Chat Room',
                  onTap: () {
                    _sidebarController.selectIndex(6); // Selecting index 4
                  },
                ),
               
                SidebarXItem(
                  icon: Icons.logout,
                  label: 'Sign Out',
                  onTap: () {
                    _signOut(context);
                  },
                ),
              ],
            ),
            Expanded(
              child: AnimatedBuilder(
                animation: _sidebarController,
                builder: (context, child) {
                  return _getPageByIndex(_sidebarController.selectedIndex);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _signOut(BuildContext context) async {
    final confirm = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Sign Out'),
          content: const Text('Are you sure you want to sign out?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text('Sign Out'),
            ),
          ],
        );
      },
    );

    if (confirm == true) {
      final authBloc = BlocProvider.of<AuthCompanyBloc>(context);
      authBloc.add(SignOutCompany());

      Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
    }
  }
}

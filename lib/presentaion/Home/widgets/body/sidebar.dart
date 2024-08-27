// import 'package:collapsible_sidebar/collapsible_sidebar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:job_mingle_web/application/ItemSelectionCubit/item_selection_cubit_bloc.dart';
// import 'package:job_mingle_web/application/ItemSelectionCubit/item_selection_cubit_state.dart';
// import 'package:job_mingle_web/presentaion/Profile/screen/profile_screen.dart';

// class SidebarPage extends StatefulWidget {
//   @override
//   _SidebarPageState createState() => _SidebarPageState();
// }

// class _SidebarPageState extends State<SidebarPage> {
//   late List<CollapsibleItem> _items;
//   final AssetImage _avatarImg = AssetImage('assets/man.png');

//   @override
//   void initState() {
//     super.initState();
//     _items = _generateItems();
//   }

//   List<CollapsibleItem> _generateItems() {
//     return [
//       CollapsibleItem(
//         text: 'Dashboard',
//         icon: Icons.assessment,
//         onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>Profilemain())),
//         onHold: () => ScaffoldMessenger.of(context)
//             .showSnackBar(SnackBar(content: const Text("Dashboard"))),
//         isSelected: context.read<ItemSelectionCubit>().state.selectedItem == 'Dashboard',
//       ),
//       CollapsibleItem(
//         text: 'Profile',
//         icon: Icons.person,
//         onPressed: () =>Navigator.push(context, MaterialPageRoute(builder: (context)=>Profilemain())),
//         onHold: () => ScaffoldMessenger.of(context)
//             .showSnackBar(SnackBar(content: const Text("Profile"))),
//         isSelected: context.read<ItemSelectionCubit>().state.selectedItem == 'Profile',
//       ),
//       CollapsibleItem(
//         text: 'Settings',
//         icon: Icons.settings,
//         onPressed: () => context.read<ItemSelectionCubit>().selectItem('Settings'),
//         onHold: () => ScaffoldMessenger.of(context)
//             .showSnackBar(SnackBar(content: const Text("Settings"))),
//         isSelected: context.read<ItemSelectionCubit>().state.selectedItem == 'Settings',
//       ),
//       CollapsibleItem(
//         text: 'Notifications',
//         icon: Icons.notifications,
//         onPressed: () => context.read<ItemSelectionCubit>().selectItem('Notifications'),
//         onHold: () => ScaffoldMessenger.of(context)
//             .showSnackBar(SnackBar(content: const Text("Notifications"))),
//         isSelected: context.read<ItemSelectionCubit>().state.selectedItem == 'Notifications',
//       ),
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ItemSelectionCubit, ItemSelectionState>(
//       builder: (context, state) {
//         return CollapsibleSidebar(
//           items: _items,
//           body: Center(
//             child: Text(
//               state.selectedItem,
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//           ),
//           avatarImg: _avatarImg,
//           title: 'Job Mingle',
//           onTitleTap: () => ScaffoldMessenger.of(context)
//               .showSnackBar(SnackBar(content: Text('Title clicked'))),
//           textStyle: TextStyle(color: Colors.white), // Text color for items
//           titleStyle: TextStyle(color: Colors.white, fontSize: 22), // Title text color
//           backgroundColor: Colors.black, // Sidebar background color
//           sidebarBoxShadow: [
//             BoxShadow(
//               color: Colors.indigo,
//               blurRadius: 20,
//               spreadRadius: 0.01,
//               offset: Offset(3, 3),
//             ),
//             BoxShadow(
//               color: Colors.grey,
//               blurRadius: 50,
//               spreadRadius: 0.01,
//               offset: Offset(3, 3),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

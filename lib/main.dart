


import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_mingle_web/application/auth_company/auth_company_bloc.dart';
import 'package:job_mingle_web/firebase_options.dart';
import 'package:job_mingle_web/utils/routes.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(
  options:  DefaultFirebaseOptions.currentPlatform,);
  runApp(const MyApp());
 
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:[
        BlocProvider(create: (context)=>AuthCompanyBloc()..add(CheckLoginStatusEventCompany())
        ),
      ],
      child:MaterialApp(
         theme: ThemeData(
            progressIndicatorTheme:
                ProgressIndicatorThemeData(color: Colors.blue),
            textTheme: TextTheme(
                displayLarge: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
                bodySmall: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 14)),
            appBarTheme:
                AppBarTheme(backgroundColor: Color.fromARGB(200, 75, 110, 225)),
            scaffoldBackgroundColor: Colors.white),
        debugShowCheckedModeBanner: false,
        // go to the splashscreen
        initialRoute: '/',
        routes: Routers().routes,
      )
    );
  }
}
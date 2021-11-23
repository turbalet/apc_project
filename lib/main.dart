
import 'package:apc_project/ui/auth_reg/screens/verify.dart';
import 'package:apc_project/ui/landing/landing_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
          builder: ()=> const MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'APC',
            home: LandingPage(),
          ),
        designSize: const Size(428, 926),
      );
  }
}
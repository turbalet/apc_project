import 'package:apc_project/data/storage.dart';
import 'package:apc_project/foundation/constants.dart';
import 'package:apc_project/ui/home/home_page.dart';
import 'package:apc_project/ui/lecture/lecture_page.dart';
import 'package:apc_project/ui/practice/practice_page.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Storage.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: ()=> MaterialApp(
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white
          ),
          debugShowCheckedModeBanner: false,
          title: 'APC',
          home: PracticePage(),
      ),
      designSize: const Size(428, 926),
    );
  }
}
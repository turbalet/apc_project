import 'package:apc_project/foundation/constants.dart';
import 'package:apc_project/ui/home/home_page.dart';
import 'package:apc_project/ui/profile/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (value) {
        if (value == 0) Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
        if (value == 2) Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
      },
      iconSize: 30.w,
      backgroundColor: backgroundItem,
      items: [
        BottomNavigationBarItem(
          title: Text(""),
          icon: Icon(
            Icons.home_outlined,
            color: Colors.white,
          ),
        ),
        BottomNavigationBarItem(
          title: Text(""),
          icon: Icon(
            Icons.search,
            color: Colors.white,
          ),
        ),
        BottomNavigationBarItem(
          title: Text(""),
          icon: Icon(
            Icons.account_circle_outlined,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}

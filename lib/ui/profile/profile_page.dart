import 'package:apc_project/foundation/constants.dart';
import 'package:apc_project/ui/auth_reg/services/achievement_service.dart';
import 'package:apc_project/ui/auth_reg/services/progress_service.dart';
import 'package:apc_project/ui/components/bottom_nav_bar.dart';
import 'package:apc_project/ui/profile/components/info_body.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/edit_body.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);


  final AchievementService achievementService = AchievementService();

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

Future getUserAchievements() async {
  QuerySnapshot futureCol = await FirebaseFirestore.instance.collection('user_achievements').where("userId", isEqualTo: FirebaseAuth.instance.currentUser!.uid).get();
  return futureCol.docs;
}

class _ProfilePageState extends State<ProfilePage> {
  bool isEdit = false;
  String name = "Веселый";
  String surname = "Единорог";
  var progress = 1;
  var achievements = [];
  var userAchievements = [];

  _buildBody(BuildContext context) {

    final firestoreInstance = FirebaseFirestore.instance;
    var user = FirebaseAuth.instance.currentUser;
    firestoreInstance.collection("users").doc(user!.uid).get().then((value){
      setState(() {
        name = value.data()!['name'];
        surname = value.data()!['surname'];
      });
    });

    firestoreInstance.collection("progresses").doc(user.uid).get().then((value){
      setState(() {
        progress = value.data()!['score'];
      });
    });

    firestoreInstance.collection("achievements").get().then((value){
      setState(() {
        achievements = value.docs;
      });
    });

    Future<QuerySnapshot> futureCol =  FirebaseFirestore.instance.collection('user_achievements').where("userId", isEqualTo: FirebaseAuth.instance.currentUser!.uid).get();
    setState(() {
      futureCol.then((value) =>
        userAchievements = value.docs
      );
    });

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 31.w),
        child: Column(
          children: [
            SizedBox(height: 41.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Профиль",
                  style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 28.sp),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isEdit = !isEdit;
                    });
                  },
                  child: Container(
                    height: 45.h,
                    width: 54.w,
                    decoration: BoxDecoration(
                        color: backgroundItem,
                        borderRadius: BorderRadius.circular(12.r)),
                    child: Center(
                        child: Icon(
                          isEdit ? Icons.check_circle_outline : Icons.settings_rounded,
                          size: 30.sp,
                          color: CupertinoColors.white,
                        )),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 61.h,
            ),
            Center(
              child: Image(
                width: 132.w,
                height: 120.h,
                image: AssetImage(
                  "assets/images/avatar.png",
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Center(
              child: Text(
                name + " " + surname,
                style: GoogleFonts.roboto(
                    fontSize: 26.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            SizedBox(height: 45.h),
            isEdit ? EditBody() : InfoBody(score: progress, achievements: achievements, userAchievements: userAchievements)
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
        bottomNavigationBar: BottomNavBar(),
        body: Column(
          children: [
            _buildBody(context),
          ],
        )
    );
  }
}


import 'package:apc_project/data/model/unit.dart';
import 'package:apc_project/data/storage.dart';
import 'package:apc_project/foundation/constants.dart';
import 'package:apc_project/ui/auth_reg/services/auth_service.dart';
import 'package:apc_project/ui/components/bottom_nav_bar.dart';
import 'package:apc_project/ui/home/components/chapter_item.dart';
import 'package:apc_project/ui/lecture/lecture_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';


import 'components/extra_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  List chapters = [];
  String name = "";
  var progress = <String, dynamic>{ "score": "", "unit" : "", "chapter": ""};

  @override
  void initState() {
    chapters = getChaptersList();
    super.initState();
  }

  List getChaptersList() {
    return Storage.chapterList!.chapters;
  }

  List<Widget> _getChapters(items) {
    return items.map<Widget>((i) => Row(children: [ChapterItem(chapter: i, progress: progress), SizedBox(width: 12.w)])).toList();
  }

  _buildChapterCarousel(var items) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SizedBox(width: 31.w,),
          ..._getChapters(chapters),

        ],
      ),
    );
  }

  List<Widget> _getExtras(items) {
    return items.map<Widget>((i) => Row(children: [ExtraItem(text: "қолшатыр\n[qol:shaty’r]", img: "assets/images/umbrella.png"), SizedBox(width: 12.w)])).toList();
  }

  List<Widget> _getExtras2(items) {
    return items.map<Widget>((i) => Row(children: [ExtraItem(text: "арыстан\n[ary’stan]", img: "assets/images/lev.png"), SizedBox(width: 12.w)])).toList();
  }

  _buildExtraCarousel(var items) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SizedBox(width: 31.w,),
          ..._getExtras([1]),
          ..._getExtras2([1]),
        ],
      ),
    );
  }

  _buildBody(BuildContext context) {
    final firestoreInstance = FirebaseFirestore.instance;
    var user = FirebaseAuth.instance.currentUser;
    firestoreInstance.collection("users").doc(user!.uid).get().then((value){
      setState(() {
        name = value.data()!['name'];
      });
    });

    firestoreInstance.collection("progresses").doc(user.uid).get().then((value){
      setState(() {
        progress = value.data()!;
      });
    });


    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 31.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 41.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text(
                            "Салем, " + name + " 👋",
                            style: GoogleFonts.roboto(color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 27.sp),
                          ),
                    Container(
                      height: 45.h,
                      constraints: BoxConstraints(

                      ),

                      decoration: BoxDecoration(
                          color: backgroundItem,
                          borderRadius: BorderRadius.circular(30.r)
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 26.w),
                        child:
                        Row(
                          children: [
                            Icon(
                              Icons.star_rounded,
                              size: 22.w,
                              color: primary,
                            ),
                            SizedBox(width: 10.w,),
                            Text(
                              progress['score'].toString(),
                              style: GoogleFonts.roboto(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22.sp),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 46.h),
                Text(
                  "НЕДАВНЕЕ",
                  style: GoogleFonts.roboto(fontSize: 18.sp, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                SizedBox(height: 25.h),
                Stack(
                  children: [
                    Container(
                        height: 205.h,
                        width: 366.w,
                        decoration: BoxDecoration(
                          color: primary,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 23.w, top: 34.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [

                                  Padding(
                                    padding: EdgeInsets.only(top: 30.h),
                                    child: Text("Глава " + progress['chapter'], style: GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 34.sp, color: Colors.white),),
                                  ),
                                ],
                              ),
                              Image(width: 206.w, height: 165.h, image: AssetImage("assets/images/nedav.png"))
                            ],
                          ),
                        )
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 31.w, top: 150.h),
                      child: CircularPercentIndicator(
                        radius: 110.r,
                        lineWidth: 10.w,
                        percent: 0.01,
                        center: GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => LecturePage(unit: Unit.getUnit(progress['unit']),)));
                          },
                          child: Container(
                            height: 90.h,
                            width: 80.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60.r),
                              color: primary,
                            ),
                            child: Center(
                              child: Text(
                                "Начать",
                                style: GoogleFonts.roboto(color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        progressColor: Colors.white,
                        backgroundColor: progressBorder,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 33.h),
              ],
            ),
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 31.w, right: 5.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(

                      "ГЛАВЫ",
                      style: GoogleFonts.roboto(fontSize: 18.sp, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    Row(
                      children: [
                        Text(
                          "Посмотреть все",
                          style: GoogleFonts.roboto(fontSize: 14.sp, color: Colors.white),
                        ),
                        Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 12.w
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 33.h),
              _buildChapterCarousel([1,2,3,4,5]),
              SizedBox(height: 33.h),
              Padding(
                padding: EdgeInsets.only(left: 31.w, right: 5.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(

                      "ДОПОЛЬНИТЕЛЬНО",
                      style: GoogleFonts.roboto(fontSize: 18.sp, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    Row(
                      children: [
                        Text(
                          "Посмотреть все",
                          style: GoogleFonts.roboto(fontSize: 14.sp, color: Colors.white),
                        ),
                        Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 12.w
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 33.h),
              _buildExtraCarousel([1,2,3,]),
              SizedBox(height: 25.h,)
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
        bottomNavigationBar: BottomNavBar(),
        body: SingleChildScrollView(child: _buildBody(context),)
    );
  }

}


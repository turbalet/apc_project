import 'package:apc_project/data/storage.dart';
import 'package:apc_project/foundation/constants.dart';
import 'package:apc_project/ui/components/bottom_nav_bar.dart';
import 'package:apc_project/ui/home/components/chapter_item.dart';
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

  late List chapters;

  @override
  void initState() {
    chapters = getChaptersList();
    super.initState();
  }

  List getChaptersList() {
    return Storage.chapterList.chapters;
  }

  List<Widget> _getChapters(items) {
    return items.map<Widget>((i) => Row(children: [ChapterItem(chapter: i,), SizedBox(width: 12.w)])).toList();
  }

  _buildChapterCarousel(var items) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ..._getChapters(chapters),

        ],
      ),
    );
  }

  List<Widget> _getExtras(items) {
    return items.map<Widget>((i) => Row(children: [ExtraItem(), SizedBox(width: 12.w)])).toList();
  }

  _buildExtraCarousel(var items) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ..._getExtras(items),

        ],
      ),
    );
  }

  _buildBody() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 31.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 61.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Салем, Бекжан 👋",
                  style: GoogleFonts.roboto(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24.sp),
                ),
                Container(
                  height: 45.h,
                  width: 122.w,
                  decoration: BoxDecoration(
                      color: backgroundItem,
                      borderRadius: BorderRadius.circular(30.r)
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 26.w),
                    child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.star_rounded,
                          size: 22.w,
                          color: primary,
                        ),
                        Text(
                          "2222",
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
              "Недавнее",
              style: GoogleFonts.roboto(fontSize: 18.sp, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 33.h),
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
                              Text("Глава 1\nЮнит 1", style: GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 34.sp, color: Colors.white),),
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
                    center: Container(
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
                    progressColor: Colors.white,
                    backgroundColor: progressBorder,
                  ),
                ),
              ],
            ),
            SizedBox(height: 33.h),
            Row(
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
            SizedBox(height: 33.h),
            _buildChapterCarousel([1,2,3,4,5]),
            SizedBox(height: 33.h),
            Row(
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
            SizedBox(height: 33.h),
            _buildExtraCarousel([1,2,3,]),
            SizedBox(height: 25.h,)
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
        body: SingleChildScrollView(child: _buildBody(),)
    );
  }

}


import 'package:apc_project/foundation/constants.dart';
import 'package:apc_project/ui/components/bottom_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AchievementsBody extends StatefulWidget {

  var achievements = [];

  AchievementsBody({Key? key, required this.achievements}) : super(key: key);

  @override
  _AchievementsBodyState createState() => _AchievementsBodyState();
}

class _AchievementsBodyState extends State<AchievementsBody> {


  _achievement(int index) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: primary
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: Column(
                children: [
                  Text(
                    widget.achievements[index]['name'],
                    style: GoogleFonts.roboto(fontSize: 20.sp, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    widget.achievements[index]['description'],
                    style: GoogleFonts.roboto(fontSize: 18.sp, color: Colors.white),
                  )
                ],
              ),
            ),
            Icon(

                  Icons.check_circle_outline,

              color: Colors.white,
              size: 30.w,
            )

          ],
        ),
      ),
    );
  }

  _buildBody() {
    return SafeArea(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 27.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40.h),
            Text(
              "Достижения",
              style: GoogleFonts.roboto(fontSize: 24.sp,fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 31.h),
            Container(
              constraints: BoxConstraints(
                minHeight: 121.h,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: backgroundItem
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 27.w, vertical: 15.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        SizedBox(height: 10.h),
                        Text(
                          "Здесь показаны все\nдостижения",
                          style: GoogleFonts.roboto(fontSize: 18.sp, color: Colors.white),
                        ),
                      ],
                    ),
                    Image(
                      image: AssetImage("assets/images/award.png"),
                      width: 100.w,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 40.h),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: backgroundItem
              ),
              child:
              ListView.separated(
                itemCount: widget.achievements.length,
                separatorBuilder: (BuildContext context, int index) => SizedBox(height: 25.h),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) => _achievement(index ),
              ),
            ),
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
            _buildBody(),
          ],
        )
    );
  }
}

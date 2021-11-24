import 'package:apc_project/foundation/constants.dart';
import 'package:apc_project/ui/auth_reg/services/achievement_service.dart';
import 'package:apc_project/ui/auth_reg/services/progress_service.dart';
import 'package:apc_project/ui/profile/components/achievements_body.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoBody extends StatelessWidget {

  int score;
  var achievements = [];
  var userAchievements = [];

  InfoBody({Key? key, required this.score, required this.achievements, required this.userAchievements}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "Очки",
                      style: GoogleFonts.roboto(
                          fontSize: 14.sp, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 11.h,
                    ),
                    Container(
                      height: 61.h,
                      width: 92.w,
                      decoration: BoxDecoration(
                          color: backgroundItem,
                          borderRadius: BorderRadius.circular(20.r)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.star_rounded,
                              size: 22.w,
                              color: primary,
                            ),
                            SizedBox(width: 10.w,),
                            Text(
                            score.toString(),
                              style: GoogleFonts.roboto(
                                  color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: 43.w,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Прогресс",
                      style: GoogleFonts.roboto(
                          fontSize: 14.sp, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 11.h,
                    ),
                    Container(
                      height: 61.h,
                      width: 92.w,
                      decoration: BoxDecoration(
                          color: backgroundItem,
                          borderRadius: BorderRadius.circular(20.r)),
                      child: Center(
                          child: Text(
                        "5%",
                        style: GoogleFonts.roboto(
                            color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.bold),
                      )),
                    )
                  ],
                ),
                SizedBox(
                  width: 43.w,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => AchievementsBody(achievements: achievements,)));
                  },
                  child: Column(
                    children: [
                      Text(
                        "Достижения",
                        style: GoogleFonts.roboto(
                            fontSize: 14.sp, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 11.h,
                      ),
                      Container(
                        height: 61.h,
                        width: 92.w,
                        decoration: BoxDecoration(
                            color: backgroundItem,
                            borderRadius: BorderRadius.circular(20.r)),
                        child: Center(
                            child: Text(
                           userAchievements.length.toString() + "/" + achievements.length.toString(),
                          style: GoogleFonts.roboto(
                              color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.bold),
                        )),
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 59.h),
            Center(
              child: Text(
                "Ваш Статус",
                style: GoogleFonts.roboto(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            SizedBox(height: 38.h),
          ],
        ),
        CarouselSlider(
          items: [
            Column(
              children: [
                Image(
                  image: AssetImage("assets/images/boy1.png"),
                  width: 240.w,
                  height: 148.h,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "Начинающий",
                  style:
                      GoogleFonts.roboto(fontSize: 22.sp, color: Colors.white),
                )
              ],
            ),
            Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Opacity(
                      opacity: 0.1,
                      child: Image(
                        image: AssetImage("assets/images/boy2.png"),
                        width: 220.w,
                        height: 148.h,
                      ),
                    ),
                    Center(
                      child: Icon(
                        Icons.lock,
                        color: Colors.white,
                        size: 45.w,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "Мастер",
                  style:
                      GoogleFonts.roboto(fontSize: 22.sp, color: Colors.white),
                )
              ],
            )
          ],
          options: CarouselOptions(
            height: 208.h,
            enlargeCenterPage: true,
            autoPlay: false,
            enableInfiniteScroll: false,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            viewportFraction: 0.4,
          ),
        )
      ],
    );
  }
}

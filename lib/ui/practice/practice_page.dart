import 'package:apc_project/foundation/constants.dart';
import 'package:apc_project/ui/components/bottom_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class PracticePage extends StatefulWidget {
  const PracticePage({Key? key}) : super(key: key);

  @override
  _PracticePageState createState() => _PracticePageState();
}

class _PracticePageState extends State<PracticePage> {

  _buildBody() {
    return SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 27.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 41.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.arrow_back_ios_rounded,
                        size: 20.w,
                        color: Colors.white,
                      ),
                      SizedBox(width: 15.w,),
                      Text(
                        "Глава 1 Урок 2",
                        style: GoogleFonts.nunito(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24.sp),
                      ),
                    ],
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
                            color: Colors.white,
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
              SizedBox(height: 57.h),
              Text(
                "Задание 2/7",
                style: GoogleFonts.roboto(fontSize: 25.sp, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 25.h),
              Center(
                child: LinearPercentIndicator(
                  width: 370.w,
                  animation: false,
                  lineHeight: 5.0.h,
                  percent: 0.1,
                  linearStrokeCap: LinearStrokeCap.roundAll,
                  progressColor: primary,
                ),
              ),
              SizedBox(height: 50.h),
              Text(
                  "Айша алманы алып, уйге кетып ",

              ),
            ],
          ),
        )
    );
  }


  @override
  Widget build(BuildContext context) {
   return Scaffold(
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(child: _buildBody(),)
    );
  }
}

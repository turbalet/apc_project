// ignore: file_names
import 'package:apc_project/data/model/unit.dart';
import 'package:apc_project/foundation/constants.dart';
import 'package:apc_project/ui/components/bottom_nav_bar.dart';
import 'package:apc_project/ui/lecture/lecture_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScorePage extends StatefulWidget {
  var score;
  Unit unit;
  ScorePage({Key? key, required this.score, required this.unit}) : super(key: key);

  @override
  _ScorePage createState() => _ScorePage();
}

class _ScorePage extends State<ScorePage> {



  _buildBody() {
    print("dssd");
    print(widget.score);
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
                        "Глава 1 Урок " + widget.unit.id,
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24.sp),
                      ),
                    ],
                  ),

                ],
              ),
              Container(
                margin: EdgeInsets.only(top:20, bottom: 20, left: 10, right:10),
                padding: EdgeInsets.only(top:40, bottom: 20, left: 10, right:10),
                decoration: BoxDecoration(
                  color: primary,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Column(
                  children: [
                    Text("Құттықтаймыз!",
                    style: TextStyle(
                      color: white,
                      fontSize: 36 ,
                      fontWeight: FontWeight.bold
                    ),),
                    SizedBox(height: 30.h),
                     Image(image: AssetImage('assets/images/birthday.png'), width: 300.w,),
                    SizedBox(height: 40.h),
                    Row(
                      children: [
                        Expanded(child: Container()),
                        Icon(
                          Icons.star_rounded,
                          size: 35.w,
                          color: Colors.white,
                        ),
                        Text(
                          " + " + widget.score.toString(),
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30.sp),
                        ),
                        Expanded(child: Container()),
                      ],
                    ),
                    SizedBox(height: 50.h),
                    Center(
                      child:
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => LecturePage(unit: Unit.getUnit((double.parse(widget.unit.id) + 0.1 - 0.0000000000000002).toString()),)));
                                },
                                child:   Image(image: AssetImage('assets/images/gofurther.png', ), height:90.h,width:90.w),
                                style: ButtonStyle(
                                    foregroundColor: MaterialStateProperty.all<Color>(white),
                                    backgroundColor: MaterialStateProperty.all<Color>(whiteScore),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        )
                                    )
                                ),
                              ),
                              SizedBox(height: 10.h,),
                              Text("Следующий урок" ,
                                  style: TextStyle(
                                      color: white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16
                                  ))
                            ],
                          ),

                    ),
                    SizedBox(height: 10.h),
                  ],
                ),
              )
            ],

          ),
        )
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: BottomNavBar(),
      body: SingleChildScrollView(child: _buildBody(),),
    );
  }

}

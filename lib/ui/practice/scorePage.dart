import 'package:apc_project/foundation/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScorePage extends StatefulWidget {
  var score;
  ScorePage({Key? key, required this.score}) : super(key: key);

  @override
  _ScorePage createState() => _ScorePage();
}

class _ScorePage extends State<ScorePage> {

  var score = 0;


  _buildBody() {
    score = widget.score;
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
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24.sp),
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
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22.sp),
                          )
                        ],
                      ),
                    ),
                  )
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
                    const Image(image: AssetImage('assets/images/birthday.png'), ),
                    SizedBox(height: 40.h),
                    Row(
                      children: [
                        Expanded(child: Container()),
                        Icon(
                          Icons.star_rounded,
                          size: 22.w,
                          color: Colors.white,
                        ),
                        Text(
                          " + " + score.toString(),
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22.sp),
                        ),
                        Expanded(child: Container()),
                      ],
                    ),
                    SizedBox(height: 50.h),
                    Row(
                      children: [
                        Expanded(child: Container(),),
                        Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {  },
                              child: const Image(image: AssetImage('assets/images/refresh.png'),height:90,width:90),
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
                            Text("Пройти заново",
                            style: TextStyle(
                              color: white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16
                            ))
                          ],
                        ),
                        Expanded(child: Container(),),
                        Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {  },
                              child:  const Image(image: AssetImage('assets/images/gofurther.png', ), height:90,width:90),
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
                            Text("Глава 1 Часть 2",
                                style: TextStyle(
                                    color: white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16
                                ))
                          ],
                        ),
                        Expanded(child: Container(),),
                      ],
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
      body: SingleChildScrollView(child: _buildBody(),),
    );
  }

}

import 'package:apc_project/data/model/chapter.dart';
import 'package:apc_project/foundation/constants.dart';
import 'package:apc_project/ui/components/bottom_nav_bar.dart';
import 'package:apc_project/ui/lecture/lecture_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ChapterPage extends StatefulWidget {

  Chapter chapter;

  ChapterPage({Key? key, required this.chapter}) : super(key: key);

  @override
  _ChapterPageState createState() => _ChapterPageState();
}

class _ChapterPageState extends State<ChapterPage> {


  List<bool> show = [];
  var height = 207.h;

  @override
  void initState() {
    super.initState();
    for(int i=0;i<widget.chapter.units.length;i++){
      show.add(false);
    }
  }

  void showHide(int i){
    setState((){
      show[i]=!show[i];
    });
  }

  _unitItem(int index) {
    return GestureDetector(
      onTap: () {
        showHide(index);
      },
      child: Container(
        width: 367.w,
        constraints: BoxConstraints(
          minHeight: 61.h
        ),
        decoration: BoxDecoration(
          color: backgroundItem,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          children: [
            Container(
              width: 367.w,
              height: 61.h,
              decoration: BoxDecoration(
                color: primary,
                borderRadius: BorderRadius.circular(20.r)
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 34.w),
                child: Row(
                  children: [
                    Text(
                      "Урок " + widget.chapter.units[index].id,
                      style: GoogleFonts.roboto(fontSize: 22.sp, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    Spacer(flex: 10),
                    Center(
                      child: Column(
                        children: [
                          SizedBox(height: 34.h),
                          Icon(
                            show[index] ? Icons.arrow_drop_down : Icons.arrow_drop_up,
                            color: Colors.white,
                            size: 20.w,
                          )
                        ],
                      ),
                    ),
                    Spacer(flex: 15),
                    Icon(
                      Icons.check_circle_outline,
                      color: Colors.white,
                      size: 30.w,
                    )
                  ],
                ),
              ),
            ),
            if (show[index]) Padding(
              padding:  EdgeInsets.symmetric(horizontal: 23.w, vertical: 32.h),
              child: Column(
                  children: [
                    Center(
                        child: Text(
                          widget.chapter.units[index].title,
                          style: GoogleFonts.roboto(fontSize: 22.sp, color: white2),
                        )
                    ),
                    SizedBox(height: 25.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => LecturePage(unit: widget.chapter.units[index])));
                            },
                            style: ElevatedButton.styleFrom(
                              primary: primaryWithOp,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.r)
                                )
                            ),
                            child: Text(
                              "Теория",
                              style: GoogleFonts.roboto(
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: primaryWithOp,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.r)
                                )
                            ),
                            child: Text(
                              "Практика",
                              style: GoogleFonts.roboto(
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ))
                      ],
                    ),
                  ],

                ),
            ),


          ],
        ),
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
                Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios_rounded,
                      size: 20.w,
                      color: Colors.white,
                    ),
                    SizedBox(width: 15.w,),
                    Text(
                      widget.chapter.title,
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
                        Text(
                          "Шылаулар",
                          style: GoogleFonts.roboto(fontSize: 23.sp, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          "В этой главе вы научитесь\nправильно использовать\nшылаулар.",
                          style: GoogleFonts.roboto(fontSize: 18.sp, color: Colors.white),
                        ),
                      ],
                    ),
                    Image(
                      image: AssetImage("assets/images/chap_books.png"),
                      width: 100.w,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 45.h),
            ListView.separated(
              itemCount: widget.chapter.units.length,
              separatorBuilder: (BuildContext context, int index) => SizedBox(height: 25.h),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) => _unitItem(index ),
            ),
            SizedBox(height: 40.h)
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
      body: SingleChildScrollView(child: _buildBody(),),
    );
  }
}

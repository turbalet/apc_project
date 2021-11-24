import 'package:apc_project/data/storage.dart';
import 'package:apc_project/foundation/constants.dart';
import 'package:apc_project/ui/components/bottom_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class GuidPage extends StatefulWidget {
  const GuidPage({Key? key}) : super(key: key);

  @override
  _GuidPageState createState() => _GuidPageState();
}

class _GuidPageState extends State<GuidPage> {

  List<bool> show = [];

  @override
  void initState() {
    super.initState();
    for(int i=0;i<Storage.chapterList!.chapters.length;i++){
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
              width: 377.w,
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
                      "Часть " + Storage.chapterList!.chapters[index].id,
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
                  ListView.separated(
                    itemCount: Storage.chapterList!.chapters[index].units.length,
                    separatorBuilder: (BuildContext context, int index) => SizedBox(height: 25.h),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int ind) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        Storage.chapterList!.chapters[index].units[ind].id + ". " + Storage.chapterList!.chapters[index].units[ind].title,
                        style: GoogleFonts.roboto(fontSize: 22.sp, color: white2),
                      ),
                    ),
                  ),

                  SizedBox(height: 25.h),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   children: [
                  //     ElevatedButton(
                  //         onPressed: () {
                  //           Navigator.push(context, MaterialPageRoute(builder: (context) => LecturePage(unit: widget.chapter.units[index])));
                  //         },
                  //         style: ElevatedButton.styleFrom(
                  //             primary: primaryWithOp,
                  //             shape: RoundedRectangleBorder(
                  //                 borderRadius: BorderRadius.circular(20.r)
                  //             )
                  //         ),
                  //         child: Text(
                  //           "Теория",
                  //           style: GoogleFonts.roboto(
                  //               fontSize: 22.sp,
                  //               fontWeight: FontWeight.bold,
                  //               color: Colors.white),
                  //         )),
                  //     ElevatedButton(
                  //         onPressed: () {},
                  //         style: ElevatedButton.styleFrom(
                  //             primary: primaryWithOp,
                  //             shape: RoundedRectangleBorder(
                  //                 borderRadius: BorderRadius.circular(20.r)
                  //             )
                  //         ),
                  //         child: Text(
                  //           "Практика",
                  //           style: GoogleFonts.roboto(
                  //               fontSize: 22.sp,
                  //               fontWeight: FontWeight.bold,
                  //               color: Colors.white),
                  //         ))
                  //   ],
                  // ),
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
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40.h),
            Text(
              "Содержимое",
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
                          "Приложение основано\n по книге Blabla",
                          style: GoogleFonts.roboto(fontSize: 18.sp, color: Colors.white),
                        ),
                      ],
                    ),
                    Image(
                      image: AssetImage("assets/images/ddd.png"),
                      width: 100.w,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 45.h),
            ListView.separated(
              itemCount: Storage.chapterList!.chapters.length,
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
        body: SingleChildScrollView(child: _buildBody(),)
    );;
  }
}

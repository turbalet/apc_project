import 'package:apc_project/data/model/chapter.dart';
import 'package:apc_project/foundation/constants.dart';
import 'package:apc_project/ui/chapter/chapter_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ChapterItem extends StatelessWidget {

  Chapter chapter;

  ChapterItem({Key? key, required this.chapter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ChapterPage(chapter: chapter)));
      },
      child: Container(
        width: 99.w,
        height: 135.h,
        decoration: BoxDecoration(
          color: backgroundItem,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
          child: Column(
            children: [
              Image(image: AssetImage(chapter.img), width: 60.w, height: 60.h,),
              SizedBox(height: 11.h),
              Text(
                chapter.title,
                style: GoogleFonts.roboto(fontWeight: FontWeight.w500, fontSize: 16, color: CupertinoColors.white),
              )
            ],
          ),
        )
      ),
    );
  }
}

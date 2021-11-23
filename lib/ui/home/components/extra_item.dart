import 'package:apc_project/foundation/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ExtraItem extends StatelessWidget {


  ExtraItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 199.w,
        height: 80.h,
        decoration: BoxDecoration(
          color: backgroundItem,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 11.h, horizontal: 22.w),
          child: Row(
            children: [
              Image(image: AssetImage("assets/images/umbrella.png"), width: 50.w, height: 55.h,),
              SizedBox(width: 15.w),
              Text(
                "қолшатыр\n[qol:shaty’r]",
                style: GoogleFonts.roboto(fontWeight: FontWeight.w600, fontSize: 16.sp, color: CupertinoColors.white),
              )
            ],
          ),
        )
    );
  }
}

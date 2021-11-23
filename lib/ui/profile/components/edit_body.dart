import 'package:apc_project/foundation/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class EditBody extends StatelessWidget {
  const EditBody({Key? key}) : super(key: key);

  _buildChangePassword() {
    return Container(
      height: 300.h,
      width: 367.w,
      decoration: BoxDecoration(
        color: backgroundItem,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        children: [
          Container(
            height: 61.h,
            width: 367.w,
            decoration: BoxDecoration(
                color: darkGrey, borderRadius: BorderRadius.circular(20.r)),
            child: Center(
              child: Text(
                "Изменить пароль",
                style: GoogleFonts.roboto(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Container(
            width: 290.w,
            child: TextField(
              cursorColor: Colors.white,
              decoration: InputDecoration(
                hintStyle: GoogleFonts.roboto(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: white2),
                hintText: "Новый пароль",
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: white2),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: white2),
                ),
              ),
            ),
          ),
          Container(
            width: 290.w,
            child: TextField(
              decoration: InputDecoration(
                hintStyle: GoogleFonts.roboto(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: white2),
                hintText: "Подтвердить новый пароль",
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: white2),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: white2),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 35.h,
          ),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: darkGrey,
              ),
              child: Text(
                "Изменить",
                style: GoogleFonts.roboto(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [_buildChangePassword()],
    );
  }
}

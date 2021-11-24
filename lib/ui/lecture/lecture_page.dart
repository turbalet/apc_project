import 'package:apc_project/data/model/unit.dart';
import 'package:apc_project/foundation/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

// class MyReflectable extends Reflectable {
//   const MyReflectable() : super(invokingCapability);
// }
//
// const myReflectable = MyReflectable();
//
// @myReflectable
class LecturePage extends StatefulWidget {

  Unit unit;

  LecturePage({Key? key, required this.unit}) : super(key: key);

  @override
  _LecturePageState createState() => _LecturePageState();
}

class _LecturePageState extends State<LecturePage> {

  var progress = <String, dynamic>{ "score": "", "unit" : "", "chapter": ""};


  buildLec() {

    final firestoreInstance = FirebaseFirestore.instance;
    var user = FirebaseAuth.instance.currentUser;
    firestoreInstance.collection("progresses").doc(user!.uid).get().then((value){
      setState(() {
        progress = value.data()!;
      });
    });

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
                      "Урок " + widget.unit.id,
                      style: GoogleFonts.nunito(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24.sp),
                    ),
                  ],
                ),
                Container(
                  height: 45.h,
                  decoration: BoxDecoration(
                      color: backgroundItem,
                      borderRadius: BorderRadius.circular(30.r)
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 26.w),
                    child:
                    Row(
                      children: [
                        Icon(
                          Icons.star_rounded,
                          size: 22.w,
                          color: Colors.white,
                        ),
                        SizedBox(width: 10.w,),
                        Text(
                          progress['score'].toString(),
                          style: GoogleFonts.roboto(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22.sp),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 60.h,),
            SizedBox(
              width: 374.w,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 288.w,
                      constraints: BoxConstraints(
                        minHeight: 56.h
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(color: primary, width: 3.w),
                          borderRadius: BorderRadius.circular(20.r),
                          color: backgroundItem
                      ),
                      child: Center(
                        child: Text(
                          "-МЫН/МІН/-СЫҢ/-СІҢ/-СЫЗ/-СІЗ",
                          style: GoogleFonts.nunito(fontWeight: FontWeight.bold,fontSize: 15.sp, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 28.h),
                  Center(
                    child: Image(
                        image: AssetImage("assets/images/un1.png"),
                        width: 169.w,
                      height: 169.w,
                    ),
                  ),
                  SizedBox(height: 28.h),
                  Text(
                    "- Менын атым – Асел\n- Мен – студентпын\n- Мен –  жиырма екыдемын\n- Менын суйыкты тусым  – кок.\n- Мен Алматыданмын.",
                    style: GoogleFonts.nunito(fontSize: 20.sp, color: Colors.white),
                  ),
                  SizedBox(height: 28.h),
                  Text(
                      "Болымды",
                    style: GoogleFonts.nunito(fontSize: 24.sp, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 28.h),
                  Table(
                    defaultColumnWidth: IntrinsicColumnWidth(),
                    columnWidths: const {
                      0: FlexColumnWidth(2),
                      1: FlexColumnWidth(8)
                    },
                    border: TableBorder.all(color: darkGrey, borderRadius: BorderRadius.circular(20.r)),
                    children: [
                      TableRow(
                        children: [
                          Center(
                            child: Text(
                              "Мен",
                              style: GoogleFonts.nunito(fontSize: 20.sp, color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "-мын/-мін (дауыстылар, ундылерден кейын)\n-бын/-бін (уяндардан кейын)\n-пын/-пін (катандардан кейын)",
                              style: GoogleFonts.nunito(fontSize: 20.sp, color: Colors.white),
                            ),
                          )
                        ]
                      ),
                      TableRow(
                          children: [
                            Center(
                              child: Text(
                                "Мен",
                                style: GoogleFonts.nunito(fontSize: 20.sp, color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "-мын/-мін (дауыстылар, ундылерден кейын)\n-бын/-бін (уяндардан кейын)\n-пын/-пін (катандардан кейын)",
                                style: GoogleFonts.nunito(fontSize: 20.sp, color: Colors.white),
                              ),
                            )
                          ]
                      ),
                      TableRow(
                          children: [
                            Center(
                              child: Text(
                                "Мен",
                                style: GoogleFonts.nunito(fontSize: 20.sp, color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "-мын/-мін (дауыстылар, ундылерден кейын)\n-бын/-бін (уяндардан кейын)\n-пын/-пін (катандардан кейын)",
                                style: GoogleFonts.nunito(fontSize: 20.sp, color: Colors.white),
                              ),
                            )
                          ]
                      )
                    ],
                  ),
                  SizedBox(height: 28.h,),
                  Text(
                    "Болымсыз",
                    style: GoogleFonts.nunito(fontSize: 24.sp, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 28.h),
                  Table(
                    defaultColumnWidth: IntrinsicColumnWidth(),
                    columnWidths: const {
                      0: FlexColumnWidth(2),
                      1: FlexColumnWidth(8)
                    },
                    border: TableBorder.all(color: darkGrey, borderRadius: BorderRadius.circular(20.r)),
                    children: [
                      TableRow(
                          children: [
                            Center(
                              child: Text(
                                "Мен",
                                style: GoogleFonts.nunito(fontSize: 20.sp, color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text("+ емес",
                                    style: GoogleFonts.nunito(fontSize: 20.sp, color: Colors.white, fontWeight: FontWeight.bold),
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "-мын/-мін\n-бын/-бін\n-пын/-пін",
                                        style: GoogleFonts.nunito(fontSize: 20.sp, color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ]
                      ),
                      TableRow(
                          children: [
                            Center(
                              child: Text(
                                "Мен",
                                style: GoogleFonts.nunito(fontSize: 20.sp, color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text("+ емес",
                                    style: GoogleFonts.nunito(fontSize: 20.sp, color: Colors.white, fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "-сың/-сің",
                                    style: GoogleFonts.nunito(fontSize: 20.sp, color: Colors.white),
                                  ),
                                ],
                              ),
                            )
                          ]
                      ),
                      TableRow(
                          children: [
                            Center(
                              child: Text(
                                "Мен",
                                style: GoogleFonts.nunito(fontSize: 20.sp, color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text("+ емес",
                                    style: GoogleFonts.nunito(fontSize: 20.sp, color: Colors.white, fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "-сың/-сің",
                                    style: GoogleFonts.nunito(fontSize: 20.sp, color: Colors.white),
                                  ),
                                ],
                              ),
                            )
                          ]
                      )
                    ],
                  ),
                  SizedBox(height: 28.h),
                  Text(
                    "Мысалдар:",
                    style: GoogleFonts.nunito(fontSize: 24.sp, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15.h,),
                  Text(
                    "• Мен дарыгермын. Мен адамдарды емдеймын.\n• Мен кызбын. Сен жыгытсын\n• Мен Салнататпын. Сыз Айдарсыз.\n• Мен он бестемын. Сен жиырма тогыздасын.\n• Сен улкенсін. Ол кышкентай.\n• Сыз муғалымсыз. Ол окушы.",
                    style: GoogleFonts.nunito(fontSize: 20.sp, color: Colors.white),
                  ),
                  SizedBox(height: 35.h,),
                  Center(
                    child: Container(
                      width: 240.w,
                      height: 52.h,
                      decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(20.r)
                      ),
                      child: Center(
                        child: Text(
                          "Перейти к практике",
                          style: GoogleFonts.roboto(fontSize: 24.sp, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  //
  // Widget get(instanceMirror) {
  //   return instanceMirror.invoke(widget.unit.lecturePath, []);
  // }

  @override
  Widget build(BuildContext context) {
    //
    // var instance = widget;
    // var instanceMirror = myReflectable.reflect(instance);

    return Scaffold(
      backgroundColor: backgroundColor,
        body: SingleChildScrollView(child:  buildLec(),) // child: unit.getContname()
    );
  }
}

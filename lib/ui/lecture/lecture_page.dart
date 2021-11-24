import 'package:apc_project/data/model/unit.dart';
import 'package:apc_project/foundation/constants.dart';
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

  buildLec(String unit){
    switch(unit){
      case "1.1":
        buildLec1();
        break;
      case "1.2":
        buildLec2();
        break;
    }
  }


  buildLec1() {
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
  buildLec2() {
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
                          "-МЫН/МІН/-СЫҢ/-СІҢ/-СЫЗ/-СІЗ (СҰРАҚ) ",
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
                    "Болымды",
                    style: TextStyle(fontSize: 24.sp, color: Colors.white, fontWeight: FontWeight.bold),
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
                                style: TextStyle(fontSize: 20.sp, color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "-мын/-мін\n-бын/-бін \n-пын/-пін ",
                                style: TextStyle(fontSize: 20.sp, color: Colors.white),
                              ),
                            )
                          ]
                      ),
                      TableRow(
                          children: [
                            Center(
                              child: Text(
                                "Cен",
                                style: TextStyle(fontSize: 20.sp, color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "-сың/-сің",
                                style: TextStyle(fontSize: 20.sp, color: Colors.white),
                              ),
                            )
                          ]
                      ),
                      TableRow(
                          children: [
                            Center(
                              child: Text(
                                "Сіз",
                                style: TextStyle(fontSize: 20.sp, color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "-сыз/-сіз",
                                style: TextStyle(fontSize: 20.sp, color: Colors.white),
                              ),
                            )
                          ]
                      ),
                      TableRow(
                          children: [
                            Center(
                              child: Text(
                                "Ол",
                                style: TextStyle(fontSize: 20.sp, color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "-/-",
                                style: TextStyle(fontSize: 20.sp, color: Colors.white),
                              ),
                            )
                          ]
                      )
                    ],
                  ),
                  SizedBox(height: 28.h,),
                  Text(
                    "Сұраулы",
                    style: TextStyle(fontSize: 24.sp, color: Colors.white, fontWeight: FontWeight.bold),
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
                                style: TextStyle(fontSize: 20.sp, color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "-мын/-мін\n-бын/-бін \n-пын/-пін ",
                                style: TextStyle(fontSize: 20.sp, color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "ба/бе? ",
                                style: TextStyle(fontSize: 20.sp, color: Colors.white),
                              ),
                            )
                          ]
                      ),
                      TableRow(
                          children: [
                            Center(
                              child: Text(
                                "Cен",
                                style: TextStyle(fontSize: 20.sp, color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "-сың/-сің",
                                style: TextStyle(fontSize: 20.sp, color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "ба/бе? ",
                                style: TextStyle(fontSize: 20.sp, color: Colors.white),
                              ),
                            )
                          ]
                      ),
                      TableRow(
                          children: [
                            Center(
                              child: Text(
                                "Сіз",
                                style: TextStyle(fontSize: 20.sp, color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "-сыз/-сіз",
                                style: TextStyle(fontSize: 20.sp, color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "ба/бе? ",
                                style: TextStyle(fontSize: 20.sp, color: Colors.white),
                              ),
                            )
                          ]
                      ),
                      TableRow(
                          children: [
                            Center(
                              child: Text(
                                "Ол",
                                style: TextStyle(fontSize: 20.sp, color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "-/-",
                                style: TextStyle(fontSize: 20.sp, color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "ма/ме?\nба/бе?\nпа/пе? ",
                                style: TextStyle(fontSize: 20.sp, color: Colors.white),
                              ),
                            )
                          ]
                      )
                    ],
                  ),
                  SizedBox(height: 28.h),
                  Text(
                    "Мысалдар:",
                    style: TextStyle(fontSize: 24.sp, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15.h,),
                  Text(
                    "• Мен осы жерге отырамын ба? Иә, сен осы жерге отырасың.\n• Сен мектепте мұғалімсің бе? Жоқ, мен мектепте тәрбиешімін.\n• Сіз жиырма бестесіз бе? Жоқ, мен жиырма алтыдамын.\n• Ол қазір үйде ме? Жоқ, ол қазір үйде емес.",
                    style: TextStyle(fontSize: 20.sp, color: Colors.white),
                  ),
                  SizedBox(height: 15.h),
                  Text(
                    "......қайда? / .....не? / ......кім? / .....қанша....? / ....қалай? / Неге....?",
                    style: TextStyle(fontSize: 24.sp, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15.h,),
                  Text(
                    "• Сенің анаң қайда? Ол үйде ме?\n• Сен қайдасың? Мен жұмыстамын.\n• Бұл не? Бұл – жаңа телефон.\n• Сіздің атыңыз кім? Менің атым – Әлия.\n• Сен қанша жастасың? Мен 30 жастамын.\n• Мына көйлек әдемі екен. Қанша тұрады?\n• Сіздің ата-анаңыз қалай? Жағдайлары жақсы ма?\n• Бұл қонақ үй ондай керемет емес. Неге сонша қымбат тұрады?",
                    style: TextStyle(fontSize: 20.sp, color: Colors.white),
                  ),
                  SizedBox(height: 15.h),
                  Text(
                    "Қазақ тілінде сұраулы сөйлем екі жолмен жасалады:",
                    style: TextStyle(fontSize: 24.sp, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15.h,),
                  Text(
                    "1. ма/ме/ба/бе/па/пе дейтін шылаулары арқылы;\n2. қайда? не? кім? қанша? қалай? неге? дейтін сұрау есімдіктері арқылы.",
                    style: TextStyle(fontSize: 20.sp, color: Colors.white),
                  ),SizedBox(height: 15.h),
                  Text(
                    "Бір сұраулы сөйлемде екі жағдай қатар келмейді." ,
                    style: TextStyle(fontSize: 24.sp, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15.h,),
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
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Сен қайдасың ба? – дұрыс емес",
                      style: TextStyle(fontSize: 20.sp, color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Сен қайдасың? – дұрыс",
                      style: TextStyle(fontSize: 20.sp, color: Colors.white),
                    ),
                  )
                ]
            ),
            TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Сен үйдесің бе қайда? – дұрыс емес ",
                      style: TextStyle(fontSize: 20.sp, color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Сен үйдесің бе? – дұрыс",
                      style: TextStyle(fontSize: 20.sp, color: Colors.white),
                    ),
                  )
                ]
            ),
          ]),
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

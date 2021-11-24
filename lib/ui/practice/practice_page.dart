import 'dart:io';

import 'package:apc_project/data/model/exercise.dart';
import 'package:apc_project/data/model/unit.dart';
import 'package:apc_project/foundation/constants.dart';
import 'package:apc_project/ui/practice/score_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';


class PracticePage extends StatefulWidget {

  Unit unit;
  PracticePage({Key? key, required this.unit}) : super(key: key);

  @override
  _PracticePageState createState() => _PracticePageState();
}

class _PracticePageState extends State<PracticePage> {



  int counter = 0;
  var score = 0;
  var streak = 0;
  String received = "";
  bool accepting = false;

  int maxNumber = 0;

  _positiveSnack(BuildContext context) async {
    final snackbar = SnackBar(
      content:
      Row(
        children: [
          Text("Жауап дурыс, Жарайсыз!", style: TextStyle(fontSize: 20),),
          SizedBox(width: 100,),
          ((streak >= 5) ? Text("x" + streak.toString(), style: TextStyle(color: Colors.yellow, fontSize: 20, fontWeight: FontWeight.bold),) : SizedBox())
        ],
      ),
      duration: Duration(milliseconds: 1000),
      backgroundColor: primary,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);

    await Future.delayed(Duration(seconds: 1));
    setState(() {
      if (counter + 1 <= widget.unit.exercises.length) {
        if (counter + 1 == widget.unit.exercises.length) {
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => ScorePage(unit: widget.unit, score: score)));
        }
        if (counter + 1 != widget.unit.exercises.length) {
          counter++;
        }

        streak++;
        score += 40 + ((streak >=5 ) ? 3*streak : 0);
      }
    });
  }

  _negativeSnack(BuildContext context) {
    final snackbar = SnackBar(
      content: Text("Жауап кате!", style: TextStyle(fontSize: 20),),
      duration: Duration(milliseconds: 500),
      backgroundColor: red,
    );
    setState(() {
      streak = 0;
      score -= 10;
    });
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  check(String choice, BuildContext context) {
    if (choice == widget.unit.exercises[counter].correctAnswer) {
      _positiveSnack(context);
    } else {
      _negativeSnack(context);
    }
  }

  _checkDrop(String input, BuildContext context) {
    if(widget.unit.exercises[counter].correctAnswer == input) {

      setState(() {
        accepting = true;
        received = input;
        widget.unit.exercises[counter].accepting = true;
        widget.unit.exercises[counter].received = input;
      });

      _positiveSnack(context);
    }else{
      setState(() {
        accepting = false;
        received = input;
        widget.unit.exercises[counter].accepting = false;
        widget.unit.exercises[counter].received = input;
      });

      _negativeSnack(context);
    }
  }

  _buildBody(BuildContext context) {
    _initVariables();
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
                        "Урок " + widget.unit.id,
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
              Container(
                child: _buildProgress(context)
              )
            ],
          ),
        )
    );
  }

  _buildProgress( BuildContext context){
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Задание " + (counter+1).toString() + "/" + maxNumber.toString(),
            style: GoogleFonts.roboto(fontSize: 25.sp, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        SizedBox(height: 25.h),
        Row(
          children: [
            LinearPercentIndicator(
              width: 320.w,
              animation: false,
              lineHeight: 5.0.h,
              percent: (counter+1)/maxNumber,
              linearStrokeCap: LinearStrokeCap.roundAll,
              progressColor: primary,
              backgroundColor: white,
            ),
            Text( percentage((counter+1), maxNumber) + " %",
              style: TextStyle(
                  color: white,
                  fontSize: 13
              ),)
          ],
        ),
        SizedBox(height: 50.h),
        _buildQuestions(widget.unit.exercises[counter].type, context),
        Container(
          child:
            Row(
              children: [
                // Expanded(child: Container(),),
                // _next(),
                Expanded(child: Container(),),
              ],
            )
        )
      ],
    );
  }


  // _next(){
  //   return ElevatedButton(
  //       child: Text("Следующее",
  //         style: TextStyle(
  //             color: white,
  //             fontSize: 18,
  //             fontWeight: FontWeight.bold
  //         ),),
  //       style: ButtonStyle(
  //           foregroundColor: MaterialStateProperty.all<Color>(white),
  //           backgroundColor: MaterialStateProperty.all<Color>(primaryWithOp),
  //           shape: MaterialStateProperty.all<RoundedRectangleBorder>(
  //               RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(10),
  //               )
  //           )
  //       ),
  //       onPressed: () {
  //         if((counter+1)==maxNumber){
  //           Navigator.of(context).pushReplacement(
  //               MaterialPageRoute(builder: (context) => ScorePage(score: score)));
  //         }
  //         var counterOP = counter + 1;
  //         counterOP += 1;
  //           print(counterOP);
  //           setState(() {});
  //           }
  //   );
  // }

  _buildDragAndDrop( BuildContext context){
    return Container(
      padding: const EdgeInsets.only(left:15, right: 15),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(widget.unit.exercises[counter].question,
                style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    color: white
                )),
          ),
          Container(
            padding: const EdgeInsets.only(top:20),
            child:
              Align(
                alignment: Alignment.centerLeft,
                child:
                DragTarget<String>(
                  builder: (context, acceptedItems, rejectedItems) => Container(

                    child: Center(
                      child:Text(received,
                          style: TextStyle(
                              fontSize: 27,
                              fontWeight: FontWeight.bold,
                              color: white
                          )),
                    ),
                    width: 100,
                    height: 10,
                    decoration: BoxDecoration(

                      border: Border(
                        bottom: BorderSide(color: white,width: 3.h),

                      ),
                    ),
                  ),
                  onAccept: (receivedItem) {
                    _checkDrop(receivedItem, context);
                  },
                  onLeave: (receivedItem) {

                  },
                ),
              )
          ),
          Container(
              padding: const EdgeInsets.only(top:50),
              child:
              Align(
                  alignment: Alignment.centerLeft,
                  child:
                    Text("Сойлемди аякта",
                    style: TextStyle(
                      color: white,
                      fontSize: 17
                    )))),
          Container(
            padding: const EdgeInsets.only(top:35, bottom: 100),
            child: Align(
              alignment: Alignment.centerLeft,
              child: ListView.separated
                (

                  shrinkWrap: true,
                  itemCount: widget.unit.exercises[counter].answers.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return Draggable<String>(
                          // Data is the value this Draggable stores.
                          data: widget.unit.exercises[counter].answers[index],
                          child: Container(
                            width: 100.w,
                            padding: EdgeInsets.all(15.w),
                            decoration: BoxDecoration(
                              color: primary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(widget.unit.exercises[counter].answers[index],
                                style: TextStyle(color: white, fontSize: 18)),
                          ),
                          childWhenDragging: Container(),

                          feedback: Container(
                            padding: EdgeInsets.all(15.w),
                            decoration: BoxDecoration(
                              color: primary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(widget.unit.exercises[counter].answers[index],
                                  style: TextStyle(color: white, fontSize: 18, fontWeight: FontWeight.bold)),
                            ),
                          ),
                    );
                  }, separatorBuilder: (BuildContext context, int index) { return SizedBox(width: 20.w, height: 20.h); },
              )


            ),
          )
        ]
      )
    );
  }

  _buildTrueFalse(BuildContext context){
    return Container(
        padding: const EdgeInsets.only(left:15, right: 15),
        child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(widget.unit.exercises[counter].question,
                    style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                        color: white
                    )),
              ),
              Container(
                  padding: const EdgeInsets.only(top:70, bottom:50),
                  child:
                  Align(
                      alignment: Alignment.centerLeft,
                      child:
                      Text("Берилген сойлем акикат па?",
                          style: TextStyle(
                              color: white,
                              fontSize: 18
                          )))),
              Container(
                padding: const EdgeInsets.only(bottom: 80),
                child:Row(
                  children: [
                    Expanded(child: Container(),),
                    ElevatedButton(
                      onPressed: () { check("Дурыс", context); },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: const Image(image: AssetImage('assets/images/yes.png')),
                      ),
                      style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(white),
                          backgroundColor: MaterialStateProperty.all<Color>(backgroundItem),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )
                          )
                      ),
                    ),
                    Expanded(child: Container(),),
                    ElevatedButton(
                      onPressed: () { check("Дурыс емес", context); },
                      child:  Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: const Image(image: AssetImage('assets/images/no.png')),
                      ),
                      style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(white),
                          backgroundColor: MaterialStateProperty.all<Color>(backgroundItem),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )
                          )
                      ),
                    ),
                    Expanded(child: Container(),),
                  ],

                )
              ),
            ]
        )
    );
  }

  _buildMultipleChoice( BuildContext context){
    return Container(
        padding: const EdgeInsets.only(left:15, right: 15),
        child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(widget.unit.exercises[counter].question,
                    style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                        color: white
                    )),
              ),
              Container(
                  padding: const EdgeInsets.only(top:70, bottom:50),
                  child:
                  Align(
                      alignment: Alignment.centerLeft,
                      child:
                      Text("Берилген суракка дурыс жауапты аныкта",
                          style: TextStyle(
                              color: white,
                              fontSize: 15
                          )))),
              Container(

                child: Column(
                  children: [
                    _getAnswers(context),
                    SizedBox(height: 15.h,),
                  ],
                ),
              )
            ]
        )
    );
  }

  Widget _getAnswers( BuildContext context) {
    List<Widget> list = <Widget>[];
    for (var i = 0; i < widget.unit.exercises[counter].answers.length; i++) {
      list.add(
        Column(
          children:
            [
              GestureDetector(
                child: Container(
                    padding: const EdgeInsets.only(left:20, right: 20),
                    height: 54.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: backgroundItem,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child:Center(
                      child:Text(widget.unit.exercises[counter].answers[i],
                        style: TextStyle(
                            color: white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ),),
                    )
                ),
                onTap: (){
                  check(widget.unit.exercises[counter].answers[i], context);
                },
              ),
              SizedBox(height: 15.h,),
            ]
        )
      );
    }
    return new Column(
        children: list
    );
  }

  _buildQuestions(String type, BuildContext context) {
    switch (type) {
      case "dd":
        return _buildDragAndDrop(context);
      case "tf":
        return _buildTrueFalse(context);
      case "4":
        return _buildMultipleChoice(context);
    }
  }


    String percentage(int c, int m) {
      double p = (c / m) * 100;
      String result = p.toString();
      List<String> res = result.split(".");
      return res[0];
    }

    _initVariables() {
      maxNumber = widget.unit.exercises.length;
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
          backgroundColor: backgroundColor,
          body: SingleChildScrollView(child: _buildBody(context),)
      );
    }
  }



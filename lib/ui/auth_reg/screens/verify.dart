import 'dart:async';

import 'package:apc_project/foundation/constants.dart';
import 'package:apc_project/ui/home/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'auth_reg.dart';

class VerifyScreen extends StatefulWidget {
  @override
  _VerifyScreenState createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  late User user;

  late Timer timer;

  @override
  void initState() {
    try{
      user = FirebaseAuth.instance.currentUser!;
      user.sendEmailVerification();
    }catch(e){
      print(e);
    }

    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      checkEmailVerified();
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 60),
          child: Column(
            children: [
              Image.network('https://media2.giphy.com/media/kyifoDmWSC3dhCldE5/giphy.gif?cid=790b7611c42536d037891f976167f98ee5c0c7f843544fec&rid=giphy.gif&ct=s'),
              Container(
                padding: const EdgeInsets.only(top: 30),
                child:Text(
                  "На почту " + getEmail() + " отправлено письмо для подтверждения",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: white
                  ),),
              ),
              Container(
                padding: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Column(
                  children: [
                    Text("Если в течении 1 минуты вы не получите письмо, пожалуйста повторите попытку",
                    style: TextStyle(
                      color: white,

                    ),),
                    ElevatedButton(
                      child: Text(
                        "Регистрация",
                        style: TextStyle(
                        color: white,
                        fontSize: 18
                        ) ,
                      ),
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(white),
                        backgroundColor: MaterialStateProperty.all<Color>(primary),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )
                        )
                        ),
                        onPressed: () {
                        user.delete();
                        Navigator.push(context,
                          new MaterialPageRoute(builder: (context) => new AuthorizationRegistration(auth: false)),);

                        }
                      ),
                  ],
                ),
              )
            ],
          )
      )
    );
  }

  String getEmail(){
    try{
      user = FirebaseAuth.instance.currentUser!;
      if(user.email == null){
        return 'no';
      }
      else{
        String l = user.email!;
        return l;
      }
    }catch(e){
      print(e);
    }
    return "no";
  }



  Future<void> checkEmailVerified() async {
    try{
      user = FirebaseAuth.instance.currentUser!;
      await user.reload();
    }catch(e){
      print(e);
    }
    if (user.emailVerified) {
      timer.cancel();
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomePage()));
    }
  }
}
import 'package:apc_project/foundation/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class ResetScreen extends StatefulWidget {
  @override
  _ResetScreenState createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  late String _email;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network('https://media3.giphy.com/media/kDjypgTGS3WLyrE6FL/giphy.gif?cid=ecf05e47o4e89vhemyay5aey4lcx70mjljv29rdzmscvn94y&rid=giphy.gif&ct=s'),
            Container(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child:Text(
              "Сбросить пароль",
              style: TextStyle(
                  color: white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold
              ),),
          ),
            Container(
              padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
              child:Text(
              "После отправки запроса на сброс пароля проверьте почту.",
              style: TextStyle(
              color: white,
              fontSize: 18
              ),),),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 20),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintStyle: const TextStyle(
                      fontSize: 18,
                      color: grey
                  ),
                  hintText: "Почта",
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: primary,
                          width: 2
                      ),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  enabledBorder:  OutlineInputBorder(
                      borderSide: BorderSide(
                          color: whiteInputBorder,
                          width: 2
                      ),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  fillColor: backgroundItem,
                  filled: true,
                ),
                onChanged: (value) {
                  setState(() {
                    _email = value.trim();
                  });
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 50,
                  child: ElevatedButton(
                    child: Text(
                      "Отправить запрос",
                      style: TextStyle(
                          color: white,
                          fontSize: 18
                      ),
                    ),
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: MaterialStateProperty.all<Color>(primary),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )
                        )
                    ),
                    onPressed: () {
                      auth.sendPasswordResetEmail(email: _email);
                      Navigator.of(context).pop();
                    },
                  ),
                )

              ],
            ),

          ],),
      ),
    );
  }
}
import 'package:apc_project/foundation/constants.dart';
import 'package:apc_project/ui/auth_reg/screens/reset.dart';
import 'package:apc_project/ui/auth_reg/screens/verify.dart';
import 'package:apc_project/ui/auth_reg/services/auth_service.dart';
import 'package:apc_project/ui/auth_reg/services/models/user.dart';
import 'package:apc_project/ui/home/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthorizationRegistration extends StatelessWidget {
  bool auth = true;
  AuthorizationRegistration({Key? key, required this.auth}) : super(key: key);

  AuthService _authService = AuthService();

  late BuildContext context1;


  String email = '';
  String password = '';
  String newEmail = '';
  String newName = '';
  String newLastName = '';
  String newPassword = '';
  String confirmPassword = '';
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _newEmailController = TextEditingController();
  TextEditingController _newNameController = TextEditingController();
  TextEditingController _newLastNameController = TextEditingController();
  TextEditingController _newPassworddController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    context1 = context;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
            children: [
              Container(
                height: auth ? MediaQuery
                    .of(context)
                    .size
                    .height * 0.03 : 0,
              ),
              Stack(
                children:
                <Widget>[
                  Align(
                    alignment: Alignment.topCenter,
                    child: Wrap(
                      children: <Widget>[
                        Container(
                          width: auth ? MediaQuery
                              .of(context)
                              .size
                              .width * 0.8 : MediaQuery
                              .of(context)
                              .size
                              .width * 0.4,
                          child: Image(
                              image: auth ? AssetImage('assets/images/log.png') : AssetImage('assets/images/reg.png')),
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        height: auth ? MediaQuery
                            .of(context)
                            .size
                            .height * 0.32 : MediaQuery
                            .of(context)
                            .size
                            .height * 0.16 ,
                      ),

                      Container(
                          height: auth ? MediaQuery
                              .of(context)
                              .size
                              .height * 0.65 : MediaQuery.of(context).size.height * 0.86,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          decoration: BoxDecoration(
                              color: backgroundItem,
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular((20.0)))
                          ),
                          child: auth ? _build_auth_input() : _build_reg_input()
                      )
                    ],

                  ),
                ],
              ),
            ]
        ),
      )
    );
  }
  _build_auth_input() {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 35,),
          Text("Авторизоваться",style: TextStyle(
              color: white,
              fontSize: 32,
              fontWeight: FontWeight.bold
          ),),
          SizedBox(height: 20,),
          Text("Авторизация с помощью",style: TextStyle(
              color: white,
              fontSize: 14,)),
          SizedBox(height: 10,),
          // GestureDetector(
          //   child: Container(
          //     height: 52,
          //     width: 83,
          //     decoration: BoxDecoration(
          //       color: backgroundItem,
          //       borderRadius: const BorderRadius.all(Radius.circular(15)),
          //     ),
          //     child: const Image(image: AssetImage('assets/images/google.png')),
          //   ),
          //   onTap: (){
          //     _authService.googleSignIn(context1);
          //   },
          // ),
          SizedBox(height: 10,),
          Container(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 20, top: 10),
                    child: _inputAuth("Почта", _emailController, false,0),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: _inputAuth("Пароль", _passwordController, true,1),
                  ),
                  SizedBox(height: 5,),
                  Align(
                      child: GestureDetector(
                        child: Text(
                            "Забыли пароль?",style: TextStyle(
                            color: primary,
                            fontSize: 12,
                            fontWeight: FontWeight.bold
                        ),),
                        onTap: () {
                          Navigator.push(context1,
                             new MaterialPageRoute(builder: (context) => new ResetScreen()),);
                        },
                      )
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: Container(
                        height: 60,
                        width: double.infinity,
                        child: _buttonAuth()
                    ),
                  ),
                  SizedBox(height: 25,),
                  Align(
                    child: Text(
                      "У вас нет учетной записи?",
                      style: TextStyle(
                          color: white,
                          fontSize: 12
                      ),
                    ),
                  ),
                  Align(
                      child: GestureDetector(
                        child: Text(
                          "Зарегистрироваться",
                          style: TextStyle(
                              color: primary,
                              fontSize: 12,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        onTap: () {
                          auth = false;
                          Navigator.push(context1,
                            new MaterialPageRoute(builder: (context) => new AuthorizationRegistration(auth: auth)),);
                        }
                      )
                  ),
                ],
              ))
        ],
      ),
    );
  }

  Widget _build_reg_input() {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 35,),
          Text("Регистрация",style: TextStyle(
              color: white,
              fontSize: 32,
              fontWeight: FontWeight.bold
          ),),
          SizedBox(height: 20,),
          Text("Регистрация с помощью",style: TextStyle(
            color: white,
            fontSize: 14,)),
          SizedBox(height: 10,),
          // GestureDetector(
          //   child: Container(
          //     height: 52,
          //     width: 83,
          //     decoration: BoxDecoration(
          //       color: backgroundItem,
          //       borderRadius: const BorderRadius.all(Radius.circular(15)),
          //     ),
          //     child: const Image(image: AssetImage('assets/images/google.png')),
          //   ),
          //   onTap: (){
          //     _authService.googleSignIn(context1);
          //   },
          // ),
          SizedBox(height: 10,),
          Container(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 10, top: 10),
                    child: _inputAuth("Почта", _newEmailController, false,2),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: _inputAuth("Имя", _newNameController, false,3),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: _inputAuth("Фамилия", _newLastNameController, false,4),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: _inputAuth("Пароль", _newPassworddController, true,5),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: _inputAuth("Подтвердить пароль", _confirmPasswordController, true,6),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: Container(
                        height: 60,
                        width: double.infinity,
                        child: _buttonReg()
                    ),
                  ),
                  SizedBox(height: 15,),
                  Align(
                    child: Text(
                      "У вас уже есть учетной запись?",
                      style: TextStyle(
                          color: white,
                          fontSize: 12
                      ),
                    ),
                  ),
                  Align(
                      child: GestureDetector(
                          child: Text(
                            "Авторизоваться",
                            style: TextStyle(
                                color: primary,
                                fontSize: 12,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          onTap: () {
                            auth = true;
                            Navigator.push(context1,
                              new MaterialPageRoute(builder: (context) => new AuthorizationRegistration(auth: auth)),);
                          }
                      )
                  ),
                ],
              ))
        ],
      ),
    );
  }

  _buttonAuth(){
    return ElevatedButton(
        child: Text(
          "Войти",
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
        onPressed: () async{
          UserModel? user = await _authService.signInWithEmailAndPassword(email.trim(), password.trim());
          if(user == null){
            Fluttertoast.showToast(
                msg: "Пожалуйста проверьте почту или пароль.",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0
            );
          }else{
            Navigator.push(context1,
              new MaterialPageRoute(builder: (context) => new HomePage()),);
          }
        }
    );
  }

  _buttonReg(){
    return ElevatedButton(
      child: Text(
        "Регистрироваться",
        style: TextStyle(
            color: white,
            fontSize: 18
        ),
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
        onPressed: () async{
          if(newEmail == null || newPassword == null || newName == null || newLastName == null){
            Fluttertoast.showToast(
                msg: "Пожалуйста проверьте правильность заполнения всех ячеек. Пустыми ячейки оставлять нельзя!",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0
            );
          }
          else {
            UserModel? user = await _authService.registerWithEmailAndPassword(
                newEmail.trim(), newPassword.trim());
            if (user == null) {
              Fluttertoast.showToast(
                  msg: "Не можем зарегистрировать вас. Пожалуйста проверьте почту или пароль.",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
            } else {
              final firestoreInstance = FirebaseFirestore.instance;
              firestoreInstance.collection("users").add(
                  {
                    "name" : newName,
                    "surname": newLastName
                    }
                  ).then((value){
                print(value.id);
              });
              Navigator.of(context1).pushReplacement(
                  MaterialPageRoute(builder: (context) => VerifyScreen()));
            }
          }
        }
    );
  }

  Widget _inputAuth(String hint, TextEditingController controller,
      bool obsecure, int check) {
    return Container(
      height: 60,
      padding: EdgeInsets.only(left: 30, right: 30),
      child: TextField(
          controller: controller,
          obscureText: obsecure,
          onEditingComplete: (){
              switch(check){
                case 2:
                  if(!newEmail.contains('@')){
                    Fluttertoast.showToast(
                        msg: "Проверьте правильность почты, и наличие домена",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );
                  }
                  break;
                case 6:
                  Fluttertoast.showToast(
                      msg: "Пароли не совпадают",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                  break;

              }
          },
          onChanged: (value){
            switch(check){
              case 0:
                email = value;
                break;
              case 1:
                password = value;
                break;
              case 2:
                newEmail = value;
                break;
              case 3:
                newName = value;
                break;
              case 4:
                newLastName = value;
                break;
              case 5:
                newPassword = value;
                break;
              case 6:
                confirmPassword = value;
                break;
            }

          },
          style: const TextStyle(
            fontSize: 20,
            color: grey,
          ),
          decoration: InputDecoration(
              hintStyle: const TextStyle(
                  fontSize: 18,
                  color: grey
              ),
              hintText: hint,
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
      ),
    );
  }
}






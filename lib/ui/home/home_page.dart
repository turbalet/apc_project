import 'package:apc_project/foundation/constants.dart';
import 'package:apc_project/ui/auth_reg/screens/auth_reg.dart';
import 'package:apc_project/ui/auth_reg/services/auth_service.dart';
import 'package:apc_project/ui/landing/landing_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    AuthService _authService = AuthService();

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        margin: const EdgeInsets.all(20),
        color: backgroundColor,
        width: MediaQuery.of(context).size.width,
        child: GestureDetector(
        child:Text("Log out!!!!!!!!!!!!!!!!!!!!!!!!!!!!!", style: TextStyle(color: white),),
          onTap: (){
          _authService.logOut();
          Navigator.push(context,
            new MaterialPageRoute(builder: (context) => new LandingPage()),);
          },
      ),
      ),
    );
  }


}

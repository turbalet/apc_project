import 'package:apc_project/ui/auth_reg/screens/auth_reg.dart';
import 'package:apc_project/ui/auth_reg/services/auth_service.dart';
import 'package:apc_project/ui/home/home_page.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthService _authService = AuthService();
    bool isLoggedIn = true;
    String uid = _authService.currentUserId;
    if(uid != 'no'){
      isLoggedIn = false;
    }


    return isLoggedIn ? AuthorizationRegistration(auth: true,) : HomePage();
  }
}
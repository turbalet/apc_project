// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class GoogleSignIn extends StatefulWidget {
//   GoogleSignIn({Key? key}) : super(key: key);
//
//   @override
//   _GoogleSignInState createState() => _GoogleSignInState();
// }
//
// class _GoogleSignInState extends State<GoogleSignIn> {
//   bool isLoading = false;
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return  !isLoading? SizedBox(
//       width: size.width * 0.8,
//       child: OutlinedButton.icon(
//         icon: FaIcon(FontAwesomeIcons.google),
//         onPressed: () async {
//           setState(() {
//             isLoading = true;
//           });
//           FirebaseService service = new FirebaseService();
//           try {
//             await service.signInwithGoogle();
//             Navigator.pushNamedAndRemoveUntil(context, Constants.homeNavigate, (route) => false);
//           } catch(e){
//             if(e is FirebaseAuthException){
//               showMessage(e.message!);
//             }
//           }
//           setState(() {
//             isLoading = false;
//           });
//         },
//         label: Text(
//           Constants.textSignInGoogle,
//           style: TextStyle(
//               color: Constants.kBlackColor, fontWeight: FontWeight.bold),
//         ),
//         style: ButtonStyle(
//             backgroundColor:
//             MaterialStateProperty.all<Color>(Constants.kGreyColor),
//             side: MaterialStateProperty.all<BorderSide>(BorderSide.none)),
//       ),
//     ) : CircularProgressIndicator();
//   }
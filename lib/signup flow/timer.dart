import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_auth/firebase_auth.dart';




class resend_otp extends StatefulWidget {
  final String verificationId;
  final String mobNum;
  const resend_otp({super.key,
    required this.verificationId, required this.mobNum});

  @override
  State<resend_otp> createState() => _resend_otpState();
}
class _resend_otpState extends State<resend_otp> {


  late String mobNum = mobNum;
  bool resendButton = false;
  int _start = 61;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    startTimer();}

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_start == 0) {
          resendButton= true;
          _timer.cancel();}
        else {
          resendButton= false;
          _start--;}});});}


  @override
  Widget build(BuildContext context) {

    return
    LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          double circleSize = constraints.maxWidth * 0.9;

          return
          resendButton?
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(75, 180, 61, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(circleSize * 0.2),),),
                      onPressed: ()async {
                         FirebaseAuth auth = FirebaseAuth.instance;
                                 await auth.verifyPhoneNumber(
                                   phoneNumber: widget.mobNum,
                                   timeout: const Duration(seconds: 60),
                                   codeAutoRetrievalTimeout: (String verificationId) {
// Auto-resolution timed out...

                                   },
                                   verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {  },
                                   verificationFailed: (e) {
                                     // Utils.toastMessage(e.toString());

                                     },
                                   codeSent: (String verificationId, int? forceResendingToken)
                                   {},);}, child: Text("Resend OTP", textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: circleSize * 0.11,
                    color: Colors.white,)))
          :   ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(217, 217, 217, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(circleSize * 0.2),),),
              onPressed: (){}, child: Text(
              'Resend in: $_start', textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: circleSize * 0.11,
                color: Color.fromRGBO(75, 180, 61, 1),)));});




  }
}


//
// onTap: ()
// async {
//
// FirebaseAuth auth = FirebaseAuth.instance;
//
// await auth.verifyPhoneNumber(
// phoneNumber: phoneNum,
// timeout: const Duration(seconds: 180),
//
// codeAutoRetrievalTimeout: (String verificationId) {
// // Auto-resolution timed out...
// },
//
//
// verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {  },
// verificationFailed: (e) {
// Utils.toastMessage(e.toString());
// },
// codeSent: (String verificationId, int? forceResendingToken)
//
// {
//
// Navigator.of(context).push(
// PageRouteBuilder(
// transitionDuration: Duration(milliseconds: 500),
// pageBuilder: (BuildContext context,
// Animation<double> animation,
// Animation<double> secondaryAnimation) {
// return receive_otp(
// mobNum: phoneNum,
// verificationId: verificationId,
//
// );
// },
// transitionsBuilder: (BuildContext context,
// Animation<double> animation,
// Animation<double> secondaryAnimation,
// Widget child) {
// return SlideTransition(
// position: Tween<Offset>(
// begin: const Offset(1, 0),
// end: Offset.zero,
// ).animate(animation),
// child: child,
// );
// },
// ),
// );
// },
//
//
// );
//
//
//
//
// },

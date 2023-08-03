import 'dart:async';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_css_web/signup%20flow/enter_mob_num.dart';
import 'package:new_css_web/widgets/frosted_glass_effect.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:new_css_web/widgets/size_variables.dart';
import 'package:share_plus/share_plus.dart';
import 'home.dart';


class share_tip_screen extends StatefulWidget {
  const share_tip_screen({super.key});




  @override
  State<share_tip_screen> createState() => _share_tip_screenState();
}



String msg = "Glaciers and ice sheets hold about 69 percent of the world's freshwater";
void sharePressed(){
  String message = msg;
  Share.share(message);
}
class _share_tip_screenState extends State<share_tip_screen>  {
  //
  // late StreamSubscription<User?> user;
  // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  // User? _currentUser;
  //
  // void initState() {
  //   super.initState();
  //   user = FirebaseAuth.instance.authStateChanges().listen((user) {
  //     if (user == null) {
  //       print('User is currently signed out!');
  //     } else {
  //       print('User is signed in!');
  //     }
  //   });
  // }

  // @override
  // void dispose() {
  // //  user.cancel();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {

    final Uri studentDashboard = Uri.parse('https://cssstudentdasboard.web.app/#/');
    return
      ResponsiveBuilder(
          builder: (context, sizingInformation) {


            return
              FirebaseAuth.instance.currentUser != null ?

              Scaffold(
                  backgroundColor: AppConstants().primaryWhite,
                  body:
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        SizedBox(height: 1.sh,),
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: sizingInformation.deviceScreenType == DeviceScreenType.desktop?
                            MainAxisAlignment.start:MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:  EdgeInsets.all(
                                  MediaQuery.of(context).size.width * 0.01,
                                ),
                                child: Image.asset('images/csslogo.png',
                                ),
                              ),
                            ],
                          ),
                        ),



                        Expanded(
                          flex: 4,
                          child: Center(
                            child: frostedGlass(
                              color: AppConstants().grey,
                              height:sizingInformation.deviceScreenType == DeviceScreenType.desktop?
                              MediaQuery.of(context).size.height * 0.7:
                              MediaQuery.of(context).size.height * 0.6,
                              width:sizingInformation.deviceScreenType == DeviceScreenType.desktop?
                                  MediaQuery.of(context).size.width * 0.6
                                :MediaQuery.of(context).size.width * 0.8,

                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [

                                Text(
                                    "$msg",textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 3.sh,
                                      color: AppConstants().primaryGreen,
                                    )
                                ),



                                InkWell(
                                  onTap: sharePressed,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .center,
                                    children: [
                                      Text(
                                          "Share this information",
                                          style: TextStyle(
                                            fontSize: 1.5.sh,
                                            fontWeight: FontWeight.w500,
                                            color: AppConstants().primaryGreen,
                                          )
                                      ),

                                      Icon(Icons.share_outlined,
                                          color: AppConstants().primaryGreen,
                                          size: 3.sh)
                                    ],
                                  ),
                                ),



                                Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .center,
                                  children: [
                                    SizedBox(
                                      height:4.sh,
                                      width: 42.sw,
                                      child:

                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                            PageRouteBuilder(
                                              transitionDuration: Duration(
                                                  milliseconds: 500),
                                              pageBuilder: (
                                                  BuildContext context,
                                                  Animation<double> animation,
                                                  Animation<
                                                      double> secondaryAnimation) {
                                                return home();
                                              },
                                              transitionsBuilder: (
                                                  BuildContext context,
                                                  Animation<double> animation,
                                                  Animation<
                                                      double> secondaryAnimation,
                                                  Widget child) {
                                                return SlideTransition(
                                                  position: Tween<Offset>(
                                                    begin: const Offset(1, 0),
                                                    end: Offset.zero,
                                                  ).animate(animation),
                                                  child: child,
                                                );
                                              },
                                            ),
                                          );
                                        },
                                        child: Text('Go to Home Page',
                                          style: TextStyle(
                                              color: AppConstants().white,
                                              fontSize: 1.7.sh),),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: AppConstants().lightGreen,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius
                                                .circular(
                                                4.sw ),),),
                                      ),
                                    )


                                  ],
                                ),

                              ],),),



                          ),
                        ),
                      ])) :

              Scaffold(
                  backgroundColor: AppConstants().primaryGreen,


                  body:

                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              PageRouteBuilder(
                                transitionDuration: Duration(milliseconds: 500),
                                pageBuilder: (BuildContext context,
                                    Animation<double> animation,
                                    Animation<double> secondaryAnimation) {
                                  return enter_mobile_num();
                                },
                                transitionsBuilder: (BuildContext context,
                                    Animation<double> animation,
                                    Animation<double> secondaryAnimation,
                                    Widget child) {
                                  return SlideTransition(
                                    position: Tween<Offset>(
                                      begin: const Offset(1, 0),
                                      end: Offset.zero,
                                    ).animate(animation),
                                    child: child,
                                  );
                                },
                              ),
                            );


                            // enter mobile number box
                          },
                          child: Text(
                            'You do not have an account please sign up first', textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 2.5.sh,
                                decoration: TextDecoration.underline
                            ),),
                        ),


                      ],
                    ),
                  )
              );
          });




        }

}









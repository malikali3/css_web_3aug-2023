import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_css_web/widgets/size_variables.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../home_screen_flow/share_tip_screen.dart';


class signup_complete_screen extends StatefulWidget {
  const signup_complete_screen({super.key});

  @override
  State<signup_complete_screen> createState() => _signup_complete_screenState();
}

class _signup_complete_screenState extends State<signup_complete_screen>  {

  @override
  Widget build(BuildContext context) {



          return
          ResponsiveBuilder(

              builder: (context, sizingInformation){
                return
                  Scaffold(
                    backgroundColor: AppConstants().primaryWhite, // Set background color
                    body: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:  [

                          Expanded(
                            flex:2,
                            child: Padding(
                              padding:  EdgeInsets.all(2.sw),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  Image.asset(
                                    'images/done.png',
                                    // Replace with your logo image path
                                    width: 45.sw,
                                    height: 45.sh,
                                  ),
                                ],
                              ),
                            ),
                          ),



                          Expanded(
                            flex: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    'Welcome to CSS club',textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 3.5.sh,
                                      color: AppConstants().primaryGreen,
                                    )
                                ),
                              ],
                            ),
                          ),

                          Expanded(
                            flex: 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: [

                                Container(

                                  height:5.sh,
                                  width: 36.sw,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppConstants().lightGreen,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(6.sw),),),


                                      onPressed: () async {

                                        {
                                          Navigator.of(context).push(
                                            PageRouteBuilder(
                                              transitionDuration: const Duration(milliseconds: 500),
                                              pageBuilder: (BuildContext context,
                                                  Animation<double> animation,
                                                  Animation<double> secondaryAnimation) {
                                                return share_tip_screen();
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
                                        };
                                        },

                                      child: Text('Go to home',
                                          style: TextStyle(
                                              fontSize: 2.sh,
                                              color: AppConstants().primaryWhite))),
                                )

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),);
              }
          );}}









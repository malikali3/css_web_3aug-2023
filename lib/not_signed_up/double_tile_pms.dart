import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_css_web/pms%20subjects/pdf_file_syallabus_for_pms_subjects.dart';
import 'package:new_css_web/showing_css_subjects/pdf_file_syallabus_for_css_subjects.dart';
import 'package:new_css_web/pms%20subjects/years_as_dialog_pms.dart';
import 'package:new_css_web/showing_css_subjects/years_as_dialog.dart';
import 'package:new_css_web/widgets/empty_widget.dart';
import 'package:new_css_web/widgets/size_variables.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../widgets/getX_class.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'custom_grid.dart';
import 'custom_grid_pms.dart';






class double_tile_pms extends StatelessWidget {
  String subjectTitle;
  String subjectCode;


  double_tile_pms({required this.subjectTitle, required this.subjectCode,}) ;

  Services services1 =Get.find();


  @override
  Widget build(BuildContext context)  {


    String subjectI = '$subjectTitle-I';
    String subjectII = '$subjectTitle-II';
    String subjectCodeI = '$subjectCode-I';
    String subjectCodeII = '$subjectCode-II';


    return
      ResponsiveBuilder(
        builder: (context, sizingInformation)  {




          return
            Scaffold(

              body:

                      Center(
                        child: Column(
                          children: [

                            Padding(
                              padding:  EdgeInsets.all(4.sw),
                              child:

                                  InkWell(
                                    onTap:(){
                                      Navigator.of(context).push(
                                        PageRouteBuilder(
                                          transitionDuration: const Duration(milliseconds: 500),
                                          pageBuilder: (BuildContext context,
                                              Animation<double> animation,
                                              Animation<double> secondaryAnimation) {
                                            return
                                              custom_grid_pms(subjectTitle: subjectI, subjectCode: subjectCodeI,);
                                          },
                                          transitionsBuilder: (BuildContext context,
                                              Animation<double> animation,
                                              Animation<double> secondaryAnimation,
                                              Widget child) {
                                            return SlideTransition(
                                              position: Tween<Offset>(
                                                begin: const Offset(0, 1),
                                                end: Offset.zero,
                                              ).animate(animation),
                                              child: child,
                                            );
                                          },
                                        ),
                                      );

                                    },



                                    child: Container(
                                      width:
                                      MediaQuery.of(context).size.width>350?
                                      30.sw:
                                      20.sw,
                                      height:
                                      MediaQuery.of(context).size.width>350?
                                      10.sh:
                                      20.sh,
                                      decoration: BoxDecoration(
                                          color: AppConstants().primaryWhite,
                                          borderRadius: BorderRadius.circular(3.sw),
                                          border: Border.all(
                                            color: AppConstants().primaryGreen,
                                            width: 0.02.sw,)
                                      ),
                                      child: Center(
                                        child: Text(subjectI, style: TextStyle(color: AppConstants().primaryGreen, fontSize: 3.sw,
                                            fontWeight:FontWeight.w600 ),),
                                      ),
                                    ),
                                  )

                              ),



                            Padding(
                                padding:  EdgeInsets.all(4.sw),
                                child:

                                    InkWell(
                                      onTap:(){
                                        Navigator.of(context).push(
                                          PageRouteBuilder(
                                            transitionDuration: const Duration(milliseconds: 500),
                                            pageBuilder: (BuildContext context,
                                                Animation<double> animation,
                                                Animation<double> secondaryAnimation) {
                                              return
                                                custom_grid_pms(subjectTitle: subjectII, subjectCode: subjectCodeII,);
                                            },
                                            transitionsBuilder: (BuildContext context,
                                                Animation<double> animation,
                                                Animation<double> secondaryAnimation,
                                                Widget child) {
                                              return SlideTransition(
                                                position: Tween<Offset>(
                                                  begin: const Offset(0, 1),
                                                  end: Offset.zero,
                                                ).animate(animation),
                                                child: child,
                                              );
                                            },
                                          ),
                                        );

                                      },

                                      child: Container(
                                        width:
                                        MediaQuery.of(context).size.width>350?
                                        30.sw:
                                        20.sw,
                                        height:
                                        MediaQuery.of(context).size.width>350?
                                        10.sh:
                                        20.sh,

                                        decoration: BoxDecoration(
                                            color: AppConstants().primaryWhite,
                                            borderRadius: BorderRadius.circular(3.sw),
                                            border: Border.all(
                                              color: AppConstants().primaryGreen,
                                              width: 0.02.sw,)
                                        ),
                                        child: Center(
                                          child: Text(subjectII, style: TextStyle(color: AppConstants().primaryGreen, fontSize: 3.sw,
                                              fontWeight:FontWeight.w600 ),),
                                        ),
                                      ),
                                    )
                                ),





                            Padding(
                              padding:  EdgeInsets.only(top:
                              MediaQuery.of(context).size.width>350?
                              5.sw:
                              10.sw,
                                bottom:  MediaQuery.of(context).size.width>350?
                                5.sw:
                                0,),
                              child: ElevatedButton(onPressed: (){Navigator.pop(context);},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppConstants().lightGreen,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.sw),
                                    ),
                                  ),

                                  child: Text('back')),
                            )

                          ],),




                      )
            );






        },
      );

  }
}


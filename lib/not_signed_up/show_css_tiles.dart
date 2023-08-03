import 'package:flutter/material.dart';
import 'package:new_css_web/not_signed_up/tripple_tile_not_user.dart';
import '../widgets/getX_class.dart';
import 'package:get/get.dart';
import '../widgets/size_variables.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'custom_grid.dart';
import 'double_tile_not_user.dart';


class showCssTiles extends StatelessWidget {
  final String subjectTitle;
  final String subjectMarks;
  final String subjectCode;
  showCssTiles({required this.subjectTitle, required this.subjectMarks, required this.subjectCode});

  @override
  Widget build(BuildContext context) {


    return
      Scaffold(
        body: ResponsiveBuilder(
            builder: (context, sizingInformation) {
              return
                        Padding(
                          padding: EdgeInsets.all(2.sw),
                          child: Container(
                            decoration: BoxDecoration(
                                color:  AppConstants().primaryWhite,
                                borderRadius: BorderRadius.circular(4.sw),
                                border: Border.all(
                                  color:  AppConstants().primaryGreen,
                                  width: 0.5.sw,)
                            ),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [


                                  Expanded(
                                    flex: 2,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Center(
                                            child: InkWell(
                                              onTap: (){
                                                if(subjectCode=='AnA' || subjectCode=='Economics'|| subjectCode=='PS' || subjectCode=="Physics"
                                                    ||subjectCode=='Chemistry')
                                                {
                                                  Navigator.of(context).push(
                                                    PageRouteBuilder(
                                                      transitionDuration: const Duration(milliseconds: 500),
                                                      pageBuilder: (BuildContext context,
                                                          Animation<double> animation,
                                                          Animation<double> secondaryAnimation) {
                                                        return
                                                          double_tile_subject_not_user(subjectTitle: subjectTitle, subjectCode: subjectCode,);
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

                                                }

                                                //tripple tile route
                                                else if(subjectCode=='CS' || subjectCode=="IR"|| subjectCode=="AM" || subjectCode=="PM"
                                                    || subjectCode=='Geology' || subjectCode=='HoPnI'|| subjectCode=='IHnC'
                                                    || subjectCode=='BH'|| subjectCode=='EH' || subjectCode=='Botany' || subjectCode=='Zoology'
                                                    || subjectCode=='El' || subjectCode=='Law' || subjectCode=='Philosophy' ||subjectCode=='Psychology'
                                                    ||subjectCode=='Geography' || subjectCode=='Persian' ||subjectCode=='Arabic')
                                                {

                                                  Navigator.of(context).push(
                                                    PageRouteBuilder(
                                                      transitionDuration: const Duration(milliseconds: 500),
                                                      pageBuilder: (BuildContext context,
                                                          Animation<double> animation,
                                                          Animation<double> secondaryAnimation) {
                                                        return
                                                          tripple_tile_subject_not_user(subjectTitle: subjectTitle, subjectCode: subjectCode,);
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
                                                }


                                                else{
                                                Navigator.of(context).push(
                                                PageRouteBuilder(
                                                transitionDuration: const Duration(milliseconds: 500),
                                                pageBuilder: (BuildContext context,
                                                Animation<double> animation,
                                                Animation<double> secondaryAnimation) {
                                                return
                                                custom_grid_css(subjectTitle: subjectTitle, subjectCode: subjectCode,);
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
                                                }



                                              },
                                              child: Text('$subjectTitle', textAlign: TextAlign.center, style: TextStyle(
                                                  color:  AppConstants().primaryGreen, fontSize: 4.sw, fontWeight: FontWeight.w700,height:1
                                              ),),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex:1,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text('${subjectMarks.toString()} Marks', style: TextStyle(
                                          color:  AppConstants().primaryGreen, fontSize: 4.sw, fontWeight: FontWeight.w700,
                                        ),),
                                      ],
                                    ),
                                  ),


                                ]),
                          ),
                        );

            }),
      );



  }
}









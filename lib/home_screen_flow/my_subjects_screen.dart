import 'dart:async';
import 'package:new_css_web/pms%20subjects/my_pms_subjects.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:new_css_web/showing_css_subjects/pdf_file_syallabus_for_css_subjects.dart';
import 'package:new_css_web/showing_css_subjects/tripple_tile_subject.dart';
import 'package:new_css_web/showing_css_subjects/years_as_dialog.dart';
import '../widgets/getX_class.dart';
import '../showing_css_subjects/double_tile_subject.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:new_css_web/widgets/size_variables.dart';

import '../showing_css_subjects/my_css_subjects.dart';


class my_subjects_screen extends StatefulWidget {
  const my_subjects_screen({super.key});

  @override
  State<my_subjects_screen> createState() => _my_subjects_screenState();

}

final isDialOpen = ValueNotifier(false);
class _my_subjects_screenState extends State<my_subjects_screen> {
  final Uri apprays = Uri.parse('https://www.apprays.io/');


  Services services1 =Get.find();
  @override


  Widget build(BuildContext context)  {

    return
   ResponsiveBuilder(
            builder: (context, sizingInformation) {

              return
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Obx(()=>Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          services1.isSyllabus.value?
                          Text('Syllabus',textAlign: TextAlign.center, style: TextStyle(fontSize: 6.sw, color: AppConstants().primaryGreen),):Text(""),

                          services1.isPastSubjective.value?
                          Text('Past Subjective Papers',textAlign: TextAlign.center, style: TextStyle(fontSize: 6.sw, color: AppConstants().primaryGreen)):Text(""),

                          services1.isMCQ.value?
                          Text('Select MCQ',textAlign: TextAlign.center, style: TextStyle(fontSize: 6.sw, color: AppConstants().primaryGreen)):Text("")


                        ],),
                      ),
                    SizedBox(height: 5.sh,),
                    Container(
                      width: MediaQuery.of(context).size.width - 5.sw,

                      decoration: BoxDecoration(
                          color: AppConstants().primaryWhite,
                          borderRadius: BorderRadius.circular(4.sw),
                          border: Border.all(
                            color: AppConstants().lightGreen,
                            width: 0.6.sw,)
                      ),
                      child:  my_css_subjects(),),

                    Container(height: 5.sh,
                      decoration: BoxDecoration(
                          color: AppConstants().lightGrey,
                          borderRadius: BorderRadius.circular(4.sw),
                          border: Border.all(
                            color: AppConstants().lightGrey,
                            width: 0.6.sw,)
                      ),),

                    Container(
                        width: MediaQuery.of(context).size.width - 5.sw,
                        decoration: BoxDecoration(
                            color: AppConstants().primaryWhite,
                            borderRadius: BorderRadius.circular(4.sw),
                            border: Border.all(
                              color: AppConstants().lightGreen,
                              width: 0.6.sw,)
                        ),

                        child: my_pms_subjects())
                  ],);

            }
      );


  }

}






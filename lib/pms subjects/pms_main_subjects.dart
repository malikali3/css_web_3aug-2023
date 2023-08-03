import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:new_css_web/pms%20subjects/single_tile_subjects_pms.dart';
import '../widgets/getX_class.dart';
import '../showing_css_subjects/all_single_subjects_containers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:new_css_web/widgets/size_variables.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'double_tile_pms_subjects.dart';



class pms_subjects extends StatefulWidget {
  const pms_subjects({super.key});

  @override
  State<pms_subjects> createState() => _pms_subjects();

}

final isDialOpen = ValueNotifier(false);
class _pms_subjects extends State<pms_subjects> {

  @override

  Widget build(BuildContext context)  {


    return
      ResponsiveBuilder(
          builder: (context, sizingInformation) {

            final List compulsoryPMS = [
              {'title':'English', 'marks': 100, 'code': 'Eng'},
              {'title':'English Essay', 'marks': 100, 'code': 'EE'},
              {'title':'Urdu', 'marks': 100,'code': 'Urdu'},
              {'title':'Islamic Studies', 'marks': 100,'code': 'IS'},
              {'title':'Ethics', 'marks': 100,'code': 'Ethics'},
              {'title':'Pakistan Studies', 'marks': 100,'code': 'PakS'},
              {'title':'General Knowledge','marks': 100,'code': 'GK'},
            ];
            final List ogA =[
              {'title':'Economics', 'marks':200, 'code': 'Economics'},
              {'title':'Commerce',  'marks':200,'code': 'Commerce'},
              {'title':'Business Administration', 'marks':200,'code': 'BA'},
              {'title':'Public Administration', 'marks':200,'code': 'PA'},
            ];
            final List ogB= [
              {'title':'Agriculture','marks':200,'code': 'Agriculture'},
              {'title':'Veterinary','marks':200,'code': 'VS'},
              {'title':'Botany','marks':200,'code': 'Botany'},
              {'title':'Zoology','marks':200,'code': 'Zoology'},
            ];
            final List ogC =[
              {'title':'Mathematics','marks':200, 'code': 'Mathematics'},
              {'title':'Computer Science','marks':200,'code': 'CS'},
              {'title':'Statistics','marks':200,'code': 'Statistics'},
              {'title':'Principle of Engineering','marks':200, 'code': 'PE'},
            ];
            final List ogD = [
              {'title':'Physics', 'marks':200,'code': 'Physics'},
              {'title':'Chemistry',  'marks':200,'code': 'Chemistry'},
              {'title':'Geology',  'marks':200,'code': 'Geology'},
              {'title':'Geography',  'marks':200,'code': 'Geography'},
            ];
            final List ogE = [
              {'title':'Political Science',  'marks':200,'code': 'PS'},
              {'title':'History', 'marks':200,'code': 'History'},
              {'title':'Law','marks':200,'code': 'Law'},
              {'title':'Mass Communication', 'marks':200,'code': 'MC'},
            ];
            final List ogF=[
              {'title':'Philosophy','marks':200,'code': 'Philosophy'},
              {'title':'Psychology', 'marks':200,'code': 'Psychology'},
              {'title':'Sociology', 'marks':200,'code': 'Sociology'},
              {'title':'Social Work', 'marks':200,'code': 'SW'},
            ];
            final List ogG = [
              {'title':'English Literature', 'marks':200,'code': 'EL'},
              {'title':'Urdu', 'marks':200,'code': 'UrduOptional'},
              {'title':'Arabic',  'marks':200,'code': 'Arabic'},
              {'title':'Education', 'marks':200,'code': 'Education'},
              {'title':'Persian', 'marks':200,'code': 'Persian'},
              {'title':'Punjabi',  'marks':200,'code': 'Punjabi'},
            ];


            return
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Compulsory', style: TextStyle(color: AppConstants().primaryGreen, fontSize:6.5.sw),),
                  SizedBox(
                    height:
                    MediaQuery.of(context).size.width>1170?
                    22.sh:
                    MediaQuery.of(context).size.width>950?
                    28.sh:
                    MediaQuery.of(context).size.width>560?
                    35.sh:
                    MediaQuery.of(context).size.width>380?
                    25.sh
                        :20.sh,
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1, // Number of columns in the grid
                        mainAxisSpacing: 10.0, // Spacing between each row
                        crossAxisSpacing: 10.0, // Spacing between each column

                      ),
                      itemCount: compulsoryPMS.length, // Total number of items in the grid
                      itemBuilder: (BuildContext context, int index) {


                        if(index== 0){
                          return Align(
                            child: singleTileSubjectsPMS(subjectTitle: compulsoryPMS[index]['title'], subjectMarks: compulsoryPMS[index]['marks'].toString(), subjectCode: compulsoryPMS[index]['code'],
                            ),
                          );
                        };
                        if(index== 1){
                          return singleTileSubjectsPMS(subjectTitle: compulsoryPMS[index]["title"], subjectMarks: compulsoryPMS[index]['marks'].toString(), subjectCode: compulsoryPMS[index]['code'],);
                        };
                        if(index== 2){
                          return singleTileSubjectsPMS(subjectTitle: compulsoryPMS[index]["title"], subjectMarks: compulsoryPMS[index]['marks'].toString(), subjectCode: compulsoryPMS[index]['code'],);
                        };
                        if(index== 3){
                          return singleTileSubjectsPMS(subjectTitle: compulsoryPMS[index]["title"], subjectMarks: compulsoryPMS[index]['marks'].toString(), subjectCode: compulsoryPMS[index]['code'],);
                        };
                        if(index== 4){
                          return singleTileSubjectsPMS(subjectTitle: compulsoryPMS[index]["title"], subjectMarks: compulsoryPMS[index]['marks'].toString(), subjectCode: compulsoryPMS[index]['code'],);
                        };
                        if(index== 5){
                          return singleTileSubjectsPMS(subjectTitle: compulsoryPMS[index]["title"], subjectMarks: compulsoryPMS[index]['marks'].toString(), subjectCode: compulsoryPMS[index]['code'],);
                        };
                        if(index== 6){
                          return singleTileSubjectsPMS(subjectTitle: compulsoryPMS[index]["title"], subjectMarks: compulsoryPMS[index]['marks'].toString(), subjectCode: compulsoryPMS[index]['code'],);
                        };

                      },
                    ),
                  ),
                  SizedBox(height: 5.sh,),

                  Text('Optional Group-A',style: TextStyle(color: AppConstants().primaryGreen, fontSize: 6.5.sw),),
                  SizedBox(
                    height:
                    MediaQuery.of(context).size.width>1170?
                    22.sh:
                    MediaQuery.of(context).size.width>950?
                    28.sh:
                    MediaQuery.of(context).size.width>560?
                    35.sh:
                    MediaQuery.of(context).size.width>380?
                    25.sh
                        :20.sh,
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1, // Number of columns in the grid
                        mainAxisSpacing: 10.0, // Spacing between each row
                        crossAxisSpacing: 10.0, // Spacing between each column

                      ),
                      itemCount: ogA.length, // Total number of items in the grid
                      itemBuilder: (BuildContext context, int index) {
                        if(index== 0){
                          return singleTileSubjectsPMS(subjectTitle: ogA[index]['title'], subjectMarks: ogA[index]['marks'].toString(), subjectCode: ogA[index]['code'],);
                        };
                        if(index== 1){
                          return singleTileSubjectsPMS(subjectTitle: ogA[index]["title"], subjectMarks: ogA[index]['marks'].toString(), subjectCode: ogA[index]['code'],);
                        };
                        if(index== 2){
                          return singleTileSubjectsPMS(subjectTitle: ogA[index]["title"], subjectMarks: ogA[index]['marks'].toString(), subjectCode: ogA[index]['code'],);
                        };
                        if(index== 3){
                          return singleTileSubjectsPMS(subjectTitle: ogA[index]["title"], subjectMarks: ogA[index]['marks'].toString(), subjectCode: ogA[index]['code'],);
                        };
                        if(index== 4){
                          return singleTileSubjectsPMS(subjectTitle: ogA[index]["title"], subjectMarks: ogA[index]['marks'].toString(), subjectCode: ogA[index]['code'],);
                        };

                      },
                    ),
                  ),
                  SizedBox(height: 5.sh,),


                  Text('Optional Group-B',style: TextStyle(color: AppConstants().primaryGreen, fontSize: 6.5.sw),),
                  SizedBox(
                    height:
                    MediaQuery.of(context).size.width>1170?
                    22.sh:
                    MediaQuery.of(context).size.width>950?
                    28.sh:
                    MediaQuery.of(context).size.width>560?
                    35.sh:
                    MediaQuery.of(context).size.width>380?
                    25.sh
                        :20.sh,
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1, // Number of columns in the grid
                        mainAxisSpacing: 10.0, // Spacing between each row
                        crossAxisSpacing: 10.0, // Spacing between each column

                      ),
                      itemCount: ogB.length, // Total number of items in the grid
                      itemBuilder: (BuildContext context, int index) {

                        if(index== 0){
                          return singleTileSubjectsPMS(subjectTitle: ogB[index]['title'], subjectMarks: ogB[index]['marks'].toString(), subjectCode: ogB[index]['code'],);
                        };
                        if(index== 1){
                          return singleTileSubjectsPMS(subjectTitle: ogB[index]["title"], subjectMarks: ogB[index]['marks'].toString(), subjectCode: ogB[index]['code'],);
                        };
                        if(index== 2){
                          return singleTileSubjectsPMS(subjectTitle: ogB[index]["title"], subjectMarks: ogB[index]['marks'].toString(), subjectCode: ogB[index]['code'],);
                        };
                        if(index== 3){
                          return singleTileSubjectsPMS(subjectTitle: ogB[index]["title"], subjectMarks: ogB[index]['marks'].toString(), subjectCode: ogB[index]['code'],);
                        };
                        if(index== 4){
                          return singleTileSubjectsPMS(subjectTitle: ogB[index]["title"], subjectMarks: ogB[index]['marks'].toString(), subjectCode: ogB[index]['code'],);
                        };
                        if(index== 5){
                          return singleTileSubjectsPMS(subjectTitle: ogB[index]["title"], subjectMarks: ogB[index]['marks'].toString(), subjectCode: ogB[index]['code'],);
                        };

                      },
                    ),
                  ),
                  SizedBox(height: 5.sh,),


                  Text('Optional Group-C',style: TextStyle(color: AppConstants().primaryGreen, fontSize: 6.5.sw),),
                  SizedBox(
                    height:
                    MediaQuery.of(context).size.width>1170?
                    22.sh:
                    MediaQuery.of(context).size.width>950?
                    28.sh:
                    MediaQuery.of(context).size.width>560?
                    35.sh:
                    MediaQuery.of(context).size.width>380?
                    25.sh
                        :20.sh,
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1, // Number of columns in the grid
                        mainAxisSpacing: 10.0, // Spacing between each row
                        crossAxisSpacing: 10.0, // Spacing between each column

                      ),
                      itemCount: ogC.length, // Total number of items in the grid
                      itemBuilder: (BuildContext context, int index) {
                        if(index== 0){
                          return singleTileSubjectsPMS(subjectTitle: ogC[index]['title'], subjectMarks: ogC[index]['marks'].toString(), subjectCode: ogC[index]['code'],);
                        };
                        if(index== 1){
                          return singleTileSubjectsPMS(subjectTitle: ogC[index]["title"], subjectMarks: ogC[index]['marks'].toString(), subjectCode: ogC[index]['code'],);
                        };
                        if(index== 2){
                          return singleTileSubjectsPMS(subjectTitle: ogC[index]["title"], subjectMarks: ogC[index]['marks'].toString(), subjectCode: ogC[index]['code'],);
                        };
                        if(index== 3){
                          return singleTileSubjectsPMS(subjectTitle: ogC[index]["title"], subjectMarks: ogC[index]['marks'].toString(), subjectCode: ogC[index]['code'],);
                        };

                      },
                    ),
                  ),
                  SizedBox(height: 5.sh,),


                  Text('Optional Group-D',style: TextStyle(color: AppConstants().primaryGreen, fontSize: 6.5.sw),),
                  SizedBox(
                    height:
                    MediaQuery.of(context).size.width>1170?
                    22.sh:
                    MediaQuery.of(context).size.width>950?
                    28.sh:
                    MediaQuery.of(context).size.width>560?
                    35.sh:
                    MediaQuery.of(context).size.width>380?
                    25.sh
                        :20.sh,
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1, // Number of columns in the grid
                        mainAxisSpacing: 10.0, // Spacing between each row
                        crossAxisSpacing: 10.0, // Spacing between each column

                      ),
                      itemCount: ogD.length, // Total number of items in the grid
                      itemBuilder: (BuildContext context, int index) {
                        if(index== 0){
                          return singleTileSubjectsPMS(subjectTitle: ogD[index]['title'], subjectMarks: ogD[index]['marks'].toString(), subjectCode: ogD[index]['code'],);
                        };
                        if(index== 1){
                          return singleTileSubjectsPMS(subjectTitle: ogD[index]["title"], subjectMarks: ogD[index]['marks'].toString(), subjectCode: ogD[index]['code'],);
                        };
                        if(index== 2){
                          return singleTileSubjectsPMS(subjectTitle: ogD[index]["title"], subjectMarks: ogD[index]['marks'].toString(), subjectCode: ogD[index]['code'],);
                        };
                        if(index== 3){
                          return singleTileSubjectsPMS(subjectTitle: ogD[index]["title"], subjectMarks: ogD[index]['marks'].toString(), subjectCode: ogD[index]['code'],);
                        };
                        if(index== 4){
                          return singleTileSubjectsPMS(subjectTitle: ogD[index]["title"], subjectMarks: ogD[index]['marks'].toString(), subjectCode: ogD[index]['code'],);
                        };

                      },
                    ),
                  ),
                  SizedBox(height: 5.sh,),


                  Text('Optional Group-E',style: TextStyle(color: AppConstants().primaryGreen, fontSize: 6.5.sw),),
                  SizedBox(
                    height:
                    MediaQuery.of(context).size.width>1170?
                    22.sh:
                    MediaQuery.of(context).size.width>950?
                    28.sh:
                    MediaQuery.of(context).size.width>560?
                    35.sh:
                    MediaQuery.of(context).size.width>380?
                    25.sh
                        :20.sh,
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1, // Number of columns in the grid
                        mainAxisSpacing: 10.0, // Spacing between each row
                        crossAxisSpacing: 10.0, // Spacing between each column

                      ),
                      itemCount: ogE.length, // Total number of items in the grid
                      itemBuilder: (BuildContext context, int index) {
                        // Return a widget for each grid item
                        if(index== 0){
                          return singleTileSubjectsPMS(subjectTitle: ogE[index]['title'], subjectMarks: ogE[index]['marks'].toString(), subjectCode: ogE[index]['code'],);
                        };
                        if(index== 1){
                          return singleTileSubjectsPMS(subjectTitle: ogE[index]["title"], subjectMarks: ogE[index]['marks'].toString(), subjectCode: ogE[index]['code'],);
                        };
                        if(index== 2){
                          return singleTileSubjectsPMS(subjectTitle: ogE[index]["title"], subjectMarks: ogE[index]['marks'].toString(), subjectCode: ogE[index]['code'],);
                        };
                        if(index== 3){
                          return singleTileSubjectsPMS(subjectTitle: ogE[index]["title"], subjectMarks: ogE[index]['marks'].toString(), subjectCode: ogE[index]['code'],);
                        };
                        if(index== 4){
                          return singleTileSubjectsPMS(subjectTitle: ogE[index]["title"], subjectMarks: ogE[index]['marks'].toString(), subjectCode: ogE[index]['code'],);
                        };
                        if(index== 5){
                          return singleTileSubjectsPMS(subjectTitle: ogE[index]["title"], subjectMarks: ogE[index]['marks'].toString(), subjectCode: ogE[index]['code'],);
                        };
                        if(index== 6){
                          return singleTileSubjectsPMS(subjectTitle: ogE[index]["title"], subjectMarks: ogE[index]['marks'].toString(), subjectCode: ogE[index]['code'],);
                        };
                      },
                    ),
                  ),
                  SizedBox(height: 5.sh,),


                  Text('Optional Group-F',style: TextStyle(color: AppConstants().primaryGreen, fontSize: 6.5.sw),),
                  SizedBox(
                    height:
                    MediaQuery.of(context).size.width>1170?
                    22.sh:
                    MediaQuery.of(context).size.width>950?
                    28.sh:
                    MediaQuery.of(context).size.width>560?
                    35.sh:
                    MediaQuery.of(context).size.width>380?
                    25.sh
                        :20.sh,
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1, // Number of columns in the grid
                        mainAxisSpacing: 10.0, // Spacing between each row
                        crossAxisSpacing: 10.0, // Spacing between each column

                      ),
                      itemCount: ogF.length, // Total number of items in the grid
                      itemBuilder: (BuildContext context, int index) {
                        // Return a widget for each grid item
                        if(index== 0){
                          return singleTileSubjectsPMS(subjectTitle: ogF[index]['title'], subjectMarks: ogF[index]['marks'].toString(), subjectCode: ogF[index]['code'],);
                        };
                        if(index== 1){
                          return singleTileSubjectsPMS(subjectTitle: ogF[index]["title"], subjectMarks: ogF[index]['marks'].toString(), subjectCode: ogF[index]['code'],);
                        };
                        if(index== 2){
                          return singleTileSubjectsPMS(subjectTitle: ogF[index]["title"], subjectMarks: ogF[index]['marks'].toString(), subjectCode: ogF[index]['code'],);
                        };
                        if(index== 3){
                          return singleTileSubjectsPMS(subjectTitle: ogF[index]["title"], subjectMarks: ogF[index]['marks'].toString(), subjectCode: ogF[index]['code'],);
                        };
                        if(index== 4){
                          return singleTileSubjectsPMS(subjectTitle: ogF[index]["title"], subjectMarks: ogF[index]['marks'].toString(), subjectCode: ogF[index]['code'],);
                        };
                        if(index== 5){
                          return singleTileSubjectsPMS(subjectTitle: ogF[index]["title"], subjectMarks: ogF[index]['marks'].toString(), subjectCode: ogF[index]['code'],);
                        };
                        if(index== 6){
                          return singleTileSubjectsPMS(subjectTitle: ogF[index]["title"], subjectMarks: ogF[index]['marks'].toString(), subjectCode: ogF[index]['code'],);
                        };
                      },
                    ),
                  ),
                  SizedBox(height: 5.sh,),


                  Text('Optional Group-G',style: TextStyle(color: AppConstants().primaryGreen, fontSize: 6.5.sw),),
                  SizedBox(
                    height:
                    MediaQuery.of(context).size.width>1170?
                    22.sh:
                    MediaQuery.of(context).size.width>950?
                    28.sh:
                    MediaQuery.of(context).size.width>560?
                    35.sh:
                    MediaQuery.of(context).size.width>380?
                    25.sh
                        :20.sh,
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1, // Number of columns in the grid
                        mainAxisSpacing: 10.0, // Spacing between each row
                        crossAxisSpacing: 10.0, // Spacing between each column

                      ),
                      itemCount: ogG.length, // Total number of items in the grid
                      itemBuilder: (BuildContext context, int index) {
                        if(index== 0){
                          return singleTileSubjectsPMS(subjectTitle: ogG[index]['title'], subjectMarks: ogG[index]['marks'].toString(), subjectCode: ogG[index]['code'],);
                        };
                        if(index== 1){
                          return singleTileSubjectsPMS(subjectTitle: ogG[index]["title"], subjectMarks: ogG[index]['marks'].toString(), subjectCode: ogG[index]['code'],);
                        };
                        if(index== 2){
                          return singleTileSubjectsPMS(subjectTitle: ogG[index]["title"], subjectMarks: ogG[index]['marks'].toString(), subjectCode: ogG[index]['code'],);
                        };
                        if(index== 3){
                          return singleTileSubjectsPMS(subjectTitle: ogG[index]["title"], subjectMarks: ogG[index]['marks'].toString(), subjectCode: ogG[index]['code'],);
                        };
                        if(index== 4){
                          return singleTileSubjectsPMS(subjectTitle: ogG[index]["title"], subjectMarks: ogG[index]['marks'].toString(), subjectCode: ogG[index]['code'],);
                        };
                        if(index== 5){
                          return singleTileSubjectsPMS(subjectTitle: ogG[index]["title"], subjectMarks: ogG[index]['marks'].toString(), subjectCode: ogG[index]['code'],);
                        };
                        if(index== 6){
                          return singleTileSubjectsPMS(subjectTitle: ogG[index]["title"], subjectMarks: ogG[index]['marks'].toString(), subjectCode: ogG[index]['code'],);
                        };
                        if(index== 7){
                          return singleTileSubjectsPMS(subjectTitle: ogG[index]["title"], subjectMarks: ogG[index]['marks'].toString(), subjectCode: ogG[index]['code'],);
                        };
                        if(index== 8){
                          return singleTileSubjectsPMS(subjectTitle: ogG[index]["title"], subjectMarks: ogG[index]['marks'].toString(), subjectCode: ogG[index]['code'],);
                        };
                        if(index== 9){
                          return singleTileSubjectsPMS(subjectTitle: ogG[index]["title"], subjectMarks: ogG[index]['marks'].toString(), subjectCode: ogG[index]['code'],);
                        };
                        if(index== 10){
                          return singleTileSubjectsPMS(subjectTitle: ogG[index]["title"], subjectMarks: ogG[index]['marks'].toString(), subjectCode: ogG[index]['code'],);
                        };
                      },
                    ),
                  ),

                ],);});}}


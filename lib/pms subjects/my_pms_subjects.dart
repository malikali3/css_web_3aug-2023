import 'dart:async';
import 'package:new_css_web/pms%20subjects/double_tile_pms_subjects.dart';
import 'package:new_css_web/pms%20subjects/pdf_file_syallabus_for_pms_subjects.dart';
import 'package:new_css_web/pms%20subjects/years_as_dialog_pms.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:new_css_web/showing_css_subjects/pdf_file_syallabus_for_css_subjects.dart';
import 'package:new_css_web/showing_css_subjects/tripple_tile_subject.dart';
import 'package:new_css_web/showing_css_subjects/years_as_dialog.dart';
import '../showing_css_subjects/double_tile_subject.dart';
import '../widgets/getX_class.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:new_css_web/widgets/size_variables.dart';


class my_pms_subjects extends StatefulWidget {
  const my_pms_subjects({super.key});

  @override
  State<my_pms_subjects> createState() => _my_pms_subjectsState();

}

final isDialOpen = ValueNotifier(false);
class _my_pms_subjectsState extends State<my_pms_subjects> {
  final Uri apprays = Uri.parse('https://www.apprays.io/');


  Services services1 =Get.find();
  @override


  Widget build(BuildContext context)  {

    return
      ResponsiveBuilder(
          builder: (context, sizingInformation) {
            final User? user = FirebaseAuth.instance.currentUser;
            final id = user?.uid;
            Stream stream1 = FirebaseFirestore.instance
                .collection('users_basic_data')
                .doc(id!)
                .collection('my_pms_subjects').doc(id!)
                .snapshots();

            return
              Column(
                  children: [
                    StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('users_basic_data')
                            .doc('$id')
                            .collection('pms_subjects_marks')
                            .doc('$id')
                            .snapshots(),
                        builder:(context, snapshot){
                          if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');}

                          else if (snapshot.connectionState == ConnectionState.waiting) {
                            return Text('Loading...');}

                          else if (!snapshot.hasData || !snapshot.data!.exists) {
                            return Text('Document does not exist');}

                          Map<String, dynamic> documentData = snapshot.data!.data() as Map<
                              String,
                              dynamic>;
                          int sum = 0;
                          documentData.forEach((key, value) {
                            if (value is int) {
                              sum += value;
                            }
                          });

                          return Align(
                              alignment: Alignment.topCenter,
                              child:
                              Column(children: [
                                Text(
                                  ('PMS Section'),textAlign: TextAlign.center,
                                  // ('CSS (${data['MySubjects']['marks'].toString()})'),
                                  style: TextStyle(
                                      fontSize: 5.sw,
                                      color:   AppConstants().lightGreen,
                                      fontWeight:   FontWeight.w600
                                  ),),
                                Text(
                                  ('Total marks: ($sum)'),textAlign: TextAlign.center,
                                  // ('CSS (${data['MySubjects']['marks'].toString()})'),
                                  style: TextStyle(
                                      fontSize: 5.sw,
                                      color:   AppConstants().lightGreen,
                                      fontWeight:   FontWeight.w600
                                  ),),


                              ],)



                          );}
                    ),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        StreamBuilder(
                            stream: stream1,
                            builder:(context, snapshot){
                              if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');}

                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return Text('Loading...');}

                              if (!snapshot.hasData || !snapshot.data!.exists) {
                                return Text('Document does not exist');}


                              Map<String, dynamic> data =  snapshot.data!.data() as Map<String, dynamic>;



                              {
                                return Container(
                                  height: MediaQuery.of(context).size.height,
                                  width:
                                  MediaQuery.of(context).size.width>1170?
                                  150.sw:
                                  MediaQuery.of(context).size.width>950?
                                  120.sw:
                                  MediaQuery.of(context).size.width>600?
                                  100.sw:
                                  90.sw,
                                  child: GridView.builder(
                                    physics: const ScrollPhysics(),
                                    scrollDirection: Axis.vertical,
                                    gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount:
                                        MediaQuery.of(context).size.width>1170?
                                        5:
                                        MediaQuery.of(context).size.width>950?
                                        4:
                                        3
                                    ),
                                    itemCount: data['MySubjects'].length,
                                    itemBuilder: (BuildContext context, int index) {
                                      return
                                        data['MySubjects']==null?
                                        Text(''):
                                        Padding(
                                          padding:  EdgeInsets.all(1.sw),
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  color: AppConstants().primaryWhite,
                                                  borderRadius: BorderRadius.circular(4.sw),
                                                  border: Border.all(
                                                    color: AppConstants().primaryGreen,
                                                    width: 0.2.sw,)
                                              ),
                                              child:

                                              Obx(()=>Center(
                                                child: InkWell(
                                                    onTap:
                                                    services1.isSyllabus.value?
                                                        (){
                                                      String code = data['MySubjects'][index]['code'];
                                                      String title = data['MySubjects'][index]['title'];

                                                      if(code == 'Ethics')
                                                      {
                                                        showDialog(
                                                            context: context,
                                                            builder: (
                                                                BuildContext context) {
                                                              return
                                                                Dialog(
                                                                  shape: RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(4.sw),
                                                                  ),
                                                                  child:


                                                                  pdf_file_syallabus_for_pms_subjects(
                                                                    value: code,),);});
                                                      }
                                                      else if(code == 'Eng')
                                                      {
                                                        showDialog(
                                                            context: context,
                                                            builder: (
                                                                BuildContext context) {
                                                              return
                                                                Dialog(
                                                                  shape: RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(4.sw),
                                                                  ),
                                                                  child:


                                                                  pdf_file_syallabus_for_pms_subjects(
                                                                    value: code,),);});
                                                      }
                                                      else if(code == 'EE')
                                                      {
                                                        showDialog(
                                                            context: context,
                                                            builder: (
                                                                BuildContext context) {
                                                              return
                                                                Dialog(
                                                                  shape: RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(4.sw),
                                                                  ),
                                                                  child:


                                                                  pdf_file_syallabus_for_pms_subjects(
                                                                    value: code,),);});
                                                      }
                                                      else if(code == 'Urdu')
                                                      {
                                                        showDialog(
                                                            context: context,
                                                            builder: (
                                                                BuildContext context) {
                                                              return
                                                                Dialog(
                                                                  shape: RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(4.sw),
                                                                  ),
                                                                  child:


                                                                  pdf_file_syallabus_for_pms_subjects(
                                                                    value: code,),);});
                                                      }
                                                      else if(code == 'IS')
                                                      {
                                                        showDialog(
                                                            context: context,
                                                            builder: (
                                                                BuildContext context) {
                                                              return
                                                                Dialog(
                                                                  shape: RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(4.sw),
                                                                  ),
                                                                  child:


                                                                  pdf_file_syallabus_for_pms_subjects(
                                                                    value: code,),);});
                                                      }
                                                      else if(code == 'PakS')
                                                      {
                                                        showDialog(
                                                            context: context,
                                                            builder: (
                                                                BuildContext context) {
                                                              return
                                                                Dialog(
                                                                  shape: RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(4.sw),
                                                                  ),
                                                                  child:


                                                                  pdf_file_syallabus_for_pms_subjects(
                                                                    value: code,),);});
                                                      }
                                                      else if(code == 'GK')
                                                      {
                                                        showDialog(
                                                            context: context,
                                                            builder: (
                                                                BuildContext context) {
                                                              return
                                                                Dialog(
                                                                  shape: RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(4.sw),
                                                                  ),
                                                                  child:


                                                                  pdf_file_syallabus_for_pms_subjects(
                                                                    value: code,),);});
                                                      }

                                                      else{
                                                        showDialog(

                                                            barrierDismissible: false,
                                                            context: context, builder: (BuildContext context){
                                                          return Dialog(
                                                            shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(0.2.sw),
                                                            ),
                                                            child: Container(
                                                              width: 100.sw,
                                                              height:     MediaQuery.of(context).size.width>500?
                                                              80.sh:
                                                              MediaQuery.of(context).size.width>900?
                                                              60.sh:
                                                              60.sh,
                                                              child: double_tile_subject_pms(subjectCode: code, subjectTitle: title,),
                                                            ),


                                                          );
                                                        }

                                                        );

                                                      }}
                                                        :(){
                                                      String code = data['MySubjects'][index]['code'];
                                                      String title = data['MySubjects'][index]['title'];

                                                      if(code == 'Ethics')
                                                      {
                                                        showDialog(context: context, builder: (BuildContext context){
                                                          return Dialog(
                                                            child: Container(
                                                              child: years_as_dialog_pms(subjectCode: code, subjectTitle: title,),
                                                            ),);});

                                                      }
                                                      else if(code == 'Eng')
                                                      {
                                                        showDialog(context: context, builder: (BuildContext context){
                                                          return Dialog(
                                                            child: Container(
                                                              child: years_as_dialog_pms(subjectCode: code, subjectTitle: title,),
                                                            ),);});
                                                      }

                                                      else if(code == 'EE') {
                                                        showDialog(context: context, builder: (BuildContext context){
                                                          return Dialog(
                                                            child: Container(
                                                              child: years_as_dialog_pms(subjectCode: code, subjectTitle: title,),
                                                            ),);});
                                                      }

                                                      else if(code == 'Urdu')
                                                      {
                                                        showDialog(context: context, builder: (BuildContext context){
                                                          return Dialog(
                                                            child: Container(
                                                              child: years_as_dialog_pms(subjectCode: code, subjectTitle: title,),
                                                            ),);});

                                                      }
                                                      else if(code == 'IS')
                                                      {
                                                        showDialog(context: context, builder: (BuildContext context){
                                                          return Dialog(
                                                            child: Container(
                                                              child: years_as_dialog_pms(subjectCode: code, subjectTitle: title,),
                                                            ),);});

                                                      }
                                                      else if(code == 'PakS')
                                                      {
                                                        showDialog(context: context, builder: (BuildContext context){
                                                          return Dialog(
                                                            child: Container(
                                                              child: years_as_dialog_pms(subjectCode: code, subjectTitle: title,),
                                                            ),);});

                                                      }
                                                      else if(code == 'GK')
                                                      {
                                                        showDialog(context: context, builder: (BuildContext context){
                                                          return Dialog(
                                                            child: Container(
                                                              child: years_as_dialog_pms(subjectCode: code, subjectTitle: title,),
                                                            ),);});

                                                      }

                                                      else{
                                                        showDialog(

                                                            barrierDismissible: false,
                                                            context: context, builder: (BuildContext context){
                                                          return Dialog(
                                                            shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(0.2.sw),
                                                            ),
                                                            child: Container(
                                                              width: 100.sw,
                                                              height:     MediaQuery.of(context).size.width>500?
                                                              80.sh:
                                                              MediaQuery.of(context).size.width>900?
                                                              60.sh:
                                                              60.sh,
                                                              child: double_tile_subject_pms(subjectCode: code, subjectTitle: title,),
                                                            ),


                                                          );
                                                        }

                                                        );

                                                      }},
                                                    child:
                                                    Center(
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [
                                                              Expanded(
                                                                child: Center(
                                                                  child: Text('${data['MySubjects'][index]['title']}',textAlign: TextAlign.center, style: TextStyle(
                                                                      fontSize: 4.sw, color: AppConstants().primaryGreen, fontWeight: FontWeight.w700
                                                                  ),),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding:  EdgeInsets.all(1.sw),
                                                            child: Row(
                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                              children: [
                                                                Expanded(
                                                                  child: Text('see details', style: TextStyle(
                                                                      fontSize: 2.sw,
                                                                      fontStyle: FontStyle.italic,
                                                                      color: AppConstants().primaryGreen, fontWeight: FontWeight.w500
                                                                  ),),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    )

                                                ),
                                              ))

                                          ),
                                        );
                                    },
                                  ),
                                );
                              }
                            }

                        ),
                      ],

                    )
                  ]);
          }
      );


  }

}







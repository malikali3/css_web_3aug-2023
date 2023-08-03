import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_css_web/showing_css_subjects/punjabi_poets_list.dart';
import 'package:new_css_web/showing_css_subjects/years_as_dialog.dart';
import 'package:new_css_web/widgets/empty_widget.dart';
import 'package:new_css_web/widgets/size_variables.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../home_screen_flow/random_mcq_setlist.dart';



class mcq_tiles_option extends StatelessWidget {
  String subjectTitle;
  String subjectCode;


  mcq_tiles_option({required this.subjectTitle, required this.subjectCode,}) ;

  @override
  Widget build(BuildContext context)  {


    return
      ResponsiveBuilder(
        builder: (context, sizingInformation)  {

          final User? user = FirebaseAuth.instance.currentUser;
          final id = user?.uid;
          Stream stream1 = FirebaseFirestore.instance
              .collection('users_basic_data')
              .doc(id!)
              .collection('css_subjects_bool').doc(id!)
              .snapshots();

          return
            StreamBuilder(
                stream: stream1,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');}
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text('Loading...');}
                  if (!snapshot.hasData || !snapshot.data!.exists) {
                    return Text('Document does not exist');}


                  return
                    Material(
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:  EdgeInsets.all(4.sw),
                              child: InkWell(
                                onTap:
                                    (){
                                  showDialog(context: context, builder: (BuildContext context){
                                    return Dialog(
                                      child: Container(
                                        width: 100.sw,
                                        height: MediaQuery.of(context).size.width>500?
                                        80.sh:
                                        MediaQuery.of(context).size.width>900?
                                        60.sh:
                                        60.sh,
                                        child: years_as_dialog(subjectCode: subjectCode, subjectTitle: subjectTitle,),),);});
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
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text("MCQs from Past Papers",textAlign: TextAlign.center, style: TextStyle(color: AppConstants().primaryGreen, fontSize: 3.sw,
                                            fontWeight:FontWeight.w600 ),),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Icon(Icons.info_outlined, size: 2.sw, ),
                                            Expanded(
                                              child: Text("MCQs from past papers that you can read only", textAlign: TextAlign.center, style: TextStyle(color: AppConstants().primaryGreen, fontSize: 1.5.sw,
                                                  fontWeight:FontWeight.w600 ),),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:  EdgeInsets.all(4.sw),
                              child: InkWell(
                                onTap:
                                    (){
                                  showDialog(context: context, builder: (BuildContext context){
                                    return Dialog(
                                      child: Container(
                                        width: 100.sw,
                                        height:     MediaQuery.of(context).size.width>500?
                                        80.sh:
                                        MediaQuery.of(context).size.width>900?
                                        60.sh:
                                        60.sh,
                                        child: years_as_dialog(subjectCode: subjectCode, subjectTitle: subjectTitle,),),);});
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
                                    child: Text("Practice  MCQs\n(not from past papers)",textAlign: TextAlign.center, style: TextStyle(color: AppConstants().primaryGreen, fontSize: 3.sw,
                                        fontWeight:FontWeight.w600 ),),
                                  ),
                                ),
                              ),
                            ),
                          ],),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:  EdgeInsets.all(4.sw),
                              child: InkWell(
                                onTap:
                                    (){
                                  showDialog(context: context, builder: (BuildContext context){
                                    return Dialog(
                                      child: Container(
                                        width: 100.sw,
                                        height:     MediaQuery.of(context).size.width>500?
                                        80.sh:
                                        MediaQuery.of(context).size.width>900?
                                        60.sh:
                                        60.sh,
                                        child: setList(subjectCode: subjectCode, subjectTitle: subjectTitle,),),);});
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
                                    child: Text("Random MCQs\n(not from past papers)",textAlign: TextAlign.center, style: TextStyle(color: AppConstants().primaryGreen, fontSize: 3.sw,
                                        fontWeight:FontWeight.w600 ),),
                                  ),
                                ),
                              ),
                            ),
                            subjectCode == "Punjabi"?
                            Padding(
                              padding:  EdgeInsets.all(4.sw),
                              child: InkWell(
                                onTap:
                                    (){
                                  showDialog(context: context, builder: (BuildContext context){
                                    return Dialog(
                                      child: Container(
                                        width: 100.sw,
                                        height:     MediaQuery.of(context).size.width>500?
                                        80.sh:
                                        MediaQuery.of(context).size.width>900?
                                        60.sh:
                                        60.sh,
                                        child: punjabi_poets_list(subjectCode: subjectCode, subjectTitle: subjectTitle,),),);});
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
                                    child: Text('Famous Poet', style: TextStyle(color: AppConstants().primaryGreen, fontSize: 3.sw,
                                        fontWeight:FontWeight.w600 ),),
                                  ),
                                ),
                              ),
                            )
                                : empty_widget(),
                          ],),


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
                    );
                }
            );
        },
      );
  }
}


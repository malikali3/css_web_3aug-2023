import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_css_web/showing_css_subjects/pdf_file_syallabus_for_css_subjects.dart';
import 'package:new_css_web/showing_css_subjects/years_as_dialog.dart';
import 'package:new_css_web/widgets/empty_widget.dart';
import 'package:new_css_web/widgets/size_variables.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../widgets/getX_class.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'mcq_options.dart';



class double_tile_subject extends StatelessWidget {
  String subjectTitle;
  String subjectCode;


  double_tile_subject({required this.subjectTitle, required this.subjectCode,}) ;

  @override
  Widget build(BuildContext context)  {


    String subjectI = '$subjectTitle-I';
    String subjectII = '$subjectTitle-II';
    String subjectCodeI = '$subjectCode-I';
    String subjectCodeII = '$subjectCode-II';


    return
      ResponsiveBuilder(
        builder: (context, sizingInformation)  {
          final User? user = FirebaseAuth.instance.currentUser;
          final id = user?.uid;
          final FirebaseFirestore _db = FirebaseFirestore.instance;
          Stream stream1 = FirebaseFirestore.instance
              .collection('users_basic_data')
              .doc(id!)
              .collection('css_subjects_bool').doc(id!)
              .snapshots();


          Services services1 =Get.find();


          return
          Scaffold(

          body:
           StreamBuilder(
                  stream: stream1,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');}
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: Text('Loading...'));}
                    if (!snapshot.hasData || !snapshot.data!.exists) {
                      return Text('Document does not exist');}


                    return
                    Center(
                      child: Column(
                        children: [

                      Padding(
                        padding:  EdgeInsets.all(4.sw),
                        child:
                            InkWell(
                              onTap:
                                  (){

                                     services1.isMCQ.value?
                                    {

                                    showDialog(context: context, builder: (BuildContext context){
                                    return Dialog(
                                    child: Container(
                                    child: mcq_tiles_option(subjectTitle: subjectI, subjectCode: subjectCodeI,),),);})
                                    }

                              :  showDialog(context: context, builder: (BuildContext context){
                                  return
                                      Dialog(
                                      child: Container(
                                        width: 100.sw,
                                        height:     MediaQuery.of(context).size.width>500?
                                        80.sh:
                                        MediaQuery.of(context).size.width>900?
                                        60.sh:
                                        60.sh,
                                        child: years_as_dialog(subjectCode: subjectCodeI, subjectTitle: subjectI,),),);
                                  },
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
                          ),
                      ),
                        Padding(
                          padding:  EdgeInsets.all(4.sw),
                          child: InkWell(
                            onTap:
                                (){
                                  services1.isMCQ.value?
                                  {
                                    showDialog(context: context, builder: (BuildContext context){
                                      return Dialog(
                                        child: Container(
                                          child: mcq_tiles_option(subjectTitle: subjectII, subjectCode: subjectCodeII,),),);})
                                  }
                              :showDialog(context: context, builder: (BuildContext context){
                                return Dialog(
                                  child: Container(
                                    width: 100.sw,
                                    height:     MediaQuery.of(context).size.width>500?
                                    80.sh:
                                    MediaQuery.of(context).size.width>900?
                                    60.sh:
                                    60.sh,
                                    child: years_as_dialog(subjectCode: subjectCodeII, subjectTitle: subjectII,),),);});
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
                          ),
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
                    );

                  }
              ),

          );






        },
      );

  }
}


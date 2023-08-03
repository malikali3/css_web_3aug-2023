import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:new_css_web/home_screen_flow/past_subjective_paper_route.dart';
import 'package:new_css_web/home_screen_flow/home.dart';
import 'package:new_css_web/showing_css_subjects/mcq_options.dart';
import 'package:new_css_web/showing_css_subjects/punjabi_poets_pdf.dart';
import '../widgets/getX_class.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:new_css_web/widgets/size_variables.dart';
import 'package:new_css_web/widgets/size_variables.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import 'css_mcq.dart';
import 'mcq_pdf_sindhi&punjabi.dart';


class punjabi_poets_list extends StatefulWidget {
  final String subjectCode;
  final String subjectTitle;

  const punjabi_poets_list({super.key, required this.subjectCode, required this.subjectTitle, });

  @override
  State<punjabi_poets_list> createState() => _punjabi_poets_listState();}

final isDialOpen = ValueNotifier(false);
class _punjabi_poets_listState extends State<punjabi_poets_list> {
  final Uri apprays = Uri.parse('https://www.apprays.io/');
  Services services1 =Get.find();


  @override

  Widget build(BuildContext context)  {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


    return
      ResponsiveBuilder(
          builder: (context, sizingInformation) {

            var yearsRef;
            yearsRef =
            FirebaseDatabase.instance
                .ref()
                .child("random_mcq/${widget.subjectCode}/FamousPoets");

            return Scaffold(
              key: _scaffoldKey,
              body: Column(
                children: [
                  Expanded(
                    child: Center(child: Text(widget.subjectTitle, style: TextStyle(
                        color:  AppConstants().primaryGreen,
                        fontSize: 5.sw,
                        fontWeight: FontWeight.w500
                    ),)),
                  ),
                  Expanded(
                    child: Center(
                      child: StreamBuilder(
                          stream: yearsRef.onValue,
                          //here AsyncSnapshot will remove the .snapshot error
                          builder: (context, AsyncSnapshot snapshot){
                            if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');}

                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return Text('Loading...');}
                            if (!snapshot.hasData || snapshot.data == null ||snapshot.data.snapshot.value == null) {
                              return Text('No data available');
                            }
                            var documents = snapshot.data.snapshot.value;
                            var keys = documents.keys;
                            List yearsList = [];
                            for (var key in keys) {
                              var data = documents[key];
                              print("data1: $data");
                              yearsList.add((key));
                              yearsList.sort();
                              yearsList = yearsList.reversed.toList();
                            }
                            print("documents: $keys");
                            print('year list: $yearsList');
                            return
                              GridView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: yearsList == null ? 0 : yearsList.length,
                                gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount:
                                  MediaQuery.of(context).size.width>500?
                                  3: 2,
                                  childAspectRatio: 2,
                                ),
                                itemBuilder: (context, i){
                                  return
                                    InkWell (
                                        onTap: (){

                                          showDialog(
                                            //barrierDismissible: false,
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
                                                child: punjabi_poets_pdf(
                                                  subjectCode: widget.subjectCode,subjectTitle: widget.subjectTitle, set: yearsList[i],),
                                              ),
                                            );
                                          });
                                        },
                                        child: Center(child: Text(yearsList[i],
                                          style: TextStyle(
                                              color:  AppConstants().primaryGreen,
                                              fontSize: 3.5.sw,
                                              fontWeight: FontWeight.w700
                                          ),
                                        ))
                                    );},
                              );
                          }
                      ),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top:

                    MediaQuery.of(context).size.width>500?
                    5.sh:
                    MediaQuery.of(context).size.width>900?
                    2.sh:
                    3.sh,
                      bottom:  MediaQuery.of(context).size.width>500?
                      10.sh:
                      MediaQuery.of(context).size.width>900?
                      6.sh:
                      10.sh, ),
                    child: ElevatedButton(onPressed: (){Navigator.pop(context);},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppConstants().lightGreen,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.sw),
                          ),
                        ),

                        child: Text('back')),
                  )                ],
              ),

            );
          }
      );
  }

}

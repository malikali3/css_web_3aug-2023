import 'package:flutter/material.dart';
import '../widgets/getX_class.dart';
import 'package:get/get.dart';
import '../widgets/size_variables.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:responsive_builder/responsive_builder.dart';


class searchSubjects extends StatelessWidget {
  final String subjectTitle;
  final String subjectMarks;
  final String subjectCode;
  searchSubjects({required this.subjectTitle, required this.subjectMarks, required this.subjectCode});

  Services services1 =Get.find();

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;
    final id = user?.uid;
    final FirebaseFirestore _db = FirebaseFirestore.instance;


    Stream stream1 =
    services1.isCss.value?
    FirebaseFirestore.instance
        .collection('users_basic_data')
        .doc(id!)
        .collection('css_subjects_bool').doc(id!)
        .snapshots()
    : FirebaseFirestore.instance
        .collection('users_basic_data')
        .doc(id!)
        .collection('pms_subjects_bool').doc(id!)
        .snapshots();

    String cssOrpms = services1.isCss.value?'my_css_subjects':'my_pms_subjects';
    String boolCssOrPms=services1.isCss.value?'css_subjects_bool':'pms_subjects_bool';
    String marksCssOrPms=services1.isCss.value?'css_subjects_marks':'pms_subjects_marks';



    List<Map<String, dynamic>> addOrRemove = [
      {
        'title': subjectTitle,
        'code': subjectCode,
      },
    ];

    return
    Scaffold(

      body:  ResponsiveBuilder(
            builder: (context, sizingInformation) {
              return
                StreamBuilder(
                    stream: stream1,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');}
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: Text('Loading...'));}
                      if (!snapshot.hasData || !snapshot.data!.exists) {
                        return Text('Document does not exist');}

                      bool data = snapshot.data!.get(subjectCode);

                      return
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width:
                          MediaQuery.of(context).size.width>1170?
                          40.sw:
                          MediaQuery.of(context).size.width>950?
                          40.sw:
                          MediaQuery.of(context).size.width>560?
                          35.sw:
                          MediaQuery.of(context).size.width>380?
                          35.sh
                              :40.sh,
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
                                decoration: BoxDecoration(
                                    color:  AppConstants().primaryWhite,
                                    borderRadius: BorderRadius.circular(4.sw),
                                    border: Border.all(
                                      color:  AppConstants().primaryGreen,
                                      width: 0.5.sw,)
                                ),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        flex:1,
                                        child: Padding(
                                          padding:  EdgeInsets.only(top:2.sw,left: 7.sw,right: 7.sw,),
                                          child: Container(
                                            // width:
                                            // sizingInformation.deviceScreenType == DeviceScreenType.tablet?
                                            // 15.sw:
                                            //     20.sw,
                                            // height: 10.sh,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black.withOpacity(0.2),
                                                    spreadRadius: 4,
                                                    blurRadius: 10,
                                                    offset: Offset(5, 10),
                                                  )
                                                ]),
                                            child:
                                            data?
                                            ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:  AppConstants().lightGrey,
                                                  side: BorderSide(
                                                    width: 0.04.sw,
                                                    color:  AppConstants().primaryWhite,
                                                  ),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(4.sw,),
                                                  ),// Background color
                                                ),
                                                onPressed: () {

                                                  _db.collection('users_basic_data').doc('$id').collection(cssOrpms).doc('$id').
                                                  update({
                                                    'MySubjects': FieldValue.arrayUnion(addOrRemove),
                                                  });
                                                  _db.collection('users_basic_data').doc('$id').collection(boolCssOrPms).doc('$id').
                                                  update({
                                                    subjectCode: false,
                                                  });
                                                  _db.collection('users_basic_data').doc('$id').collection(marksCssOrPms).doc('$id').
                                                  update({
                                                    subjectTitle: int.parse(subjectMarks),
                                                  });
                                                },
                                                child:
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Icon(Icons.add_circle_outline_outlined, size: 4.sw, color:  AppConstants().lightGreen,),
                                                    Text('Add', style: TextStyle(fontSize: 3.sw, color:  AppConstants().primaryWhite),),
                                                  ],
                                                )
                                            ):
                                            ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:  AppConstants().lightGrey,
                                                  side: BorderSide(
                                                    width: 0.04.sw,
                                                    color:  AppConstants().primaryWhite,
                                                  ),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(4.sw),

                                                  ),// Background color
                                                ),
                                                onPressed: () {

                                                  _db.collection('users_basic_data').doc('$id').collection(cssOrpms).doc('$id').
                                                  update({
                                                    'MySubjects': FieldValue.arrayRemove(addOrRemove),
                                                  });
                                                  _db.collection('users_basic_data').doc('$id').collection(boolCssOrPms).doc('$id').
                                                  update({
                                                    subjectCode: true,
                                                  });
                                                  _db.collection('users_basic_data').doc('$id').collection(marksCssOrPms).doc('$id').
                                                  update({
                                                    subjectTitle: FieldValue.delete(),
                                                  });
                                                },
                                                child:
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Icon(Icons.remove_circle_outline, size: 4.sw, color: Colors.red,),
                                                  ],
                                                )
                                            ),
                                          ),
                                        ),
                                      ),

                                      Expanded(
                                        flex: 2,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Center(
                                                child: Text('$subjectTitle', style: TextStyle(
                                                    color:  AppConstants().primaryGreen, fontSize: 3.sw, fontWeight: FontWeight.w700,height:1
                                                ),),
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
                                              color:  AppConstants().primaryGreen, fontSize: 3.sw, fontWeight: FontWeight.w700,
                                            ),),
                                          ],
                                        ),
                                      ),

                                    ]),
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
                              )
                            ],
                          ),
                        );
                    }
                );
            })
    );




  }
}









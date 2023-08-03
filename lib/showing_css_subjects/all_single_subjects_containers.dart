import 'package:flutter/material.dart';
import '../widgets/getX_class.dart';
import 'package:get/get.dart';
import '../widgets/size_variables.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:responsive_builder/responsive_builder.dart';


class singleTileSubjectsCSS extends StatelessWidget {
  final String subjectTitle;
  final String subjectMarks;
  final String subjectCode;
  singleTileSubjectsCSS({required this.subjectTitle, required this.subjectMarks, required this.subjectCode});

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;
    final id = user?.uid;
    final FirebaseFirestore _db = FirebaseFirestore.instance;
    Stream stream1 = FirebaseFirestore.instance
        .collection('users_basic_data')
        .doc(id!)
        .collection('css_subjects_bool').doc(id!)
        .snapshots();
    List<Map<String, dynamic>> addOrRemove = [
      {
        'title': subjectTitle,
        'code': subjectCode,
      },
    ];

    return
      ResponsiveBuilder(
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
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
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

                                              _db.collection('users_basic_data').doc('$id').collection('my_css_subjects').doc('$id').
                                              update({
                                                'MySubjects': FieldValue.arrayUnion(addOrRemove),
                                              });
                                              _db.collection('users_basic_data').doc('$id').collection('css_subjects_bool').doc('$id').
                                              update({
                                                subjectCode: false,
                                              });
                                              _db.collection('users_basic_data').doc('$id').collection('css_subjects_marks').doc('$id').
                                              update({
                                                subjectTitle: int.parse(subjectMarks),
                                              });
                                            },
                                            child:
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Icon(Icons.add_circle_outline_outlined, size: 4.sw, color:  AppConstants().lightGreen,),
                                                Text('Add', style: TextStyle(fontSize: 2.sw, color:  AppConstants().primaryWhite),),
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

                                              _db.collection('users_basic_data').doc('$id').collection('my_css_subjects').doc('$id').
                                              update({
                                                'MySubjects': FieldValue.arrayRemove(addOrRemove),
                                              });
                                              _db.collection('users_basic_data').doc('$id').collection('css_subjects_bool').doc('$id').
                                              update({
                                                subjectCode: true,
                                              });
                                              _db.collection('users_basic_data').doc('$id').collection('css_subjects_marks').doc('$id').
                                              update({
                                                subjectTitle: FieldValue.delete(),
                                              });
                                            },
                                            child:
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Icon(Icons.delete_forever_outlined, size: 3.sh, color: Colors.red,),
                                                Text('remove', style: TextStyle(fontSize: 3.sw, color:  AppConstants().primaryWhite),),

                                              ],
                                            )
                                        ),
                                      ),
                                    ],
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
                                          child: Text('$subjectTitle', textAlign: TextAlign.center, style: TextStyle(
                                              color:  AppConstants().primaryGreen, fontSize: 4.sw, fontWeight: FontWeight.w700,height:1
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
                                        color:  AppConstants().primaryGreen, fontSize: 4.sw, fontWeight: FontWeight.w700,
                                      ),),
                                    ],
                                  ),
                                ),


                              ]),
                        ),
                      );
                  }
              );
          });



  }
}









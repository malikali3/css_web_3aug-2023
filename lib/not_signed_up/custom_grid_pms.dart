import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:new_css_web/not_signed_up/show_css_tiles.dart';
import 'package:new_css_web/not_signed_up/tripple_tile_not_user.dart';
import 'package:new_css_web/widgets/empty_widget.dart';
import '../pms subjects/pdf_file_syallabus_for_pms_subjects.dart';
import '../pms subjects/years_as_dialog_pms.dart';
import '../showing_css_subjects/double_tile_subject.dart';
import '../showing_css_subjects/pdf_file_syallabus_for_css_subjects.dart';
import '../showing_css_subjects/tripple_tile_subject.dart';
import '../showing_css_subjects/years_as_dialog.dart';
import '../widgets/getX_class.dart';
import '../showing_css_subjects/all_single_subjects_containers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:new_css_web/widgets/size_variables.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'double_tile_not_user.dart';



class custom_grid_pms extends StatefulWidget {
  final String subjectTitle;
  final String subjectCode;
  const custom_grid_pms({super.key, required this.subjectTitle, required this.subjectCode});

  @override
  State<custom_grid_pms> createState() => _custom_grid_pmsState();

}

final isDialOpen = ValueNotifier(false);
class _custom_grid_pmsState extends State<custom_grid_pms> {




  @override

  Widget build(BuildContext context)  {


    return
      Scaffold(
        body: ResponsiveBuilder(
            builder: (context, sizingInformation) {

              final Map<String, List<String>> subjectsMap = {
                'Eng': ['Syllabus', 'Past Subjective Exams'],
                'EE': ['Syllabus', 'Past Subjective Exams'],
                'Urdu': ['Syllabus', 'Past Subjective Exams'],
                'IS': ['Syllabus', 'Past Subjective Exams', 'Past MCQ Exams'],
                'Ethics': ['Syllabus', 'Past Subjective Exams'],
                'PakS': ['Syllabus', 'Past Subjective Exams', 'Pakistan PM List'],
                'GK': ['Syllabus', 'Past Subjective Exams','Practice MCQ'],
                'Economics-I': ['Syllabus', 'Past Subjective Exams'],
                'Commerce-I': ['Syllabus', 'Past Subjective Exams'],
                'BA-I': ['Syllabus', 'Past Subjective Exams'],
                'PA-I': ['Syllabus', 'Past Subjective Exams'],
                'Agriculture-I': ['Syllabus', 'Past Subjective Exams'],
                'VS-I': ['Syllabus', 'Past Subjective Exams'],
                'Botany-I': ['Syllabus', 'Past Subjective Exams'],
                'Zoology-I': ['Syllabus', 'Past Subjective Exams'],
                'Mathematics-I': ['Syllabus', 'Past Subjective Exams'],
                'CS-I': ['Syllabus', 'Past Subjective Exams'],
                'Statistics-I': ['Syllabus', 'Past Subjective Exams'],
                'PE-I': ['Syllabus', 'Past Subjective Exams'],
                'Physics-I': ['Syllabus', 'Past Subjective Exams'],
                'Chemistry-I': ['Syllabus', 'Past Subjective Exams'],
                'Geology-I': ['Syllabus', 'Past Subjective Exams'],
                'Geography-I': ['Syllabus', 'Past Subjective Exams'],
                'PS-I': ['Syllabus', 'Past Subjective Exams'],
                'History-I': ['Syllabus', 'Past Subjective Exams'],
                'Law-I': ['Syllabus', 'Past Subjective Exams'],
                'MC-I': ['Syllabus', 'Past Subjective Exams'],
                'Philosophy-I': ['Syllabus', 'Past Subjective Exams'],
                'Psychology-I': ['Syllabus', 'Past Subjective Exams'],
                'Sociology-I': ['Syllabus', 'Past Subjective Exams'],
                'SW-I': ['Syllabus', 'Past Subjective Exams'],
                'EL-I': ['Syllabus', 'Past Subjective Exams'],
                'UrduOptional-I': ['Syllabus', 'Past Subjective Exams'],
                'Arabic-I': ['Syllabus', 'Past Subjective Exams'],
                'Education-I': ['Syllabus', 'Past Subjective Exams'],
                'Persian-I': ['Syllabus', 'Past Subjective Exams'],
                'Punjabi-I': ['Syllabus', 'Past Subjective Exams'],
                'Economics-II': ['Syllabus', 'Past Subjective Exams'],
                'Commerce-II': ['Syllabus', 'Past Subjective Exams'],
                'BA-II': ['Syllabus', 'Past Subjective Exams'],
                'PA-II': ['Syllabus', 'Past Subjective Exams'],
                'Agriculture-II': ['Syllabus', 'Past Subjective Exams'],
                'VS-II': ['Syllabus', 'Past Subjective Exams'],
                'Botany-II': ['Syllabus', 'Past Subjective Exams'],
                'Zoology-II': ['Syllabus', 'Past Subjective Exams'],
                'Mathematics-II': ['Syllabus', 'Past Subjective Exams'],
                'CS-II': ['Syllabus', 'Past Subjective Exams'],
                'Statistics-II': ['Syllabus', 'Past Subjective Exams'],
                'PE-II': ['Syllabus', 'Past Subjective Exams'],
                'Physics-II': ['Syllabus', 'Past Subjective Exams'],
                'Chemistry-II': ['Syllabus', 'Past Subjective Exams'],
                'Geology-II': ['Syllabus', 'Past Subjective Exams'],
                'Geography-II': ['Syllabus', 'Past Subjective Exams'],
                'PS-II': ['Syllabus', 'Past Subjective Exams'],
                'History-II': ['Syllabus', 'Past Subjective Exams'],
                'Law-II': ['Syllabus', 'Past Subjective Exams'],
                'MC-II': ['Syllabus', 'Past Subjective Exams'],
                'Philosophy-II': ['Syllabus', 'Past Subjective Exams'],
                'Psychology-II': ['Syllabus', 'Past Subjective Exams'],
                'Sociology-II': ['Syllabus', 'Past Subjective Exams'],
                'SW-II': ['Syllabus', 'Past Subjective Exams'],
                'EL-II': ['Syllabus', 'Past Subjective Exams'],
                'UrduOptional-II': ['Syllabus', 'Past Subjective Exams'],
                'Arabic-II': ['Syllabus', 'Past Subjective Exams'],
                'Education-II': ['Syllabus', 'Past Subjective Exams'],
                'Persian-II': ['Syllabus', 'Past Subjective Exams'],
                'Punjabi-II': ['Syllabus', 'Past Subjective Exams'],
              };



              final List<String> subjectsList = subjectsMap[widget.subjectCode] ?? [];

              return
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(widget.subjectTitle),
                    Text(widget.subjectCode),

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
                        itemCount: subjectsList.length, // Total number of items in the grid
                        itemBuilder: (BuildContext context, int index) {
                          return
                            Container(
                              decoration: BoxDecoration(
                                  color: AppConstants().primaryWhite,
                                  borderRadius: BorderRadius.circular(3.sw),
                                  border: Border.all(
                                    color: AppConstants().primaryGreen,
                                    width: 0.02.sw,)
                              ),
                              child: InkWell(
                                  onTap: (){

                                    subjectsList[index]=='Syllabus'?
                                    {
                                      //services1.isSyllabusClicked(),
                                      Navigator.of(context).push(
                                        PageRouteBuilder(
                                          transitionDuration: const Duration(milliseconds: 500),
                                          pageBuilder: (BuildContext context,
                                              Animation<double> animation,
                                              Animation<double> secondaryAnimation) {
                                            return  pdf_file_syallabus_for_pms_subjects(value: widget.subjectCode,);
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
                                      )}:
                                    subjectsList[index]=='Past Subjective Exams'?

                                    {
                                      //services1.isPastSubjectiveSelected(),

                                      Navigator.of(context).push(
                                        PageRouteBuilder(
                                          transitionDuration: const Duration(milliseconds: 500),
                                          pageBuilder: (BuildContext context,
                                              Animation<double> animation,
                                              Animation<double> secondaryAnimation) {
                                            return  years_as_dialog_pms(subjectCode: widget.subjectCode, subjectTitle: widget.subjectTitle);
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
                                      )}:
                                    empty_widget();

                                  },

                                  child: Text(subjectsList[index])),);

                        },
                      ),
                    ),

                    ElevatedButton(onPressed: (){Navigator.pop(context);},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppConstants().lightGreen,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.sw),
                          ),
                        ),

                        child: Text('back')),



                  ],);}),
      );}}


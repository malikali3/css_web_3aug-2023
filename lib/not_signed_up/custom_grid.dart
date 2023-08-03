import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:new_css_web/not_signed_up/show_css_tiles.dart';
import 'package:new_css_web/not_signed_up/tripple_tile_not_user.dart';
import 'package:new_css_web/widgets/empty_widget.dart';
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



class custom_grid_css extends StatefulWidget {
  final String subjectTitle;
  final String subjectCode;
  const custom_grid_css({super.key, required this.subjectTitle, required this.subjectCode});

  @override
  State<custom_grid_css> createState() => _custom_grid_cssState();

}

final isDialOpen = ValueNotifier(false);
class _custom_grid_cssState extends State<custom_grid_css> {




  @override

  Widget build(BuildContext context)  {


    return
      Scaffold(
        body: ResponsiveBuilder(
            builder: (context, sizingInformation) {

              final Map<String, List<String>> subjectsMap = {
                'EE': ['Syllabus', 'Past Subjective Exams', 'Most Repeated Essays'],
                'EPnC': ['Syllabus', 'Past Subjective Exams', 'Solved Past Papers', 'Books', 'MCQs', 'Idioms', 'Pair of words', 'Corrections'],
                'GSnA': ['Syllabus', 'Past Subjective Exams', 'Solved Past Papers', 'Books', 'MCQs'],
                'CA':['Syllabus', 'Past Subjective Exams', 'Solved Past Papers', 'Books', 'MCQs', 'Most Repeated Questions'],
                'PaA': ['Syllabus', 'Past Subjective Exams', 'Solved Past Papers', 'Books', 'MCQs', 'Most Repeated Questions', 'Pakistan PM List'],
                'IS': ['Islamic Studies (English)','Islamic Studies(Urdu)'],
                'CSoMR': ['Syllabus', 'Past Subjective Exams', 'Books', 'MCQs'],
                'Statistics': ['Syllabus', 'Past Subjective Exams', 'Solved Past Papers', 'Books', 'MCQs'],
                'BA': ['Syllabus', 'Past Subjective Exams', 'Solved Past Papers', 'Books', 'MCQs', 'Most Repeated Questions'],
                'PuA': ['Syllabus', 'Past Subjective Exams', 'Solved Past Papers', 'Books', 'MCQs','Most Repeated Questions'],
                'GnPP': ['Syllabus', 'Past Subjective Exams', 'Solved Past Papers', 'Books', 'MCQs'],
                'TPnUM': ['Syllabus', 'Past Subjective Exams', 'Books', 'MCQs'],
                'HoUS': ['Syllabus', 'Past Subjective Exams', 'Solved Past Papers', 'Books', 'MCQs', 'Most Repeated Question', 'US Presidents List', 'US Supreme Court Cases'],
                'GS': ['Syllabus', 'Past Subjective Exams', 'Solved Past Papers', 'Books', 'MCQs','Notes', 'Most Repeated Questions'],
                'ES': ['Syllabus', 'Past Subjective Exams', 'Solved Past Papers', 'Books', 'MCQs','Most Repeated Questions'],
                'AnF': ['Syllabus', 'Past Subjective Exams', 'Books', 'MCQs'],
                'UL': ['Syllabus', 'Past Subjective Exams', 'Books', 'MCQs'],
                'CL': ['Syllabus', 'Past Subjective Exams','Books', 'MCQs', 'Most Repeated Questions'],
                'IL': ['Syllabus', 'Past Subjective Exams', 'Solved Past Papers','Books', 'MCQs', 'Most Repeated Questions'],
                'MLnJ': ['Syllabus', 'Past Subjective Exams', 'Books', 'MCQs', 'Most Repeated Questions'],
                'ML': ['Syllabus', 'Past Subjective Exams', 'Solved Past Papers', 'Books', 'MCQs'],
                'Criminology': ['Syllabus', 'Past Subjective Exams', 'Solved Past Papers', 'Books', 'MCQs', 'Most Repeated Questions'],
                'JnMC': ['Syllabus', 'Past Subjective Exams', 'Solved Past Papers', 'Books', 'MCQs', 'Most Repeated Questions'],
                'Sociology':['Syllabus', 'Past Subjective Exams', 'Solved Past Papers', 'Books', 'MCQs', 'Notes', 'Most Repeated Questions'],
                'Anthropology': ['Syllabus', 'Past Subjective Exams', 'Books', 'MCQs'],
                'Punjabi': ['Syllabus', 'Past Subjective Exams', 'Solved Past Papers', 'Books', 'MCQs', 'Famous Poets'],
                'Sindhi': ['Syllabus', 'Past Subjective Exams', 'Solved Past Papers', 'Books', 'MCQs'],
                'Pashto': ['Syllabus', 'Past Subjective Exams', 'Solved Past Papers', 'Books', 'MCQs'],
                'Balochi': ['Syllabus', 'Past Subjective Exams', 'Books', 'MCQs'],
                'AnA-I': ['Syllabus', 'Solved Past Papers','Past Subjective Exams', 'Books', 'Past MCQ Exams', 'Practice MCQs', 'MCQ Result Graphics'],
                'Economics-I': ['Syllabus', 'Solved Past Papers','Past Subjective Exams', 'Books', 'Past MCQ Exams', 'Practice MCQs', 'MCQ Result Graphics','Random MCQs','Practice Random MCQs'],
                'PS-I': ['Syllabus', 'Solved Past Papers','Past Subjective Exams', 'Books', 'Past MCQ Exams', 'Practice MCQs', 'MCQ Result Graphics', 'Most Repeated Questions'],
                'Physics-I':['Syllabus','Past Subjective Exams', 'Books', 'Past MCQ Exams', 'Practice MCQs', 'MCQ Result Graphics'],
                'Chemistry-I': ['Syllabus','Past Subjective Exams', 'Books', 'Past MCQ Exams', 'Practice MCQs', 'MCQ Result Graphics'],
                'AnA-II': ['Syllabus', 'Solved Past Papers','Past Subjective Exams', 'Books', 'Past MCQ Exams', 'Practice MCQs', 'MCQ Result Graphics'],
                'Economics-II':['Syllabus', 'Solved Past Papers','Past Subjective Exams', 'Books', 'Past MCQ Exams', 'Practice MCQs', 'MCQ Result Graphics','Random MCQs', 'Practice Random MCQs'],
                'PS-II': ['Syllabus', 'Solved Past Papers','Past Subjective Exams', 'Books', 'Past MCQ Exams', 'Practice MCQs', 'MCQ Result Graphics', 'Most Repeated Questions'],
                'Physics-II':['Syllabus','Past Subjective Exams', 'Books', 'Past MCQ Exams', 'Practice MCQs', 'MCQ Result Graphics'],
                'Chemistry-II': ['Syllabus','Past Subjective Exams', 'Books', 'Past MCQ Exams', 'Practice MCQs', 'MCQ Result Graphics'],
                'IR': ['Syllabus', 'Solved Past Papers','Past Subjective Exams', 'Books', 'Past MCQ Exams', 'Practice MCQs', 'MCQ Result Graphics'],
                'CS': ['Syllabus','Past Subjective Exams', 'Books', 'Past MCQ Exams', 'Practice MCQs', 'MCQ Result Graphics'],
                'Geology': ['Syllabus', 'Past Subjective Exams', 'Books', 'Past MCQ Exams', 'Practice MCQs', 'MCQ Result Graphics'],
                'AM': ['Syllabus','Past Subjective Exams', 'Books'],
                'PM': ['Syllabus','Past Subjective Exams', 'Books'],
                'EH': ['Syllabus','Past Subjective Exams','Solved Past Papers', 'Books', 'Past MCQ Exams', 'Practice MCQs', 'MCQ Result Graphics','Most Repeated Questions'],
                'BH': ['Syllabus','Solved Past Papers','Past Subjective Exams', 'Books', 'Past MCQ Exams', 'Practice MCQs', 'MCQ Result Graphics'],
                'IHnC': ['Syllabus','Solved Past Papers','Past Subjective Exams', 'Books', 'Past MCQ Exams', 'Practice MCQs', 'MCQ Result Graphics','Most Repeated Questions'],
                'HoPnI':['Syllabus','Solved Past Papers','Past Subjective Exams', 'Books', 'Past MCQ Exams', 'Practice MCQs', 'MCQ Result Graphics','Most Repeated Questions'],
                'Botany': ['Syllabus','Past Subjective Exams', 'Books', 'Past MCQ Exams', 'Practice MCQs', 'MCQ Result Graphics'],
                'Zoology': ['Syllabus','Past Subjective Exams', 'Books', 'Past MCQ Exams', 'Practice MCQs', 'MCQ Result Graphics'],
                'EL': ['Syllabus','Past Subjective Exams', 'Books', 'Past MCQ Exams', 'Practice MCQs', 'MCQ Result Graphics'],
                'Philosophy': ['Syllabus','Solved Past Papers','Past Subjective Exams', 'Books', 'Past MCQ Exams', 'Practice MCQs', 'MCQ Result Graphics','Random MCQs', 'Practice Random MCQs', 'Most Repeated Questions'],
                'Law': ['Syllabus','Past Subjective Exams', 'Books', 'Past MCQ Exams', 'Practice MCQs', 'MCQ Result Graphics'],
                'Psychology': ['Syllabus','Past Subjective Exams', 'Books', 'Past MCQ Exams', 'Practice MCQs', 'MCQ Result Graphics','Most Repeated Questions'],
                'Geography': ['Syllabus','Past Subjective Exams', 'Books', 'Past MCQ Exams', 'Practice MCQs', 'MCQ Result Graphics','Most Repeated Questions'],
                'Persian': ['Syllabus','Past Subjective Exams', 'Books', 'Past MCQ Exams', 'Practice MCQs', 'MCQ Result Graphics'],
                'Arabic': ['Syllabus','Past Subjective Exams', 'Books', 'Past MCQ Exams', 'Practice MCQs', 'MCQ Result Graphics'],
                'IR-I': ['Syllabus', 'Solved Past Papers','Past Subjective Exams', 'Books', 'Past MCQ Exams', 'Practice MCQs', 'MCQ Result Graphics'],
                'CS-I': ['Syllabus','Past Subjective Exams', 'Books', 'Past MCQ Exams', 'Practice MCQs', 'MCQ Result Graphics'],
                'Geology-I': ['Syllabus', 'Past Subjective Exams', 'Books', 'Past MCQ Exams', 'Practice MCQs', 'MCQ Result Graphics'],
                'AM-I':['Syllabus','Past Subjective Exams', 'Books'],
                'PM-I': ['Syllabus','Past Subjective Exams', 'Books'],
                'EH-I': ['Syllabus','Past Subjective Exams','Solved Past Papers', 'Books', 'Past MCQ Exams', 'Practice MCQs', 'MCQ Result Graphics','Most Repeated Questions'],
                'BH-I': ['Syllabus','Solved Past Papers','Past Subjective Exams', 'Books', 'Past MCQ Exams', 'Practice MCQs', 'MCQ Result Graphics'],
                'IHnC-I':['Syllabus','Solved Past Papers','Past Subjective Exams', 'Books', 'Past MCQ Exams', 'Practice MCQs', 'MCQ Result Graphics','Most Repeated Questions'],
                'HoPnI-I': ['Syllabus','Solved Past Papers','Past Subjective Exams', 'Books', 'Past MCQ Exams', 'Practice MCQs', 'MCQ Result Graphics','Most Repeated Questions'],
                'Botany-I': ['Syllabus','Past Subjective Exams', 'Books', 'Past MCQ Exams', 'Practice MCQs', 'MCQ Result Graphics'],
                'Zoology-I':['Syllabus','Past Subjective Exams', 'Books', 'Past MCQ Exams', 'Practice MCQs', 'MCQ Result Graphics'],
                'EL-I': ['Syllabus','Past Subjective Exams', 'Books', 'Past MCQ Exams', 'Practice MCQs', 'MCQ Result Graphics'],
                'Philosophy-I': ['Syllabus','Solved Past Papers','Past Subjective Exams', 'Books', 'Past MCQ Exams', 'Practice MCQs', 'MCQ Result Graphics','Random MCQs', 'Practice Random MCQs', 'Most Repeated Questions'],
                'Law-I': ['Syllabus','Past Subjective Exams', 'Books', 'Past MCQ Exams', 'Practice MCQs', 'MCQ Result Graphics'],
                'Psychology-I':['Syllabus','Past Subjective Exams', 'Books', 'Past MCQ Exams', 'Practice MCQs', 'MCQ Result Graphics','Most Repeated Questions'],
                'Geography-I':['Syllabus','Past Subjective Exams', 'Books', 'Past MCQ Exams', 'Practice MCQs', 'MCQ Result Graphics','Most Repeated Questions'],
                'Persian-I': ['Syllabus','Past Subjective Exams', 'Books', 'Past MCQ Exams', 'Practice MCQs', 'MCQ Result Graphics'],
                'Arabic-I':['Syllabus','Past Subjective Exams', 'Books', 'Past MCQ Exams', 'Practice MCQs', 'MCQ Result Graphics'],
                'IR-II':['Syllabus', 'Solved Past Papers','Past Subjective Exams', 'Books', 'Past MCQ Exams', 'Practice MCQs', 'MCQ Result Graphics'],
                'CS-II':['Syllabus','Past Subjective Exams', 'Books', 'Past MCQ Exams', 'Practice MCQs', 'MCQ Result Graphics'],
                'Geology-II':['Syllabus', 'Past Subjective Exams', 'Books', 'Past MCQ Exams', 'Practice MCQs', 'MCQ Result Graphics'],
                'AM-II':['Syllabus','Past Subjective Exams', 'Books'],
                'PM-II':['Syllabus','Past Subjective Exams', 'Books'],
                'EH-II':['Syllabus','Past Subjective Exams','Solved Past Papers', 'Books', 'Past MCQ Exams', 'Practice MCQs', 'MCQ Result Graphics','Most Repeated Questions'],
                'BH-II':['Syllabus','Solved Past Papers','Past Subjective Exams', 'Books', 'Past MCQ Exams', 'Practice MCQs', 'MCQ Result Graphics'],
                'IHnC-II':['Syllabus','Solved Past Papers','Past Subjective Exams', 'Books', 'Past MCQ Exams', 'Practice MCQs', 'MCQ Result Graphics','Most Repeated Questions'],
                'HoPnI-II':['Syllabus','Solved Past Papers','Past Subjective Exams', 'Books', 'Past MCQ Exams', 'Practice MCQs', 'MCQ Result Graphics','Most Repeated Questions'],
                'Botany-II':['Syllabus','Past Subjective Exams', 'Books', 'Past MCQ Exams', 'Practice MCQs', 'MCQ Result Graphics'],
                'Zoology-II':['Syllabus','Past Subjective Exams', 'Books', 'Past MCQ Exams', 'Practice MCQs', 'MCQ Result Graphics'],
                'EL-II':['Syllabus','Past Subjective Exams', 'Books', 'Past MCQ Exams', 'Practice MCQs', 'MCQ Result Graphics'],
                'Philosophy-II':['Syllabus','Solved Past Papers','Past Subjective Exams', 'Books', 'Past MCQ Exams', 'Practice MCQs', 'MCQ Result Graphics','Random MCQs', 'Practice Random MCQs', 'Most Repeated Questions'],
                'Law-II': ['Syllabus','Past Subjective Exams', 'Books', 'Past MCQ Exams', 'Practice MCQs', 'MCQ Result Graphics'],
                'Psychology-II': ['Syllabus','Past Subjective Exams', 'Books', 'Past MCQ Exams', 'Practice MCQs', 'MCQ Result Graphics','Most Repeated Questions'],
                'Geography-II': ['Syllabus','Past Subjective Exams', 'Books', 'Past MCQ Exams', 'Practice MCQs', 'MCQ Result Graphics','Most Repeated Questions'],
                'Persian-II': ['Syllabus','Past Subjective Exams', 'Books', 'Past MCQ Exams', 'Practice MCQs', 'MCQ Result Graphics'],
                'Arabic-II':['Syllabus','Past Subjective Exams', 'Books', 'Past MCQ Exams', 'Practice MCQs', 'MCQ Result Graphics'],
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
                                        return  pdf_file_syallabus_for_css_subjects(value: widget.subjectCode,);
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
                                return  years_as_dialog(subjectCode: widget.subjectCode, subjectTitle: widget.subjectTitle);
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


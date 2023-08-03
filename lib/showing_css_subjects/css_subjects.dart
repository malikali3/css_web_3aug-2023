import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../widgets/getX_class.dart';
import '../showing_css_subjects/all_single_subjects_containers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:new_css_web/widgets/size_variables.dart';
import 'package:responsive_builder/responsive_builder.dart';



class css_subjects extends StatefulWidget {
  const css_subjects({super.key});

  @override
  State<css_subjects> createState() => _css_subjectsState();

}

final isDialOpen = ValueNotifier(false);
class _css_subjectsState extends State<css_subjects> {

  @override

  Widget build(BuildContext context)  {


    return
      ResponsiveBuilder(
          builder: (context, sizingInformation) {


            final List compulsory = [
              {'title':'English Essay', 'marks': 100, 'code': 'EE'},
              {'title':'English Precis', 'marks': 100, 'code': 'EPnC'},
              {'title':'General Science', 'marks': 100,'code': 'GSnA'},
              {'title':'Current Affairs', 'marks': 100,'code': 'CA'},
              {'title':'Pakistan Affairs', 'marks': 100,'code': 'PaA'},
              {'title':'Islamic Studies', 'marks': 100,'code': 'IS'},
              {'title':'Comparative study of Religions','marks': 100,'code': 'CSoMR'},
            ];
            final List og1=[
              {'title':'Accountancy & Auditing', 'marks':200, 'code': 'AnA'},
              {'title':'Economics',  'marks':200,'code': 'Economics'},
              {'title':'Computer Science', 'marks':200,'code': 'CS'},
              {'title':'Political Science', 'marks':200,'code': 'PS'},
              {'title':'International Relations',  'marks':200,'code': 'IR'},
            ];
            final List og2= [
              {'title':'Physics','marks':200,'code': 'Physics'},
              {'title':'Chemistry','marks':200,'code': 'Chemistry'},
              {'title':'Applied Maths','marks':100,'code': 'AM'},
              {'title':'Pure Maths','marks':100,'code': 'PM'},
              {'title':'Statistics','marks':100,'code': 'Statistics'},
              {'title':'Geology','marks':100,'code': 'Geology'},
            ];
            final List og3 =[
              {'title':'Business Administration','marks':100, 'code': 'BA'},
              {'title':'Public Administration','marks':100,'code': 'PuA'},
              {'title':'Governance & Public Policies','marks':100, 'code': 'GnPP'},
              {'title':'Town Planning & Urban Management','marks':100,'code': 'TPnUM'},
            ];
            final List og4 = [
              {'title':'History of Pakistan & India', 'marks':100,'code': 'HoPnI'},
              {'title':'Islamic History and Culture',  'marks':100,'code': 'IHnC'},
              {'title':'British History',  'marks':100,'code': 'BH'},
              {'title':'European History',  'marks':100,'code': 'EH'},
              {'title':'History of USA', 'marks':100,'code': 'HoUS'},
            ];
            final List og5 = [
              {'title':'Gender Studies',  'marks':100,'code': 'GS'},
              {'title':'Environmental Sciences', 'marks':100,'code': 'ES'},
              {'title':'Agriculture & Forestry','marks':100,'code': 'AnF'},
              {'title':'Botany', 'marks':100,'code': 'Botany'},
              {'title':'Zoology', 'marks':100,'code': 'Zoology'},
              {'title':'English Literature','marks':100,'code': 'EL'},
              {'title':'Urdu Literature','marks':100,'code': 'UL'},
            ];
            final List og6=[
              {'title':'Law','marks':100,'code': 'Law'},
              {'title':'Constitutional Law', 'marks':100,'code': 'CL'},
              {'title':'International Law', 'marks':100,'code': 'IL'},
              {'title':'Muslim Law & Jurisprudence', 'marks':100,'code': 'MLnJ'},
              {'title':'Mercantile Law',  'marks':100,'code': 'ML'},
              {'title':'Criminology',  'marks':100,'code': 'Criminology'},
              {'title':'Philosophy',  'marks':100,'code': 'Philosophy'},
            ];
            final List og7 = [
              {'title':'Journalism & Mass Communication', 'marks':100,'code': 'JnMC'},
              {'title':'Psychology', 'marks':100,'code': 'Psychology'},
              {'title':'Geography',  'marks':100,'code': 'Geography'},
              {'title':'Sociology', 'marks':100,'code': 'Sociology'},
              {'title':'Anthropology', 'marks':100,'code': 'Anthropology'},
              {'title':'Punjabi',  'marks':100,'code': 'Punjabi'},
              {'title':'Sindhi',  'marks':100,'code': 'Sindhi'},
              {'title':'Pashto',  'marks':100,'code': 'Pashto'},
              {'title':'Balochi', 'marks':100,'code': 'Balochi'},
              {'title':'Persian', 'marks':100,'code': 'Persian'},
              {'title':'Arabic',  'marks':100,'code': 'Arabic'},
            ];



            return
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                Text('Compulsory', style: TextStyle(color: AppConstants().primaryGreen, fontSize:3.sh),),
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
                    itemCount: compulsory.length, // Total number of items in the grid
                    itemBuilder: (BuildContext context, int index) {


                      if(index== 0){
                        return singleTileSubjectsCSS(subjectTitle: compulsory[index]['title'], subjectMarks: compulsory[index]['marks'].toString(), subjectCode: compulsory[index]['code'],
                        );
                      };
                      if(index== 1){
                        return singleTileSubjectsCSS(subjectTitle: compulsory[index]["title"], subjectMarks: compulsory[index]['marks'].toString(), subjectCode: compulsory[index]['code'],);
                      };
                      if(index== 2){
                        return singleTileSubjectsCSS(subjectTitle: compulsory[index]["title"], subjectMarks: compulsory[index]['marks'].toString(), subjectCode: compulsory[index]['code'],);
                      };
                      if(index== 3){
                        return singleTileSubjectsCSS(subjectTitle: compulsory[index]["title"], subjectMarks: compulsory[index]['marks'].toString(), subjectCode: compulsory[index]['code'],);
                      };
                      if(index== 4){
                        return singleTileSubjectsCSS(subjectTitle: compulsory[index]["title"], subjectMarks: compulsory[index]['marks'].toString(), subjectCode: compulsory[index]['code'],);
                      };
                      if(index== 5){
                        return singleTileSubjectsCSS(subjectTitle: compulsory[index]["title"], subjectMarks: compulsory[index]['marks'].toString(), subjectCode: compulsory[index]['code'],);
                      };
                      if(index== 6){
                        return singleTileSubjectsCSS(subjectTitle: compulsory[index]["title"], subjectMarks: compulsory[index]['marks'].toString(), subjectCode: compulsory[index]['code'],);
                      };

                    },
                  ),
                ),
                SizedBox(height: 5.sh,),

                Text('Optional Group-I',style: TextStyle(color: AppConstants().primaryGreen, fontSize: 3.sh),),
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
                    itemCount: og1.length, // Total number of items in the grid
                    itemBuilder: (BuildContext context, int index) {
                      if(index== 0){
                        return singleTileSubjectsCSS(subjectTitle: og1[index]['title'], subjectMarks: og1[index]['marks'].toString(), subjectCode: og1[index]['code'],);
                      };
                      if(index== 1){
                        return singleTileSubjectsCSS(subjectTitle: og1[index]["title"], subjectMarks: og1[index]['marks'].toString(), subjectCode: og1[index]['code'],);
                      };
                      if(index== 2){
                        return singleTileSubjectsCSS(subjectTitle: og1[index]["title"], subjectMarks: og1[index]['marks'].toString(), subjectCode: og1[index]['code'],);
                      };
                      if(index== 3){
                        return singleTileSubjectsCSS(subjectTitle: og1[index]["title"], subjectMarks: og1[index]['marks'].toString(), subjectCode: og1[index]['code'],);
                      };
                      if(index== 4){
                        return singleTileSubjectsCSS(subjectTitle: og1[index]["title"], subjectMarks: og1[index]['marks'].toString(), subjectCode: og1[index]['code'],);
                      };

                    },
                  ),
                ),
                SizedBox(height: 5.sh,),


                Text('Optional Group-II',style: TextStyle(color: AppConstants().primaryGreen, fontSize: 3.sh),),
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
                    itemCount: og2.length, // Total number of items in the grid
                    itemBuilder: (BuildContext context, int index) {

                      if(index== 0){
                        return singleTileSubjectsCSS(subjectTitle: og2[index]['title'], subjectMarks: og2[index]['marks'].toString(), subjectCode: og2[index]['code'],);
                      };
                      if(index== 1){
                        return singleTileSubjectsCSS(subjectTitle: og2[index]["title"], subjectMarks: og2[index]['marks'].toString(), subjectCode: og2[index]['code'],);
                      };
                      if(index== 2){
                        return singleTileSubjectsCSS(subjectTitle: og2[index]["title"], subjectMarks: og2[index]['marks'].toString(), subjectCode: og2[index]['code'],);
                      };
                      if(index== 3){
                        return singleTileSubjectsCSS(subjectTitle: og2[index]["title"], subjectMarks: og2[index]['marks'].toString(), subjectCode: og2[index]['code'],);
                      };
                      if(index== 4){
                        return singleTileSubjectsCSS(subjectTitle: og2[index]["title"], subjectMarks: og2[index]['marks'].toString(), subjectCode: og2[index]['code'],);
                      };
                      if(index== 5){
                        return singleTileSubjectsCSS(subjectTitle: og2[index]["title"], subjectMarks: og2[index]['marks'].toString(), subjectCode: og2[index]['code'],);
                      };

                    },
                  ),
                ),
                SizedBox(height: 5.sh,),


                Text('Optional Group-III',style: TextStyle(color: AppConstants().primaryGreen, fontSize: 3.sh),),
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
                    itemCount: og3.length, // Total number of items in the grid
                    itemBuilder: (BuildContext context, int index) {
                      if(index== 0){
                        return singleTileSubjectsCSS(subjectTitle: og3[index]['title'], subjectMarks: og3[index]['marks'].toString(), subjectCode: og3[index]['code'],);
                      };
                      if(index== 1){
                        return singleTileSubjectsCSS(subjectTitle: og3[index]["title"], subjectMarks: og3[index]['marks'].toString(), subjectCode: og3[index]['code'],);
                      };
                      if(index== 2){
                        return singleTileSubjectsCSS(subjectTitle: og3[index]["title"], subjectMarks: og3[index]['marks'].toString(), subjectCode: og3[index]['code'],);
                      };
                      if(index== 3){
                        return singleTileSubjectsCSS(subjectTitle: og3[index]["title"], subjectMarks: og3[index]['marks'].toString(), subjectCode: og3[index]['code'],);
                      };

                    },
                  ),
                ),
                SizedBox(height: 5.sh,),


                Text('Optional Group-IV',style: TextStyle(color: AppConstants().primaryGreen, fontSize: 3.sh),),
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
                    itemCount: og4.length, // Total number of items in the grid
                    itemBuilder: (BuildContext context, int index) {
                      if(index== 0){
                        return singleTileSubjectsCSS(subjectTitle: og4[index]['title'], subjectMarks: og4[index]['marks'].toString(), subjectCode: og4[index]['code'],);
                      };
                      if(index== 1){
                        return singleTileSubjectsCSS(subjectTitle: og4[index]["title"], subjectMarks: og4[index]['marks'].toString(), subjectCode: og4[index]['code'],);
                      };
                      if(index== 2){
                        return singleTileSubjectsCSS(subjectTitle: og4[index]["title"], subjectMarks: og4[index]['marks'].toString(), subjectCode: og4[index]['code'],);
                      };
                      if(index== 3){
                        return singleTileSubjectsCSS(subjectTitle: og4[index]["title"], subjectMarks: og4[index]['marks'].toString(), subjectCode: og4[index]['code'],);
                      };
                      if(index== 4){
                        return singleTileSubjectsCSS(subjectTitle: og4[index]["title"], subjectMarks: og4[index]['marks'].toString(), subjectCode: og4[index]['code'],);
                      };

                    },
                  ),
                ),
                SizedBox(height: 5.sh,),


                Text('Optional Group-V',style: TextStyle(color: AppConstants().primaryGreen, fontSize: 3.sh),),
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
                    itemCount: og5.length, // Total number of items in the grid
                    itemBuilder: (BuildContext context, int index) {
                      // Return a widget for each grid item
                      if(index== 0){
                        return singleTileSubjectsCSS(subjectTitle: og5[index]['title'], subjectMarks: og5[index]['marks'].toString(), subjectCode: og5[index]['code'],);
                      };
                      if(index== 1){
                        return singleTileSubjectsCSS(subjectTitle: og5[index]["title"], subjectMarks: og5[index]['marks'].toString(), subjectCode: og5[index]['code'],);
                      };
                      if(index== 2){
                        return singleTileSubjectsCSS(subjectTitle: og5[index]["title"], subjectMarks: og5[index]['marks'].toString(), subjectCode: og5[index]['code'],);
                      };
                      if(index== 3){
                        return singleTileSubjectsCSS(subjectTitle: og5[index]["title"], subjectMarks: og5[index]['marks'].toString(), subjectCode: og5[index]['code'],);
                      };
                      if(index== 4){
                        return singleTileSubjectsCSS(subjectTitle: og5[index]["title"], subjectMarks: og5[index]['marks'].toString(), subjectCode: og5[index]['code'],);
                      };
                      if(index== 5){
                        return singleTileSubjectsCSS(subjectTitle: og5[index]["title"], subjectMarks: og5[index]['marks'].toString(), subjectCode: og5[index]['code'],);
                      };
                      if(index== 6){
                        return singleTileSubjectsCSS(subjectTitle: og5[index]["title"], subjectMarks: og5[index]['marks'].toString(), subjectCode: og5[index]['code'],);
                      };
                    },
                  ),
                ),
                SizedBox(height: 5.sh,),


                Text('Optional Group-VI',style: TextStyle(color: AppConstants().primaryGreen, fontSize: 3.sh),),
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
                    itemCount: og6.length, // Total number of items in the grid
                    itemBuilder: (BuildContext context, int index) {
                      // Return a widget for each grid item
                      if(index== 0){
                        return singleTileSubjectsCSS(subjectTitle: og6[index]['title'], subjectMarks: og6[index]['marks'].toString(), subjectCode: og6[index]['code'],);
                      };
                      if(index== 1){
                        return singleTileSubjectsCSS(subjectTitle: og6[index]["title"], subjectMarks: og6[index]['marks'].toString(), subjectCode: og6[index]['code'],);
                      };
                      if(index== 2){
                        return singleTileSubjectsCSS(subjectTitle: og6[index]["title"], subjectMarks: og6[index]['marks'].toString(), subjectCode: og6[index]['code'],);
                      };
                      if(index== 3){
                        return singleTileSubjectsCSS(subjectTitle: og6[index]["title"], subjectMarks: og6[index]['marks'].toString(), subjectCode: og6[index]['code'],);
                      };
                      if(index== 4){
                        return singleTileSubjectsCSS(subjectTitle: og6[index]["title"], subjectMarks: og6[index]['marks'].toString(), subjectCode: og6[index]['code'],);
                      };
                      if(index== 5){
                        return singleTileSubjectsCSS(subjectTitle: og6[index]["title"], subjectMarks: og6[index]['marks'].toString(), subjectCode: og6[index]['code'],);
                      };
                      if(index== 6){
                        return singleTileSubjectsCSS(subjectTitle: og6[index]["title"], subjectMarks: og6[index]['marks'].toString(), subjectCode: og6[index]['code'],);
                      };
                    },
                  ),
                ),
                SizedBox(height: 5.sh,),


                Text('Optional Group-VII',style: TextStyle(color: AppConstants().primaryGreen, fontSize: 3.sh),),
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
                    itemCount: og7.length, // Total number of items in the grid
                    itemBuilder: (BuildContext context, int index) {
                      if(index== 0){
                        return singleTileSubjectsCSS(subjectTitle: og7[index]['title'], subjectMarks: og7[index]['marks'].toString(), subjectCode: og7[index]['code'],);
                      };
                      if(index== 1){
                        return singleTileSubjectsCSS(subjectTitle: og7[index]["title"], subjectMarks: og7[index]['marks'].toString(), subjectCode: og7[index]['code'],);
                      };
                      if(index== 2){
                        return singleTileSubjectsCSS(subjectTitle: og7[index]["title"], subjectMarks: og7[index]['marks'].toString(), subjectCode: og7[index]['code'],);
                      };
                      if(index== 3){
                        return singleTileSubjectsCSS(subjectTitle: og7[index]["title"], subjectMarks: og7[index]['marks'].toString(), subjectCode: og7[index]['code'],);
                      };
                      if(index== 4){
                        return singleTileSubjectsCSS(subjectTitle: og7[index]["title"], subjectMarks: og7[index]['marks'].toString(), subjectCode: og7[index]['code'],);
                      };
                      if(index== 5){
                        return singleTileSubjectsCSS(subjectTitle: og7[index]["title"], subjectMarks: og7[index]['marks'].toString(), subjectCode: og7[index]['code'],);
                      };
                      if(index== 6){
                        return singleTileSubjectsCSS(subjectTitle: og7[index]["title"], subjectMarks: og7[index]['marks'].toString(), subjectCode: og7[index]['code'],);
                      };
                      if(index== 7){
                        return singleTileSubjectsCSS(subjectTitle: og7[index]["title"], subjectMarks: og7[index]['marks'].toString(), subjectCode: og7[index]['code'],);
                      };
                      if(index== 8){
                        return singleTileSubjectsCSS(subjectTitle: og7[index]["title"], subjectMarks: og7[index]['marks'].toString(), subjectCode: og7[index]['code'],);
                      };
                      if(index== 9){
                        return singleTileSubjectsCSS(subjectTitle: og7[index]["title"], subjectMarks: og7[index]['marks'].toString(), subjectCode: og7[index]['code'],);
                      };
                      if(index== 10){
                        return singleTileSubjectsCSS(subjectTitle: og7[index]["title"], subjectMarks: og7[index]['marks'].toString(), subjectCode: og7[index]['code'],);
                      };
                    },
                  ),
                ),

              ],);});}}


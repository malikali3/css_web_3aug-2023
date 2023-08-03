import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_database/firebase_database.dart';
import 'package:new_css_web/home_screen_flow/past_paper_mobile_version.dart';
import '../widgets/size_variables.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:flutter/foundation.dart';





class past_subjective_paper_route_pms extends StatefulWidget {
  final String subject;
  final String year;
  final String subjectTitle;


  const past_subjective_paper_route_pms({super.key, required this.subject, required this.year, required this.subjectTitle });

  @override
  State<past_subjective_paper_route_pms> createState() => _past_subjective_paper_route_pmsState();
}

class _past_subjective_paper_route_pmsState extends State<past_subjective_paper_route_pms> {


  @override

  void initState() {
    super.initState();
   _initQuizData();
  }


  List<SubjectiveExam> subjectiveExamArray = [];

  _initQuizData() {
    // print(widget.subject);
    // print(widget.year);
    String subject = widget.subject;
    String year = widget.year;
    print(subject);
    print(year);

    var dbRef = FirebaseDatabase.instance.ref();

    dbRef.child("pms_subjective-exams/$subject/$year").onValue.listen((event) {
      var snapshotValue = event.snapshot.value;


      if (snapshotValue == null) {
        // Handle the case where the snapshot value is null
        print("Snapshot value is null.");
        return;
      }
      Map<dynamic, dynamic> value = event.snapshot.value as dynamic;
      value.forEach((key, value) {
        String questionID = value["questionID"];
        int questionNumber = value["questionNumber"];
        String question = value["question"];
        String url = value["url"];

        setState(() {
          subjectiveExamArray.add(SubjectiveExam(
              question: question,
              questionID: questionID,
              questionNumber: questionNumber,
              url: url));
        });
        });
      subjectiveExamArray
          .sort((a, b) => a.questionNumber.compareTo(b.questionNumber));
    });
  }

  String link = "";
  Future<void> urlLoad(year) async{
    String downloadURL = await firebase_storage.FirebaseStorage.instance.
    ref('pms subjective pdf/${widget.subject}/${widget.subject} $year.pdf').
    getDownloadURL();
    print(downloadURL);
    print(link);
    final Uri syllabus_link = Uri.parse(downloadURL);
    launchUrl(syllabus_link);
  }

  Future<void> urlLoad2(year) async{
    String downloadURL = await firebase_storage.FirebaseStorage.instance.
    ref('pms subjective pdf/${widget.subject}/${widget.subject} $year.pdf').
    getDownloadURL();
    print(downloadURL);
    print(link);
    if (!context.mounted) return;
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
              past_paper_mobile_version(
                value: downloadURL,),);});

  }

  Widget build (BuildContext context) {
    return
      ResponsiveBuilder(
          builder: (context, sizingInformation){

            return Scaffold(
                backgroundColor:AppConstants().primaryWhite,
                body:
                Column(
                    children: [
                      subjectiveExamArray.isEmpty?
                      Expanded(
                        child: Center(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppConstants().lightGreen,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.sw),
                                ),
                              ),
                              onPressed: ()   async{
                          await kIsWeb?
                          urlLoad(widget.year)
                              :urlLoad2(widget.year);},
                          child: Text("View Past Paper")),
                        ),
                      )
                      :Expanded(
                        child: Column(
                          children: [
                            Center(
                              child: Text(
                                '${widget.subjectTitle}, ${widget.year}',
                                style: TextStyle(fontSize:5.sw,
                                    fontWeight: FontWeight.bold,
                                    color: AppConstants().primaryGreen,
                                decoration: TextDecoration.underline),
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                  itemCount: subjectiveExamArray.length,
                                  itemBuilder:(context, i){
                                    return
                                      Text(
                                        "${subjectiveExamArray[i].questionNumber}  ${subjectiveExamArray[i].question}\n",
                                        style: TextStyle(fontSize:3.sw, color: AppConstants().primaryGreen,
                                          height: 1.5
                                        ),

                                      );
                                  }

                              ),
                            ),
                          ],
                        ),
                      ),


                     ]

                )



            );
          }
      );
  }
}


class SubjectiveExam {
  String question;
  String questionID;
  int questionNumber;
  String url;

  SubjectiveExam(
      {required this.question, required this.questionID, required this.questionNumber, required this.url});
}
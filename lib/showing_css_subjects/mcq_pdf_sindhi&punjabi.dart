import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_database/firebase_database.dart';
import 'package:new_css_web/home_screen_flow/past_paper_mobile_version.dart';
import '../widgets/size_variables.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:flutter/foundation.dart';





class pdf_mcq_punjabi_sindhi extends StatefulWidget {
  final String subjectCode;
  final String year;
  final String subjectTitle;


  const pdf_mcq_punjabi_sindhi({super.key, required this.subjectCode, required this.year, required this.subjectTitle });

  @override
  State<pdf_mcq_punjabi_sindhi> createState() => _pdf_mcq_punjabi_sindhiState();
}

class _pdf_mcq_punjabi_sindhiState extends State<pdf_mcq_punjabi_sindhi> {


  @override

  void initState() {
    super.initState();
    //_initQuizData();
  }


  List<SubjectiveExam> subjectiveExamArray = [];

  _initQuizData() {
    // print(widget.subject);
    // print(widget.year);
    String subject = widget.subjectCode;
    String year = widget.year;
    print(subject);
    print(year);

    var dbRef = FirebaseDatabase.instance.ref();

    dbRef.child('Objective pdf/${widget.subjectCode}/${widget.subjectCode} $year.pdf').onValue.listen((event) {
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
    ref('Objective pdf/${widget.subjectCode}/${widget.subjectCode} $year.pdf').
    getDownloadURL();
    print(downloadURL);
    print(link);
    final Uri syllabus_link = Uri.parse(downloadURL);
    launchUrl(syllabus_link);
  }

  Future<void> urlLoad2(year) async{
    String downloadURL = await firebase_storage.FirebaseStorage.instance.
    ref('Objective pdf/${widget.subjectCode}/${widget.subjectCode} $year.pdf').
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
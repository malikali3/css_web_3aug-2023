import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:new_css_web/home_screen_flow/past_subjective_paper_route.dart';
import 'package:new_css_web/home_screen_flow/home.dart';
import 'package:new_css_web/pms%20subjects/past_subjective_paper_route_pms.dart';
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

bool showAnswer = false;
List<MCQ> mcqArray = [];

var showAnswerRowNumberClicked = -1;

class pms_mcq extends StatefulWidget {
  final String subjectCode;
  final String subjectYear;
  final String subjectTitle;

  const pms_mcq({super.key, required this.subjectCode, required this.subjectYear, required this.subjectTitle, });

  @override
  State<pms_mcq> createState() => _pms_mcq();}

final isDialOpen = ValueNotifier(false);
class _pms_mcq extends State<pms_mcq> {
  final Uri apprays = Uri.parse('https://www.apprays.io/');

  void initState() {
    super.initState();
    _initQuizData();
  }
  _initQuizData() {
    String subject = widget.subjectCode;
    String year = widget.subjectYear;
    print(subject);
    print(year);

    var dbRef = FirebaseDatabase.instance.ref();

    dbRef.child("pms-mcq-exams/$subject/$year").onValue.listen((event) {
      var snapshotValue = event.snapshot.value;


      if (snapshotValue == null) {
        // Handle the case where the snapshot value is null
        print("Snapshot value is null.");
        return;
      }
      Map<dynamic, dynamic> documents = event.snapshot.value as dynamic;
      documents.forEach((key, value) {
        var data = documents[key];
        print("data1: ${data}");
        final mcqID = data["mcqID"];
        final mcqIDArray = mcqID.split("-");
        final mcqNumber = mcqIDArray.last;

        setState(() {
          mcqArray.add(MCQ(
              data["question"],
              data["answer"],
              data["choiceA"],
              data["choiceB"],
              data["choiceC"],
              data["choiceD"],
              data["mcqID"],
              "",
              int.parse(mcqNumber)));
        });
      });

      mcqArray.sort((a, b) => a.mcqNumber.compareTo(b.mcqNumber));
    });
  }

  @override

  Widget build(BuildContext context)  {


    return
      ResponsiveBuilder(
          builder: (context, sizingInformation) {

            var yearsRef;
            yearsRef = FirebaseDatabase.instance
                .ref()
                .child("pms-mcq-exams/${widget.subjectCode}/yearsList");

            return Scaffold(
              body: Column(
                children: [
                  Center(child: Text("${widget.subjectTitle} ${widget.subjectYear}", style: TextStyle(
                      color:  AppConstants().primaryGreen,
                      fontSize: 5.sw,
                      fontWeight: FontWeight.w500
                  ),)),
                  Expanded(
                    child:
                    Center(
                      child:
                      StreamBuilder(
                          stream: yearsRef.onValue,
                          //here AsyncSnapshot will remove the .snapshot error
                          builder: (context, AsyncSnapshot snapshot){
                            if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');}
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return Text('Loading...');}
                            if (!snapshot.hasData|| snapshot.data.snapshot.value == null) {
                              return Text('No data available');
                            }
                   // print("documents: $keys");
                            return

                              GridView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: mcqArray.length == 0 ? 0 : mcqArray.length + 1,
                                gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1,
                                  childAspectRatio: 3.5,
                                ),
                                itemBuilder: (context, i){
                                  if (i == mcqArray.length) {
                                    return Padding(
                                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                    );
                                  }
                                  return
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    decoration: BoxDecoration(
                                    color: AppConstants().primaryWhite,
                                    borderRadius: BorderRadius.circular(4.sw),
                                    border: Border.all(
                                    color: AppConstants().lightGreen,
                                    width: 0.3.sw,)
                                    ),
                                child: Padding(
                                  padding: i == 0
                                ? EdgeInsets.fromLTRB(5, 8, 0, 0)
                                : EdgeInsets.fromLTRB(5, 0, 0, 0),
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                SizedBox(height: 5),
                                Text(
                                  "${i + 1}) ${mcqArray[i].question}",
                                  style: TextStyle(fontSize: 3.sw, color: AppConstants().primaryGreen),
                                ),
                                SizedBox(height: 3.sh),
                                Row(
                                  children: <Widget>[
                                    Flexible(
                                      child: Text(
                                        "a) ${mcqArray[i].choiceA}",
                                        style: TextStyle(fontSize: 3.sw, color: AppConstants().primaryGreen),
                                      ),
                                    ),

                                    SizedBox(
                                      width: 15,
                                    ),
                                    CheckIcon(i: i, alphabet: 'a'),
                                  ],
                                ),
                                SizedBox(
                                  height: 1.5.sh,
                                ),
                                Row(
                                  children: <Widget>[
                                    Flexible(
                                      child: Text(
                                        "b) ${mcqArray[i].choiceB}",
                                        style: TextStyle(fontSize: 3.sw,color: AppConstants().primaryGreen),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    CheckIcon(i: i, alphabet: 'b'),
                                  ],
                                ),
                                SizedBox(
                                  height: 1.5.sh,
                                ),
                                Row(
                                  children: <Widget>[
                                    Flexible(
                                      child: Text(
                                        "c) ${mcqArray[i].choiceC}",
                                        style: TextStyle(fontSize: 3.sw, color: AppConstants().primaryGreen),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    CheckIcon(i: i, alphabet: 'c'),
                                  ],
                                ),
                                SizedBox(
                                  height: 1.5.sh,
                                ),
                                Row(
                                  children: <Widget>[
                                    Flexible(
                                      child: Text(
                                        "d) ${mcqArray[i].choiceD}",
                                        style: TextStyle(fontSize: 3.sw, color: AppConstants().primaryGreen),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    CheckIcon(i: i, alphabet: 'd'),
                                  ],
                                ),

                                  SizedBox(
                                    height: 50,
                                  ),

                                      Row(
                                        children: [
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(40 / 2),
                                              ),
                                              backgroundColor: Colors.green,
                                            ),

                                            onPressed: () {
                                              setState(() {
                                                showAnswerRowNumberClicked = i;
                                                showAnswer = !showAnswer;
                                                print("showAnswer: ${showAnswer}");

                                              });
                                            },
                                            child: Text(
                                              "Show Answer",
                                              style: TextStyle(color: Colors.black),
                                            ),
                                          ),
                                          // ElevatedButton.icon(
                                          //     icon: Icon(
                                          //       Icons.report,
                                          //       color: Colors.red,
                                          //     ),
                                          //     style: ElevatedButton.styleFrom(
                                          //       shape: RoundedRectangleBorder(
                                          //         borderRadius:
                                          //         BorderRadius.circular(40 / 2),
                                          //       ),
                                          //       backgroundColor: Colors.blue,
                                          //     ),
                                          //
                                          //     onPressed: ()
                                          //     {},
                                          //
                                          //     label: Text("Report Question"))
                                        ],
                                      ),

                                ]),
                                ) ),
                              );




                                  },
                              );
                          }
                      ),

                  ),

              ),

            ]
              )
            );
          }
      );
  }

}


class CheckIcon extends StatelessWidget {
  int i;
  String alphabet; //1 for a, 2 for b, 3 for c, 4 for d
  CheckIcon({required this.i, required this.alphabet});

  @override
  Widget build(BuildContext context) {
    if (mcqArray[i].answer == alphabet && showAnswerRowNumberClicked == i) {
      return Icon(
        Icons.check_circle_outline,
        color: Colors.green,
      );
    } else {
      return Text("");
    }
  }
}

class MCQ {
  String question;
  String answer;
  String choiceA;
  String choiceB;
  String choiceC;
  String choiceD;
  String mcqID;
  String usersAnswer;
  int mcqNumber;

  MCQ(this.question, this.answer, this.choiceA, this.choiceB, this.choiceC,
      this.choiceD, this.mcqID, this.usersAnswer, this.mcqNumber);
}

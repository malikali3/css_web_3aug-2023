import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:new_css_web/home_screen_flow/past_paper_mobile_version.dart';
import '../widgets/getX_class.dart';
import 'package:get/get.dart';
import 'package:new_css_web/widgets/size_variables.dart';
import 'package:new_css_web/widgets/size_variables.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:url_launcher/url_launcher.dart';


bool showAnswer = false;
List<MCQ> mcqArray = [];

int showAnswerRowNumberClicked = -1;

class random_mcq extends StatefulWidget {
  final String subjectCode;
  final String set;
  final String subjectTitle;

  const random_mcq(
      {Key? key, required this.subjectCode, required this.set, required this.subjectTitle})
      : super(key: key);

  @override
  State<random_mcq> createState() => _random_mcq();
}



class _random_mcq extends State<random_mcq> {
  final Uri apprays = Uri.parse('https://www.apprays.io/');
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final ScrollController _scrollController = ScrollController();





  void initState() {
    super.initState();
    _initQuizData();
  }

  showCircle(int i){
    setState(() {
      showAnswerRowNumberClicked = i;
      showAnswer = !showAnswer;
      print("showAnswer: $showAnswer");
    });
  }


  _initQuizData() {
    String subject = widget.subjectCode;
    String set = widget.set;
    print(subject);
    print(set);

    var dbRef = FirebaseDatabase.instance.ref();

    dbRef.child("random_mcq/$subject/$set").onValue.listen((event) {

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

  String link = "";
  //this function is for only punjabi subject
  Future<void> urlLoad(year) async{
    String downloadURL = await firebase_storage.FirebaseStorage.instance.
    ref('Punjabi Random MCQs/Past Papers MCQs/${widget.set}.pdf').
    getDownloadURL();
    print(downloadURL);
    print(link);
    final Uri syllabus_link = Uri.parse(downloadURL);
    launchUrl(syllabus_link);
  }

  //this function is for only punjabi subject
  Future<void> urlLoad2(year) async{
    String downloadURL = await firebase_storage.FirebaseStorage.instance.
    ref('Punjabi Random MCQs/Past Papers MCQs/${widget.set}.pdf').
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




  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      var yearsRef;
      yearsRef = FirebaseDatabase.instance.ref().child("random_mcq/${widget.subjectCode}/${widget.set}");

      return Scaffold(
          body: Column(
              children: [
                SingleChildScrollView(
                  child: Center(
                    child: Text(
                      "${widget.subjectTitle} ${widget.set}",
                      style: TextStyle(
                        color: AppConstants().primaryGreen,
                        fontSize: 5.sw,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                mcqArray.isEmpty?
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
                          await kIsWeb?urlLoad(widget.set):urlLoad2(widget.set);
                        },
                        child: Text("View Past Paper")),
                  ),
                )
                :Expanded(
                  child: Center(
                    child: StreamBuilder(
                      stream: yearsRef.onValue,
                      //here AsyncSnapshot will remove the .snapshot error
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        }
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Text('Loading...');
                        }
                        if (!snapshot.hasData || snapshot.data == null ||snapshot.data.snapshot.value == null) {

                          return Text('No data available');
                        }

                        return SingleChildScrollView(
                          child: Column(
                            children: [
                              StatefulBuilder(
                                  builder: (BuildContext context, StateSetter setState){
                                    return
                                      ListView.builder(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        controller: _scrollController,
                                        itemCount: mcqArray.length == 0 ? 0 : mcqArray.length + 1,
                                        itemBuilder: (context, i) {
                                          if (i == mcqArray.length) {
                                            Padding(
                                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                            );
                                          }
                                          return Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: AppConstants().primaryWhite,
                                                borderRadius: BorderRadius.circular(4.sw),
                                                border: Border.all(
                                                  color: AppConstants().lightGreen,
                                                  width: 0.3.sw,
                                                ),
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
                                                            style: TextStyle(fontSize: 3.sw, color: AppConstants().primaryGreen),
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
                                                              borderRadius: BorderRadius.circular(40 / 2),
                                                            ),
                                                            backgroundColor: Colors.green,
                                                          ),
                                                          onPressed: () {
                                                            setState(() {
                                                              showAnswerRowNumberClicked = i;
                                                              showAnswer = !showAnswer;
                                                              print("showAnswer: $showAnswer");
                                                            });
                                                          },
                                                          child: Text(
                                                            "Show Answer",
                                                            style: TextStyle(color: Colors.black),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                  }
                              )],
                          ),
                        );
                      },
                    ),
                  ),
                ),

              ])
      );
    });



  }
}




class CheckIcon extends StatefulWidget {
  final int i;
  final String alphabet;


  CheckIcon({required this.i, required this.alphabet,});

  @override
  _CheckIconState createState() => _CheckIconState();
}

class _CheckIconState extends State<CheckIcon> {
  @override
  Widget build(BuildContext context) {
    if (mcqArray[widget.i].answer == widget.alphabet && showAnswerRowNumberClicked == widget.i) {
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

  MCQ(this.question, this.answer, this.choiceA, this.choiceB, this.choiceC, this.choiceD, this.mcqID, this.usersAnswer,
      this.mcqNumber);
}

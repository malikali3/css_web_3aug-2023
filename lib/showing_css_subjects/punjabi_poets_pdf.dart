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


class punjabi_poets_pdf extends StatefulWidget {
  final String subjectCode;
  final String set;
  final String subjectTitle;

  const punjabi_poets_pdf(
      {Key? key, required this.subjectCode, required this.set, required this.subjectTitle})
      : super(key: key);

  @override
  State<punjabi_poets_pdf> createState() => _punjabi_poets_pdf();
}



class _punjabi_poets_pdf extends State<punjabi_poets_pdf> {
  final Uri apprays = Uri.parse('https://www.apprays.io/');
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final ScrollController _scrollController = ScrollController();





  void initState() {
    super.initState();

  }

  String link = "";
  //this function is for only punjabi subject
  Future<void> urlLoad(year) async{
    String downloadURL = await firebase_storage.FirebaseStorage.instance.
    ref('Punjabi Random MCQs/Poets MCQs/${widget.set}.pdf').
    getDownloadURL();
    print(downloadURL);
    print(link);
    final Uri syllabus_link = Uri.parse(downloadURL);
    launchUrl(syllabus_link);
  }

  //this function is for only punjabi subject
  Future<void> urlLoad2(year) async{
    String downloadURL = await firebase_storage.FirebaseStorage.instance.
    ref('Punjabi Random MCQs/Poets MCQs/${widget.set}.pdf').
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
                value: downloadURL,),);});}

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {

      return Scaffold(
          body: Column(
              children: [
                SingleChildScrollView(
                  child: Center(
                    child: Text(
                      "${widget.set}",
                      style: TextStyle(
                        color: AppConstants().primaryGreen,
                        fontSize: 5.sw,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),

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
                          await kIsWeb?urlLoad(widget.set)
                              :urlLoad2(widget.set);
                        },
                        child: Text("View Past Paper")),
                  ),
                )


              ])
      );
    });



  }
}

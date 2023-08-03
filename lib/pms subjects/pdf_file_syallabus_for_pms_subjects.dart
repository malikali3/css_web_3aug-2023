import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import '../widgets/size_variables.dart';
import 'package:responsive_builder/responsive_builder.dart';



class pdf_file_syallabus_for_pms_subjects extends StatefulWidget {
  final value;
  const pdf_file_syallabus_for_pms_subjects({super.key, required this.value});

  @override
  State<pdf_file_syallabus_for_pms_subjects> createState() => _pdf_file_syallabus_for_pms_subjectsState();
}

class _pdf_file_syallabus_for_pms_subjectsState extends State<pdf_file_syallabus_for_pms_subjects> {
  @override



  // this format + value is from previous screen is for syllabus
  Stream stream1 = FirebaseFirestore.instance
      .collection('pms-official-syllabus')
      .doc("0")
      .snapshots();

  Widget build(BuildContext context) {
    return
      ResponsiveBuilder(
          builder: (context, sizingInformation)  {
            return
            StreamBuilder(
                stream: stream1,
                builder: (context, snapshot1){

                  if (snapshot1.hasError) {
                    return Text('Error: ${snapshot1.error}');}

                  if (snapshot1.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());}
                  if (!snapshot1.hasData) {
                    return Text('No data available');
                  }
                  final Uri syllabusLink = Uri.parse(snapshot1.data?[widget.value]);

                  return Scaffold(
                       body:
                       kIsWeb? Center(
                         child: FractionallySizedBox(
                           widthFactor: 0.8, // Set the desired width factor (0.0 - 1.0)
                           heightFactor: 0.8,
                           child: ElevatedButton(
                               style: ElevatedButton.styleFrom(
                                 backgroundColor: AppConstants().lightGreen,
                                 shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(4.sw),
                                 ),
                               ),
                               onPressed: ()
                             async{
                               await launchUrl(syllabusLink);
                             },

                            child: Text("View Syllabus", style: TextStyle(
                              fontSize: 3.sw,

                            ),)),
                         ),
                       )
                           :
                       Container(child:
                         SfPdfViewer.network(snapshot1.data?[widget.value]

                       ),


                      ));
                }

            );

          }
      );
  }

}

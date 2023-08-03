import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import '../widgets/size_variables.dart';
import 'package:responsive_builder/responsive_builder.dart';



class pdf_file_syallabus_for_css_subjects extends StatefulWidget {
  final value;
  const pdf_file_syallabus_for_css_subjects({super.key, required this.value});

  @override
  State<pdf_file_syallabus_for_css_subjects> createState() => _pdf_file_syallabus_for_css_subjectsState();
}

class _pdf_file_syallabus_for_css_subjectsState extends State<pdf_file_syallabus_for_css_subjects> {
  @override




  // this format + value is from previous screen is for syllabus
  Stream stream1 = FirebaseFirestore.instance
      .collection('css_syllabus_pdf_files')
      .doc("css_syllabus_list")
      .snapshots();

  Widget build(BuildContext context) {
    return
      Scaffold(
        body: ResponsiveBuilder(
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

                    return
                         kIsWeb? Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             ElevatedButton(
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
                             ElevatedButton(onPressed: (){Navigator.pop(context);},
                                 style: ElevatedButton.styleFrom(
                                   backgroundColor: AppConstants().lightGreen,
                                   shape: RoundedRectangleBorder(
                                     borderRadius: BorderRadius.circular(4.sw),
                                   ),
                                 ),

                                 child: Text('back')),
                           ],
                         )
                             :
                         Container(child:
                           SfPdfViewer.network(snapshot1.data?[widget.value]

                         ),


                        );

                  }

              );

            }
        ),
      );
  }

}

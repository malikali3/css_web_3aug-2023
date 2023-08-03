import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import '../widgets/size_variables.dart';
import 'package:responsive_builder/responsive_builder.dart';



class past_paper_mobile_version extends StatefulWidget {
  final value;
  const past_paper_mobile_version({super.key, required this.value});

  @override
  State<past_paper_mobile_version> createState() => _check_this();
}

class _check_this extends State<past_paper_mobile_version> {
  @override




  // this format + value is from previous screen is for syllabus


  Widget build(BuildContext context) {
    return
      ResponsiveBuilder(
          builder: (context, sizingInformation)  {


                    return Scaffold(
                        body:
                        Container(child:
                        SfPdfViewer.network(widget.value),));
                  }
      );
  }

}

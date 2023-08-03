import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_css_web/widgets/size_variables.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../home_screen_flow/share_tip_screen.dart';


class assign extends StatefulWidget {
  const assign({super.key});

  @override
  State<assign> createState() => _assign();
}

class _assign extends State<assign>  {

  bool colorSelected = false;
  final controller = TextEditingController();
  String emptyText ='';
  void changeColor(){

    setState(() {
      colorSelected = !colorSelected;

    });

  }
  void showText(){


  setState(() {
    emptyText = controller.text;
  });
  }


  @override
  Widget build(BuildContext context) {


    return
      Scaffold(
        backgroundColor: AppConstants().primaryWhite, // Set background color
        body: Column(
          children:  [
            // Expanded(
            //   child: Row(
            //     children: [
            //       Expanded(child: Container(color:
            //       colorSelected?
            //       Colors.lightGreen
            //           :Colors.red,
            //         child: Center(child: Text(colorSelected.toString())),
            //
            //       )),
            //       ElevatedButton(onPressed: (){
            //         changeColor();
            //
            //       }, child: Text('Change Color'))
            //     ],
            //   ),
            // ),
            // Expanded(
            //   child: Row(
            //     children: [
            //       Expanded(child: TextField(
            //         controller: controller,
            //         decoration: InputDecoration(
            //           hintText: 'Enter your name'
            //         ),
            //
            //       )),
            //       Expanded(child: ElevatedButton(onPressed:(){
            //         showText();
            //       }, child: Text('Show Text'))),
            //       Expanded(child: Text(emptyText)),
            //     ],
            //   ),
            // ),
            //colorSelected?
            Center(
              child: ElevatedButton(onPressed: (){
                changeColor();},
              child:
              colorSelected? Text ('Show Picture'):
                Text('ABC'),
            )),
            colorSelected?
            Image.asset('images/apple.jpg'):
                Text(''),
            //Text("hello")
          ],
        ),);


  }}








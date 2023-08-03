import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class frostedGlass extends StatelessWidget {
  const frostedGlass({Key? key,

  required this.width,
  required this.height,
  required this.child,
    required this.color,

  }) : super(key: key);


  final width;
  final height;
  final child;
  final Color color;


  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(width * 0.04),
      child: Container(
        width: width,
        height: height,
        color: Colors.transparent,
        child: Stack(children: [
          //blur effect
          BackdropFilter(filter: ImageFilter.blur(
            sigmaX: 4.0,
            sigmaY: 4.0,
          ),
          child: Container(),
          ),

          //gradient effect
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(width * 0.05),
              border: Border.all(color: Colors.black.withOpacity(0.13)),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  color.withOpacity(0.5),
                  color.withOpacity(0.06),
                ]),),),



          Center(child: child,)
        ],
        ),
      ),
    );
  }
}

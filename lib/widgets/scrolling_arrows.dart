import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget scroll (bool leftIcon, bool rightIcon, Function scrollToTop, Function scrollToBottom) {
  return ListView(
    scrollDirection: Axis.horizontal,
    shrinkWrap: true,
    children: [
      if (leftIcon)
        IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            scrollToTop();
          },
        ),
      if (rightIcon)
        IconButton(
          icon: Icon(Icons.arrow_forward),
          onPressed: () {
            scrollToBottom();
          },
        ),
    ],
  );
}
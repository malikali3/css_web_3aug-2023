import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class MyCustomScrollBehaviour extends MaterialScrollBehavior{
  @override
  Set<PointerDeviceKind>get dragDevices => {
    PointerDeviceKind.mouse,
    PointerDeviceKind.touch
  };
}
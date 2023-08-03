import 'package:flutter/material.dart';

class AppConstants {

  static double getTextSizeForMainHeadline(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double Size;

    if (screenWidth < 650) {
      Size = screenWidth * 0.04;
    } else {
      Size = screenWidth * 0.025;
    }

    return Size;
  }

  static double getTextSizeForSecondHeadline(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double textSize;

    if (screenWidth < 650) {
      textSize = screenWidth * 0.05;
    } else {
      textSize = screenWidth * 0.015;
    }

    return textSize;
  }

  static double getTextSizeForThirdHeadline(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double textSize;

    if (screenWidth < 650) {
      textSize = screenWidth * 0.04;
    } else {
      textSize = screenWidth * 0.01;
    }

    return textSize;
  }


  static double CSSlogo(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double Size;

    if (screenWidth < 650) {
      Size = screenWidth * 0.15;
    } else {
      Size = screenWidth * 0.07;
    }

    return Size;
  }


  static double arLogoBig(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double textSize;

    if (screenWidth < 650) {
      textSize = screenWidth * 0.08;
    } else {
      textSize = screenWidth * 0.04;
    }

    return textSize;
  }


  static double buttonsWidth(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double textSize;

    if (screenWidth < 650) {
      textSize = screenWidth * 0.28;
    } else {
      textSize = screenWidth * 0.13;
    }

    return textSize;
  }


  static double buttonsHeight(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double textSize;

    if (screenWidth < 650) {
      textSize = screenHeight * 0.055;
    } else {
      textSize = screenHeight * 0.05;
    }

    return textSize;
  }

  static double buttonsText(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double textSize;

    if (screenWidth < 650) {
      textSize = screenWidth * 0.025;
    } else {
      textSize = screenWidth * 0.015;
    }

    return textSize;
  }

  static double iconSize(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double textSize;

    if (screenWidth < 650) {
      textSize = screenWidth * 0.04;
    } else {
      textSize = screenWidth * 0.02;
    }

    return textSize;
  }



  //still to check for app

  static double verticalRectangleWidth(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    double textSize;

    if (screenWidth < 650) {
      textSize = screenWidth * 0.25;
    } else {
      textSize = screenWidth * 0.07;
    }

    return textSize;
  }


  static double verticalRectangleHeight(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double textSize;

    if (screenWidth < 650) {
      textSize = screenHeight * 0.15;
    } else {
      textSize = screenHeight * 0.2;
    }

    return textSize;
  }


  static double horizontalRectangleWidth(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    double textSize;

    if (screenWidth < 650) {
      textSize = screenWidth * 0.35;
    } else {
      textSize = screenWidth * 0.12;
    }

    return textSize;
  }

  static double horizontalRectangleHeight(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double textSize;

    if (screenWidth < 650) {
      textSize = screenHeight * 0.08;
    } else {
      textSize = screenHeight * 0.12;
    }

    return textSize;
  }


  static double tileIconSize(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double textSize;

    if (screenWidth < 650) {
      textSize = screenWidth * 0.08;
    } else {
      textSize = screenWidth * 0.03;
    }

    return textSize;
  }

  static double tileText(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double textSize;

    if (screenWidth < 650) {
      textSize = screenWidth * 0.045;
    } else {
      textSize = screenWidth * 0.012;
    }

    return textSize;
  }


  Color primaryGreen = Color.fromRGBO(0, 63, 21, 1);
  Color lightGreen = Color.fromRGBO(62, 191, 45, 1);
  Color white = Colors.white;
  Color grey = Colors.grey;
  Color lightGrey=Color.fromRGBO(217, 217, 217, 1);
  Color primaryWhite = Color.fromRGBO(249, 255, 249, 1);
  Color hunterGreen = Color.fromRGBO(53, 94, 59, 1);
  Color paleGrey = Color.fromRGBO(192, 192, 192, 1);

  // Design for desktop displays from 1280×720 through 1920×1080
  // Design for mobile displays from 360×640 through 414×896
  // Design for tablet displays from 601×962 through 1280×800

}
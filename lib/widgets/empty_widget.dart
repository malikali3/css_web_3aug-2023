import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_css_web/widgets/size_variables.dart';

class empty_widget extends StatelessWidget {
  const empty_widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)  {


    return
      LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            double circleSize = constraints.maxWidth * 0.2;
            double secondHeadline = AppConstants.getTextSizeForSecondHeadline(context);
            double mainHeadline = AppConstants.getTextSizeForMainHeadline(context);
            double thirdHeadline = AppConstants.getTextSizeForThirdHeadline(context);
            double CSSlogo = AppConstants.CSSlogo(context);
            double arLogoBig = AppConstants.arLogoBig(context);
            double buttonWidth = AppConstants.buttonsWidth(context);
            double buttonHeight = AppConstants.buttonsHeight(context);
            double buttonText = AppConstants.buttonsText(context);
            double iconSize = AppConstants.iconSize(context);
            double verticalRectWidth = AppConstants.verticalRectangleWidth(context);
            double verticalRectHeight = AppConstants.verticalRectangleHeight(context);
            double horizontalRectWidth = AppConstants.horizontalRectangleWidth(context);
            double horizontalRectHeight = AppConstants.horizontalRectangleHeight(context);
            double tileIconSIze = AppConstants.tileIconSize(context);
            double tileText = AppConstants.tileText(context);

            double screenWidth = MediaQuery.of(context).size.width;
            double screenHeight = MediaQuery.of(context).size.height;
            Color grey = AppConstants().grey;
            Color primaryGreen = AppConstants().primaryGreen;
            Color lightGreen = AppConstants().lightGreen;
            Color white = AppConstants().white;
            Color lightGrey = AppConstants().lightGrey;
            Color primaryWhite = AppConstants().primaryWhite;



            return

              Text('');





          },
      );
  }
  }


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_css_web/signup%20flow/signup_complete_screen.dart';
import 'package:new_css_web/signup%20flow/timer.dart';
import 'package:get/get.dart';
import 'package:new_css_web/widgets/frosted_glass_effect.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../home_screen_flow/share_tip_screen.dart';
import '../widgets/getX_class.dart';
import '../widgets/size_variables.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/foundation.dart' show kIsWeb;




class enter_otp extends StatefulWidget {

  final numberExist;
  final phoneNum;
  final verificationId;
  final confirmationResult;

  const enter_otp({super.key,
    required this.numberExist,
    required this.phoneNum,
    required this.verificationId,
    required this.confirmationResult
  });


  @override
  State<enter_otp> createState() => _enter_otpState();
}


class _enter_otpState extends State<enter_otp>  {
  final otpCode = TextEditingController();
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final Uri whatsApp = Uri.parse('https://wa.me/+923032777297');
  bool isSelected = true;

  Services services= Get.put(Services());

  void numberConfirm()async{
    try {

      final User? user = FirebaseAuth.instance.currentUser;
      final id = user?.uid;
      CollectionReference collectionRef = FirebaseFirestore.instance.collection('users_basic_data').doc('$id').collection('basic_info');

      await collectionRef.get().then((QuerySnapshot querySnapshot) {
        for (var doc in querySnapshot.docs) {

          if (doc.get('phoneNumber') == widget.phoneNum) {
            services.numberExistfunTrue();

          }
          else {
            services.numberExistfunFalse();
          }}}

      );

      services.numberExist.isTrue?
      null
          : addDataToDoc();


    } catch (e) {
      print('Error retrieving documents: $e');
    }
  }


  void addDataToDoc() async{
    final User? user = FirebaseAuth.instance.currentUser;
    final id = user?.uid;
    _db.collection('users_basic_data').doc('$id').collection('basic_info').doc('$id').
    set({
      'email': '',
      'name': '',
      'phoneNumber': widget.phoneNum,

    });


    _db.collection('users_basic_data').doc('$id').collection('my_css_subjects').doc('$id').
    set({
      'MySubjects': '',
    });


    _db.collection('users_basic_data').doc('$id').collection('css_subjects_marks').doc('$id').
    set({
      'marks': '',
    });
    // _db.collection('users_basic_data').doc('$id').collection('my_subjects').doc('$id').
    // update({
    //   'MySubjects': FieldValue.delete(),
    // });
    _db.collection('users_basic_data').doc('$id').collection('css_subjects_bool').doc('$id').
    set({
      'EPnC': true,
      "EE": true,
      "GSnA": true,
      "PaA": true,
      "CA": true,
      "IS": true,
      "CSoMR": true,
      "Economics": true,
      "Economics-I": true,
      "Economics-II": true,
      "AnA": true,
      "AnA-I": true,
      "AnA-II": true,
      "PS": true,
      "PS-I": true,
      "PS-II": true,
      "CS": true,
      "CS-I": true,
      "CS-II": true,
      "IR": true,
      "IR-I": true,
      "IR-II": true,
      "Physics": true,
      "Physics-I": true,
      "Physics-II": true,
      "Chemistry": true,
      "Chemistry-I": true,
      "Chemistry-II": true,
      "AM": true,
      "AM-I": true,
      "AM-II": true,
      "PM": true,
      "PM-I": true,
      "PM-II": true,
      "Statistics":true,
      "Geology": true,
      "Geology-I": true,
      "Geology-II": true,
      "BA": true,
      "PuA": true,
      "GnPP": true,
      "TPnUM": true,
      "HoUS": true,
      "EH": true,
      "EH-I": true,
      "EH-II": true,
      "BH": true,
      "BH-I": true,
      "BH-II": true,
      "IHnC": true,
      "IHnC-I": true,
      "IHnC-II": true,
      "HoPnI": true,
      "HoPnI-I": true,
      "HoPnI-II": true,
      "GS": true,
      "ES": true,
      "AnF": true,
      "Botany": true,
      "Botany-I": true,
      "Botany-II": true,
      "Zoology": true,
      "Zoology-I": true,
      "Zoology-II": true,
      "EL": true,
      "EL-I": true,
      "EL-II": true,
      "UL": true,
      "Law": true,
      "Law-I": true,
      "Law-II": true,
      'CL': true,
      "IL": true,
      'MLnJ': true,
      "ML": true,
      "Criminology": true,
      "Philosophy": true,
      "Philosophy-I": true,
      "Philosophy-II": true,
      "JnMC": true,
      "Psychology": true,
      "Psychology-I": true,
      "Psychology-II": true,
      "Geography": true,
      "Geography-I": true,
      "Geography-II": true,
      "Sociology": true,
      "Anthropology": true,
      "Punjabi": true,
      'Sindhi': true,
      "Balochi": true,
      "Pashto": true,
      "Persian": true,
      "Persian-I": true,
      "Persian-II": true,
      "Arabic": true,
      "Arabic-I": true,
      "Arabic-II": true,
    });

    _db.collection('users_basic_data').doc('$id').collection('my_pms_subjects').doc('$id').
    set({
      'MySubjects': '',
    });


    _db.collection('users_basic_data').doc('$id').collection('pms_subjects_marks').doc('$id').
    set({
      'marks': '',
    });
    // _db.collection('users_basic_data').doc('$id').collection('my_subjects').doc('$id').
    // update({
    //   'MySubjects': FieldValue.delete(),
    // });
    _db.collection('users_basic_data').doc('$id').collection('pms_subjects_bool').doc('$id').
    set({
      'PE-I': true,
      'PE-II': true,
      'PE': true,
      'Eng': true,
      "EE": true,
      "Urdu": true,
      "IS": true,
      "CA": true,
      "Ethics": true,
      "PakS": true,
      "EL":true,
      "EL-I":true,
      "EL-II":true,
      "Economics": true,
      "Economics-I": true,
      "Economics-II": true,
      "Commerce": true,
      "Commerce-I": true,
      "Commerce-II": true,
      "BA": true,
      "BA-I": true,
      "BA-II": true,
      "CS": true,
      "CS-I": true,
      "CS-II": true,
      "PA": true,
      "PA-I": true,
      "PA-II": true,
      "Physics": true,
      "Physics-I": true,
      "Physics-II": true,
      "Chemistry": true,
      "Chemistry-I": true,
      "Chemistry-II": true,
      "Mathematics": true,
      "Mathematics-I": true,
      "Mathematics-II": true,
      "Statistics-I": true,
      "Statistics-II": true,
      "Statistics":true,
      "Geology": true,
      "Geology-I": true,
      "Geology-II": true,
      "PE": true,
      "PE-I": true,
      "PE-II": true,
      "GK": true,
      "Agriculture": true,
      "Agriculture-I": true,
      "Agriculture-II": true,
      "VS": true,
      "VS-I": true,
      "VS-II": true,
      "PS": true,
      "PS-I": true,
      "PS-II": true,
      "History": true,
      "History-I": true,
      "History-II": true,
      "GS": true,
      "ES": true,
      "Botany": true,
      "Botany-I": true,
      "Botany-II": true,
      "Zoology": true,
      "Zoology-I": true,
      "Zoology-II": true,
      "EL": true,
      "EL-I": true,
      "EL-II": true,
      "UL": true,
      "Law": true,
      "Law-I": true,
      "Law-II": true,
      'SW':true,
      'SW-I':true,
      'SW-II':true,
      "Philosophy": true,
      "Philosophy-I": true,
      "Philosophy-II": true,
      "Psychology": true,
      "Psychology-I": true,
      "Psychology-II": true,
      "Geography": true,
      "Geography-I": true,
      "Geography-II": true,
      "Sociology": true,
      "Sociology-I": true,
      "Sociology-II": true,
      "Punjabi": true,
      "Punjabi-I": true,
      "Punjabi-II": true,
      "UrduOptional":true,
      "UrduOptional-I":true,
      "UrduOptional-II":true,
      "Education":true,
      "Education-I":true,
      "Education-II":true,
      "Persian": true,
      "Persian-I": true,
      "Persian-II": true,
      "Arabic": true,
      "Arabic-I": true,
      "Arabic-II": true,
      'MC':true,
      'MC-I':true,
      'MC-II':true,

    });


  }

  confirmOtpmobile()async{
    setState(() => isSelected = false);
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId,
        smsCode: otpCode.text.toString(),);

      await auth.signInWithCredential(credential);


      numberConfirm();


      Navigator.of(context).push(
        PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 500),
          pageBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return signup_complete_screen(
            );
          },
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        ),
      );


    } on FirebaseAuthException catch (e) {
      setState(() => isSelected = true);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid OTP code.')),

      );}
  }

  confirmOtpWeb()async{
    setState(() => isSelected = false);

    try {
      await widget.confirmationResult?.confirm(otpCode.text);


      numberConfirm();

      Navigator.of(context).push(
        PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 500),
          pageBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return signup_complete_screen(
            );
          },
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        ),
      );


    } on FirebaseAuthException catch (e) {
      setState(() => isSelected = true);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid OTP code.')),

      );}
  }





  @override
  Widget build(BuildContext context) {
;

            return
            ResponsiveBuilder(
                builder: (context, sizingInformation){
                  return
                    Scaffold(
                        backgroundColor: AppConstants().primaryWhite, // Set background color
                        body:

                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(height: 1.sh,),
                            Expanded(
                              flex: 1,
                              child: Row(
                                mainAxisAlignment: sizingInformation.deviceScreenType == DeviceScreenType.desktop?
                                MainAxisAlignment.start:MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:  EdgeInsets.all(
                                      MediaQuery.of(context).size.width * 0.01,
                                    ),
                                    child: Image.asset('images/csslogo.png',
                                    ),
                                  ),
                                ],
                              ),
                            ),


                            Expanded(
                              flex: 4,
                              child: Center(
                                child: frostedGlass(
                                  color: AppConstants().grey,
                                  height:sizingInformation.deviceScreenType == DeviceScreenType.desktop?
                                  MediaQuery.of(context).size.height * 0.76:
                                  MediaQuery.of(context).size.height * 0.64,
                                  width: MediaQuery.of(context).size.width * 0.8,
                                  child: Column(

                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                    Text(
                                        'Enter OTP',
                                        style: TextStyle(
                                            fontSize:4.sh,
                                            fontWeight: FontWeight.w300,
                                            color:AppConstants().primaryGreen)),



                                    Text(
                                        'Enter 6 digits OTP sent on ${widget.phoneNum}',
                                        style: TextStyle(
                                          fontSize: 2.5.sh, fontWeight: FontWeight.w300,
                                          color: AppConstants().primaryGreen,)),


                                    //otp code input row
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width:
                                          sizingInformation.deviceScreenType == DeviceScreenType.desktop?
                                          50.sw
                                              :sizingInformation.deviceScreenType == DeviceScreenType.tablet?
                                          50.sw
                                              :70.sw,
                                          child: TextFormField(
                                              style: TextStyle(
                                                color: AppConstants().primaryGreen,
                                                fontSize: 2.5.sh,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              controller: otpCode,
                                              keyboardType: TextInputType.number,
                                              decoration: InputDecoration(
                                                //counterText: "",
                                                filled: true,
                                                fillColor: AppConstants().primaryWhite,
                                                labelText: 'Enter OTP',
                                                labelStyle: TextStyle(
                                                    color: AppConstants().grey,
                                                  fontSize: 2.sh
                                                ),
                                                border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(
                                                      2.sw),),)),
                                        ),
                                        // SizedBox(width: screenHeight * 0.09),
                                        // Container(
                                        //     height: screenHeight * 0.02,
                                        //     width: screenWidth * 0.08,
                                        //     child:
                                        //
                                        //     resend_otp(
                                        //       verificationId: widget.verificationId, mobNum: widget.phoneNum,)),

                                      ],),




                                      //contact us
                                Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin:const EdgeInsets.only(left: 50.0,),
                                            child:  Text(
                                                'Contact us',
                                                style: TextStyle(
                                                  fontSize: 2.sh,
                                                  color:AppConstants().primaryGreen,
                                                )
                                            ),
                                          ),

                                          SizedBox(width: 1.sw,),
                                          InkWell(
                                            onTap: ()async{
                                              await launchUrl(whatsApp);
                                            },
                                            child: Image.asset(
                                              'images/whatsapp.png',
                                              // Replace with your logo image path
                                              height: 5.sh,
                                              width: 5.sw,
                                            ),
                                          ),

                                          SizedBox(width: 15.sw,),
                                          Container(
                                            // height:  sizingInformation.deviceScreenType == DeviceScreenType.desktop?
                                            // 3.sh
                                            //     :sizingInformation.deviceScreenType == DeviceScreenType.tablet?
                                            // 3.sh
                                            //     :2.sh,
                                            // width: sizingInformation.deviceScreenType == DeviceScreenType.desktop?
                                            // 22.sw
                                            //     :sizingInformation.deviceScreenType == DeviceScreenType.tablet?
                                            // 21.sw
                                            //     :19.sw,
                                            height:3.2.sh,
                                            width: 20.sw,

                                          child: resend_otp(verificationId: widget.verificationId, mobNum: widget.phoneNum),
                                          ),
                                        ],
                                      ),



                                    //button
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                            height:3.6.sh,
                                            width: 33.sw,
                                          // height:  sizingInformation.deviceScreenType == DeviceScreenType.desktop?
                                          // 3.5.sh
                                          //     :sizingInformation.deviceScreenType == DeviceScreenType.tablet?
                                          // 3.5.sh
                                          //     :2.5.sh,
                                          // width: sizingInformation.deviceScreenType == DeviceScreenType.desktop?
                                          // 25.sw
                                          //     :sizingInformation.deviceScreenType == DeviceScreenType.tablet?
                                          // 24.sw
                                          //     :20.5.sw,

                                          child:
                                          isSelected?
                                          ElevatedButton(
                                            onPressed: ()
                                           async  {

                                             setState(() => isSelected = false);
                                              kIsWeb?
                                              confirmOtpWeb()
                                              :confirmOtpmobile();

                                            },
                                            child: Text('Verify', style: TextStyle(  fontSize: 2.sh,),),
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: AppConstants().lightGreen,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(4.sw),),),
                                          ):

                                            ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: AppConstants().lightGrey,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(6.sw),),),
                                                onPressed: null,
                                                child: Text('Please wait...',
                                                    style: TextStyle(
                                                        fontSize: 2.sh,
                                                        color:AppConstants().primaryWhite)))
                                        )
                                      ],
                                    ),

                                  ],),),
                              ),
                            )
                            ,],));
                }
            );



  }}









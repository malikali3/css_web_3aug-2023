import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_css_web/signup%20flow/receive_otp.dart';
import 'package:new_css_web/widgets/frosted_glass_effect.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import '../widgets/size_variables.dart';




class enter_mobile_num extends StatefulWidget {
  const enter_mobile_num({super.key});





  @override
  State<enter_mobile_num> createState() => _enter_mobile_numState();
}


class _enter_mobile_numState extends State<enter_mobile_num>  {
  final phoneNumberController = TextEditingController();
  String initialCountry = 'PK';
  PhoneNumber number = PhoneNumber(isoCode: 'PK');
  String countryCode = "";
  String phoneNum = "";
  bool isSelected = true;
  final otpCode = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ConfirmationResult? confirmationResult;
  var verificationId = "".toString();
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  bool numberExist = false;

  numberVerificaitionForMobile()async{
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.verifyPhoneNumber(
        phoneNumber: phoneNum,
        timeout: const Duration(seconds: 60),
        codeAutoRetrievalTimeout: (String verificationId) {
          // Auto-resolution timed out...
        }, verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {},
        verificationFailed: (FirebaseAuthException error) {  },
        codeSent: (String verificationId, int? forceResendingToken) {
          Navigator.of(context).push(
              PageRouteBuilder(
                transitionDuration: Duration(
                    milliseconds: 500),
                pageBuilder: (
                    BuildContext context,
                    Animation<double> animation,
                    Animation<
                        double> secondaryAnimation) {
                  return enter_otp(verificationId: verificationId, numberExist: numberExist, phoneNum: phoneNum, confirmationResult: confirmationResult,);
                },
                transitionsBuilder: (
                    BuildContext context,
                    Animation<double> animation,
                    Animation<
                        double> secondaryAnimation,
                    Widget child) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(1, 0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  );
                },
              ));

        }
    );}
  numberVerificaitionForWeb()async{
    confirmationResult =  await auth.signInWithPhoneNumber(phoneNum);
    Navigator.of(context).push(
        PageRouteBuilder(
          transitionDuration: Duration(
              milliseconds: 500),
          pageBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<
                  double> secondaryAnimation) {
            return enter_otp(verificationId: verificationId, numberExist: numberExist, phoneNum: phoneNum, confirmationResult: confirmationResult,);
          },
          transitionsBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<
                  double> secondaryAnimation,
              Widget child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        ));
  }

  //function to check user number and create one in database
  void numberConfirm()async{
    try {

      CollectionReference collectionRef = FirebaseFirestore.instance.collection('users_basic_data');
      final User? user = FirebaseAuth.instance.currentUser;
      final id = user?.uid;
      await collectionRef.get().then((QuerySnapshot querySnapshot) {
        for (var doc in querySnapshot.docs) {
          // Access each document using doc.data() or doc.get('field_name')

          // Perform your conditional statement
          if (doc.get('phoneNumber') == phoneNum) {
            setState(() {
              numberExist = true;
            });}
          else {
            setState(() {
              numberExist = false;
            });
          }}});


      numberExist?
      null:
      _db.collection('users_basic_data').doc('$id').set({
        'email': '',
        'name': '',
        'phoneNumber': phoneNum,
      });


    } catch (e) {
      print('Error retrieving documents: $e');
    }
  }


  @override

  Widget build(BuildContext context) {

    return

      ResponsiveBuilder(
          builder: (context, sizingInformation){
            return
              Scaffold(
                  backgroundColor:AppConstants().primaryWhite, // Set background color
                  body:
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 1.sh,
                      ),
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
                              height:
                              sizingInformation.deviceScreenType == DeviceScreenType.desktop?
                              MediaQuery.of(context).size.height * 0.75:
                              MediaQuery.of(context).size.height * 0.6,
                              width: MediaQuery.of(context).size.width * 0.8,
                              child:

                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                Text(
                                    'Sign up', textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize:4.sh,
                                      fontWeight: FontWeight.w600,
                                      color: AppConstants().primaryGreen,)),


                                //enter mobile num line
                                Text(
                                    'Enter mobile number for OTP',textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 2.5.sh,
                                        fontWeight: FontWeight.w400,
                                        color: AppConstants().primaryGreen)),

                                //enter your mobile field
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width:
                                      sizingInformation.deviceScreenType == DeviceScreenType.desktop?
                                      70.sw
                                          :sizingInformation.deviceScreenType == DeviceScreenType.tablet?
                                      70.sw
                                          :70.sw,
                                      //if height is there the container will be out aligened
                                      // height: screenHeight * 0.08,
                                      child: Form(
                                        key: _formKey,
                                        child: InternationalPhoneNumberInput(
                                          validator: (phoneNum){
                                            if(phoneNum!.isEmpty){
                                              return "Please enter a valid phone number";}

                                            else if(!
                                            RegExp(r'^\+?(\d{1,4})?[-.\s]?\(?(\d{3})\)?[-.\s]?(\d{4})[-.\s]?(\d{2})[-.\s]?(\d{1})$')
                                                .hasMatch(phoneNum)){

                                              return "not a valid number";
                                            }
                                          },
                                          textStyle: TextStyle(
                                            color: AppConstants().primaryGreen,
                                            fontSize: 2.sh,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          cursorColor: AppConstants().primaryGreen,
                                          inputDecoration: InputDecoration(
                                            border:  OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(2.sw),
                                            ),
                                            fillColor: AppConstants().primaryWhite,
                                            filled: true,
                                            labelText: 'Enter Mobile Number',
                                            labelStyle: TextStyle(
                                                color: AppConstants().grey,
                                                fontSize: 2.sh
                                            ),
                                            // focusedBorder: const OutlineInputBorder(
                                            //   borderSide: BorderSide(
                                            //     color: Color(0xff213139),
                                            //   ),
                                            // ),
                                            // enabledBorder: const OutlineInputBorder(
                                            //   borderSide: BorderSide(
                                            //     color: Color(0xff213139),
                                            //   ),
                                            // ),
                                            // hintText: 'Enter mobile number',
                                            // hintStyle: TextStyle(
                                            //   color: primaryGreen,
                                            //   fontSize: tileText,)
                                          ),


                                          onInputChanged: (PhoneNumber number) {
                                            print("aleena:${number.phoneNumber}");
                                            _formKey.currentState?.validate();

                                            setState(() {
                                              phoneNum = number.phoneNumber!;

                                            });
                                          },
                                          // onInputValidated: (bool value) {
                                          //   print("input validator: $value");
                                          //   setState(() {
                                          //     validator=value;
                                          //   });
                                          //},
                                          selectorConfig: const SelectorConfig(
                                            selectorType: PhoneInputSelectorType.DIALOG,
                                          ),
                                          spaceBetweenSelectorAndTextField: 0,
                                          ignoreBlank: true,
                                          autoValidateMode: AutovalidateMode.disabled,
                                          selectorTextStyle:
                                          TextStyle(color: AppConstants().primaryGreen, fontSize:  1.5.sh),
                                          initialValue: number,
                                          textFieldController: phoneNumberController,
                                          formatInput: false,
                                          keyboardType: TextInputType.number,
                                          inputBorder: const OutlineInputBorder(),
                                          onSaved: (PhoneNumber number) {
                                            print('On Saved: $number');},),
                                      ),),


                                  ],),



                                //button
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                        height:3.7.sh,
                                        width: 33.sw,
                                        child:
                                        isSelected?
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: AppConstants().lightGreen,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(4.sw),),),


                                            onPressed: () async {

                                              if(phoneNum.isEmpty){
                                                _formKey.currentState?.validate();
                                              }

                                              else{
                                                setState(() => isSelected = false);
                                                kIsWeb?
                                                numberVerificaitionForWeb()
                                                    : numberVerificaitionForMobile();
                                              }
                                            },
                                            child: Text('Send OTP',
                                                style: TextStyle(
                                                    fontSize: 2.sh,
                                                    color: AppConstants().primaryWhite)))
                                            :
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: AppConstants().lightGrey,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(6.sw),),),
                                            onPressed: null,
                                            child: Text('Please wait...',
                                                style: TextStyle(
                                                    fontSize: 2.sh,
                                                    color:AppConstants().primaryWhite)))),
                                  ],),
                              ],),)),
                      ),
                SizedBox(
                height: 1.sh,
              ),
                      ],));
          });





  }}










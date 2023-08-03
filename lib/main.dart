import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:new_css_web/home_screen_flow/assignment.dart';
import 'package:new_css_web/showing_css_subjects/my_css_subjects.dart';
import 'package:new_css_web/home_screen_flow/home.dart';
import 'package:new_css_web/home_screen_flow/my_subjects_screen.dart';
import 'package:new_css_web/home_screen_flow/share_tip_screen.dart';
import 'package:new_css_web/signup%20flow/enter_mob_num.dart';
import 'package:new_css_web/signup%20flow/receive_otp.dart';
import 'package:new_css_web/signup%20flow/signup_complete_screen.dart';
import 'package:new_css_web/widgets/MyCustomScrollBehaviour.dart';
import 'package:new_css_web/widgets/getX_class.dart';
import 'package:new_css_web/widgets/subject_add_animation.dart';
import 'package:new_css_web/widgets/size_variables.dart';
import 'package:new_css_web/widgets/frosted_glass_effect.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:new_css_web/main.dart' as MyPage;
import 'package:get/get.dart';
import 'home_screen_flow/home.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'home_screen_flow/rough.dart';
import 'not_signed_up/home_screen_for_not_sign_in.dart';






// void main() {
//   runApp(const MyApp());
// }
Future <void> main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
        authDomain: "cssnewweb.firebaseapp.com",
        apiKey: "AIzaSyBaBUdWK_M9qV5qA0EF20ynO6HpP27R5DE",
        appId: "1:879625237053:web:00aec4f03abbb4ad53b054",
        messagingSenderId: "879625237053",
        projectId: "muqabla-56b3a",
        storageBucket: "muqabla-56b3a.appspot.com",
        databaseURL: "https://muqabla-56b3a.firebaseio.com",
      ));

  runApp(  MyApp(),);}

class MyApp extends StatelessWidget {

  late StreamSubscription<User?> user;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? _currentUser;




  @override
  Widget build(BuildContext context) {
    return
   ResponsiveApp(builder: (context) =>
       MaterialApp(
     scrollBehavior: MyCustomScrollBehaviour(),
     debugShowCheckedModeBanner: false,
     title: 'Flutter Demo',
     theme: ThemeData(
       useMaterial3: true,
       primarySwatch: Colors.blue,
       textTheme: GoogleFonts.asapTextTheme(Theme.of(context).textTheme,),


     ),
     // initialRoute: _currentUser == null?'landingPage':'afterLoginPage',
     // routes: {
     //   'landingPage': (context) => MyHomePage(title: "css"),
     //   'afterLoginPage': (context) => home(),
     // },

     home:
      //FirebaseAuth.instance.currentUser != null ?
     home_not_user(),
     // years(subject: 'hi',),
     //yearsList_realtime(subject: 'EE',),
     //my_subjects_screen(),
     //ContainerGrid(),
     //css_screen(),
     //GridExample(),
     //css_subject_main(),
     // enter_name(),
     //signup_complete_screen(),
     //enter_name(),
     // buttons(),
     //assign()
     //check(),
        // aniCon(),
       //home()
     //arabic_after_2016(),
     //pdf_file(value: 'hello',),
     // search_past_question_papers(),
     //search_screen(),
     //CelebrationScreen(),
     //share_tip_screen(),
     // student_dashboard(),
     //buttons(),
     //enter_otp(numberExist: false, phoneNum: 'hello', verificationId: 'hello', confirmationResult: 'hello',),
      //enter_mobile_num()
     //sign_up(),
    //:MyHomePage(title: 'CSS'),
     //ScrollIconExample(),
      //home_screen_after_login(title: 'CSS',),
     // ShakyFolderAnimation(),

   ));


  }}



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;


  @override
  State<MyHomePage> createState() => _MyHomePageState();}

class _MyHomePageState extends State<MyHomePage>  with SingleTickerProviderStateMixin {



  @override


  //this animation is for glowing green color on bottom button
  late AnimationController _animationController;
  late Animation _animation;
  Services services= Get.put(Services());


  //this function is for glowing green color on bottom button
  void initState(){
    _animationController = AnimationController(
        vsync: this, duration: const Duration(seconds: 2));
    _animationController.repeat(reverse: true);
    _animation = Tween(begin: 2.0, end: 15.0).animate(_animationController)..addListener(() {
      setState(() {});
    });
    super.initState();
  }







  // final Uri whatsApp = Uri.parse('https://wa.me/+923032777297');
  // final Uri apprays = Uri.parse('https://www.apprays.io/');
  // final Uri googleStoreLink = Uri.parse('https://play.google.com/store/apps/details?id=romasakhalid.css');
  //
  // final Uri instagram = Uri.parse('https://www.instagram.com/cssexamcompanion/');
  // final Uri facebook = Uri.parse('https://web.facebook.com/cssexampak/');
  // final Uri youtube = Uri.parse('https://www.youtube.com/@cssexamcompanion8313');




  //check if app is running on web or app
  var isWeb = kIsWeb;



  @override
  Widget build(BuildContext context) {
            return

            ResponsiveBuilder(
                builder: (context, sizingInformation){
                  return
                    SafeArea(
                      child: Scaffold(
                          backgroundColor: AppConstants().primaryWhite,
                          body:
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  child: frostedGlass(
                                      width: 60.sw,
                                      height: sizingInformation.deviceScreenType == DeviceScreenType.desktop?
                                      30.sh
                                      :sizingInformation.deviceScreenType == DeviceScreenType.tablet?
                                      35.sh
                                      :45.sh,
                                      color: AppConstants().grey,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'images/csslogo.png',
                                            // Replace with your logo image path
                                            width: 15.sw,
                                            height:15.sh,
                                          ),

                                       Center(
                                            child: Text(
                                                'Exam Preparation App', textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 3.5.sh,
                                                  color: AppConstants().primaryGreen,
                                                )
                                            ),
                                          ),],)),
                                ),
                                InkWell(
                                  child: Container(
                                    width:   sizingInformation.deviceScreenType == DeviceScreenType.desktop?
                                  5.sw
                                    : 8.sw,
                                    height: sizingInformation.deviceScreenType == DeviceScreenType.desktop?
                                    7.sh
                                        :sizingInformation.deviceScreenType == DeviceScreenType.tablet?
                                    9.sh
                                        :10.sh,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5.sh),
                                        color:AppConstants().primaryGreen,
                                        boxShadow: [BoxShadow(
                                          color: AppConstants().lightGreen,
                                          blurRadius: _animation.value,
                                          spreadRadius: _animation.value,
                                        )]
                                    ),
                                    child:Icon(Icons.keyboard_arrow_up, size: 5.sw, color: AppConstants().white,),
                                  ),
                                  onTap: () {
                                    Navigator.of(context).push(
                                      PageRouteBuilder(
                                        transitionDuration: const Duration(milliseconds: 500),
                                        pageBuilder: (BuildContext context,
                                            Animation<double> animation,
                                            Animation<double> secondaryAnimation) {
                                          return  enter_mobile_num();
                                        },
                                        transitionsBuilder: (BuildContext context,
                                            Animation<double> animation,
                                            Animation<double> secondaryAnimation,
                                            Widget child) {
                                          return SlideTransition(
                                            position: Tween<Offset>(
                                              begin: const Offset(0, 1),
                                              end: Offset.zero,
                                            ).animate(animation),
                                            child: child,
                                          );
                                        },
                                      ),
                                    );
                                  },


                                )


                              ],
                            ),
                          )
                      ),
                    );
                }
            );



  }
}

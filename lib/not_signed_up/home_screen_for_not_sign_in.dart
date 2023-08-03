import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:new_css_web/home_screen_flow/my_subjects_screen.dart';
import 'package:new_css_web/showing_css_subjects/all_single_subjects_containers.dart';
import 'package:new_css_web/showing_css_subjects/css_mcq.dart';
import 'package:new_css_web/widgets/empty_widget.dart';
import 'package:new_css_web/widgets/frosted_glass_effect.dart';
import '../check_this_shit.dart';
import '../pms subjects/pms_main_subjects.dart';
import '../pms subjects/pms_mcq.dart';
import '../showing_css_subjects/css_subjects.dart';
import '../showing_css_subjects/mcq_pdf_sindhi&punjabi.dart';
import 'pms_not_user.dart';
import '../showing_css_subjects/search_subjects.dart';
import '../widgets/getX_class.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:new_css_web/widgets/size_variables.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'css_not_sign_in.dart';




class home_not_user extends StatefulWidget {
  const home_not_user({super.key});

  @override
  State<home_not_user> createState() => _home_not_userState();

}
class _home_not_userState extends State<home_not_user> {
  final Uri apprays = Uri.parse('https://www.apprays.io/');


  @override
  void initState() {
    super.initState();
    _simulateLoading();
  }

  ScrollController _scrollController = ScrollController();


  // this is loader
  bool _isLoading = true;
  Future<void> _simulateLoading() async {
    await Future.delayed(Duration(milliseconds: 2200));
    setState(() {
      _isLoading = false;
    });
  }

  void scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override


  Widget build(BuildContext context)  {

    Services services= Get.put(Services());
    Services services1 =Get.find();
    final User? user = FirebaseAuth.instance.currentUser;
    final id = user?.uid;


    return
      _isLoading ? _buildLoadingIndicator() :
      ResponsiveBuilder(
          builder: (context, sizingInformation) {

            final Uri whatsApp =
            kIsWeb?
            Uri.parse('https://wa.me/+923032777297')
                :Uri.parse('whatsapp://send?phone=+923032777297');
            final Uri apprays = Uri.parse('https://www.apprays.io/');
            final Uri fb =   Uri.parse('https://web.facebook.com/cssexampak/');
            final Uri yt =  Uri.parse('https://www.youtube.com/@cssexamcompanion8313');
            final Uri insta =  Uri.parse('https://www.instagram.com/cssexamcompanion/');
            final Uri whatsAppCom = Uri.parse('https://chat.whatsapp.com/G2Tem0LdqzW7ZVVJ3WEwpQ');


            return

              SafeArea(
                // this is for bottom expandable icon
                child:
                Scaffold(
                    appBar: AppBar(
                      automaticallyImplyLeading: false,
                      toolbarHeight:
                      MediaQuery.of(context).size.width>1170?
                      6.sh:
                      MediaQuery.of(context).size.width>950?
                      6.sh:
                      MediaQuery.of(context).size.width>560?
                      6.sh:
                      MediaQuery.of(context).size.width>380?
                      6.sh
                          :6.sh,
                      backgroundColor: AppConstants().paleGrey,
                      title: Obx(()=>
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,

                            children: [

                              Text(services1.isCss.value.toString(), style: TextStyle(
                                color: AppConstants().primaryWhite, fontSize: 0,
                              ),),
                              // SizedBox(height: 4.sh,),
                              // Image.asset(
                              //   'images/csslogo.png',
                              //   // Replace with your logo image path
                              //   width: 15.sw,
                              //   height:15.sh,
                              // ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [

                                  InkWell(
                                      onTap: (){scrollToTop();
                                      services1.isCssClicked();
                                      },
                                      child:
                                      Text(
                                        ('CSS'),
                                        style: TextStyle(
                                          fontSize:1.5.sh,
                                          color:  services1.isCss.value ? AppConstants().lightGreen: AppConstants().grey,
                                          fontWeight:  services1.isCss.value ? FontWeight.w600 : FontWeight.w200,
                                        ),)

                                  ),
                                  InkWell(
                                      onTap: (){scrollToTop();
                                      services1.isPmsClicked();
                                      },
                                      child:
                                      Text(
                                        ('PMS'),
                                        style: TextStyle(
                                          fontSize:1.5.sh,
                                          color:  services1.isPms.value ? AppConstants().lightGreen: AppConstants().grey,
                                          fontWeight:  services1.isPms.value ? FontWeight.w600 : FontWeight.w200,
                                        ),)

                                  ),

                                  Text('My Profile', style: TextStyle(fontSize: 1.5.sh,
                                      color:AppConstants().primaryGreen )),
                                  //Text('Buy Subscription', style: TextStyle(fontSize:  1.5.sh,
                                  //  color:AppConstants().primaryGreen )),
                                  InkWell(
                                    onTap: ()async{
                                      await launchUrl(whatsAppCom);
                                    },
                                    child: Text('Join our group', style: TextStyle(fontSize:  1.5.sh,
                                        color:AppConstants().primaryGreen )),
                                  ),
                                  InkWell(
                                    onTap: ()async{
                                      await launchUrl(whatsApp);
                                    },
                                    child: Text('Contact us', style: TextStyle(fontSize:  1.5.sh,
                                        color:AppConstants().primaryGreen )),
                                  ),
                                  // Text('Premimum User', style: TextStyle(fontSize:  1.5.sh,
                                  //   color:AppConstants().primaryGreen )),
                                  // Text('Delete Account', style: TextStyle(fontSize:  1.5.sh,
                                  //     color: Colors.red )),
                                  // InkWell(
                                  //   onTap: ()async{
                                  //     await launchUrl(yt);
                                  //   },
                                  //   child: Image.asset('images/yt.png',
                                  //     height:
                                  //     sizingInformation.deviceScreenType == DeviceScreenType.desktop?
                                  //     3.sh: 5.sh,
                                  //     width:
                                  //     sizingInformation.deviceScreenType == DeviceScreenType.desktop?
                                  //     5.sw: 7.sw,
                                  //     color: AppConstants().primaryGreen,
                                  //   ),
                                  // ),
                                  // InkWell(
                                  //   onTap: ()async{
                                  //     await launchUrl(fb);
                                  //   },
                                  //   child: Image.asset('images/fb.png',
                                  //     height:
                                  //     sizingInformation.deviceScreenType == DeviceScreenType.desktop?
                                  //     3.sh: 5.sh,
                                  //     width:
                                  //     sizingInformation.deviceScreenType == DeviceScreenType.desktop?
                                  //     5.sw: 7.sw,
                                  //     color: AppConstants().primaryGreen,
                                  //   ),
                                  // ),
                                  // InkWell(
                                  //   onTap: ()async{
                                  //     await launchUrl(insta);
                                  //   },
                                  //   child: Image.asset('images/ins.png',
                                  //     height:
                                  //     sizingInformation.deviceScreenType == DeviceScreenType.desktop?
                                  //     3.sh: 5.sh,
                                  //     width:
                                  //     sizingInformation.deviceScreenType == DeviceScreenType.desktop?
                                  //     5.sw: 7.sw,
                                  //     color: AppConstants().primaryGreen,
                                  //   ),
                                  // ),
                                  // InkWell(
                                  //   onTap: ()async{
                                  //     await launchUrl(apprays);
                                  //   },
                                  //   child: ClipRRect(
                                  //     borderRadius: BorderRadius.circular(2.sw),
                                  //     child: Image.asset('images/arlogo.png',
                                  //       height:
                                  //       sizingInformation.deviceScreenType == DeviceScreenType.desktop?
                                  //       3.sh: 5.sh,
                                  //       width:
                                  //       sizingInformation.deviceScreenType == DeviceScreenType.desktop?
                                  //       5.sw: 7.sw,
                                  //     ),
                                  //   ),
                                  // ),

                                ],),

                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              //   children: [
                              //     Padding(
                              //       padding: EdgeInsets.only(
                              //         left:6.sw,
                              //         right: 6.sw,
                              //       ),
                              //       child: InkWell(
                              //         onTap: services1.isMySubjects.value?
                              //             (){services1.isSyllabusClicked();}:
                              //         null,
                              //         child: Text(
                              //           ('Syllabus'),
                              //           style: TextStyle(
                              //             fontSize: 2.2.sh,
                              //             color:
                              //             services1.isMySubjects.value?
                              //             services1.isSyllabus.value ? AppConstants().lightGreen: AppConstants().grey:
                              //             AppConstants().primaryWhite,
                              //             fontWeight:  services1.isSyllabus.value ? FontWeight.w600 : FontWeight.w200,
                              //           ),),
                              //       ),
                              //     ),
                              //     SizedBox(width: 2.sw,),
                              //     Padding(
                              //       padding: EdgeInsets.only(
                              //         left:6.sw,
                              //         right: 6.sw,
                              //       ),
                              //       child: InkWell(
                              //         onTap:
                              //         services1.isMySubjects.value?
                              //             (){services1.isPastSubjectiveSelected();}:
                              //         null,
                              //         child: Text(
                              //           ('Past Subjective Papers'),
                              //           style: TextStyle(
                              //             fontSize:  2.2.sh,
                              //
                              //             color:
                              //             services1.isMySubjects.value?
                              //             services1.isPastSubjective.value ? AppConstants().lightGreen: AppConstants().grey:
                              //             AppConstants().primaryWhite,
                              //             fontWeight:  services1.isPastSubjective.value ? FontWeight.w600 : FontWeight.w200,
                              //           ),),
                              //       ),
                              //     ),
                              //     SizedBox(width: 2.sw,),
                              //     Padding(
                              //       padding: EdgeInsets.only(
                              //         left:6.sw,
                              //         right: 6.sw,
                              //       ),
                              //       child: InkWell(
                              //         onTap:
                              //         services1.isMySubjects.value?
                              //             (){services1.isBooksSelected();}:
                              //         null,
                              //         child: Text(
                              //           ('Books'),
                              //           style: TextStyle(
                              //             fontSize:  2.2.sh,
                              //
                              //             color:
                              //             services1.isMySubjects.value?
                              //             services1.isBooks.value ? AppConstants().lightGreen: AppConstants().grey:
                              //             AppConstants().primaryWhite,
                              //             fontWeight:  services1.isBooks.value ? FontWeight.w600 : FontWeight.w200,
                              //           ),),
                              //       ),
                              //     ),
                              //     SizedBox(width: 2.sw,),
                              //     Padding(
                              //       padding: EdgeInsets.only(
                              //         left:6.sw,
                              //         right: 6.sw,
                              //       ),
                              //       child: InkWell(
                              //         onTap: services1.isMySubjects.value?
                              //             (){services1.isMCQClicked();}:
                              //         null,
                              //         child: Text(
                              //           ("MCQ's"),
                              //           style: TextStyle(
                              //             fontSize:  2.2.sh,
                              //             color:
                              //             services1.isMySubjects.value?
                              //             services1.isMCQ.value ? AppConstants().lightGreen: AppConstants().grey:
                              //             AppConstants().primaryWhite,
                              //             fontWeight:  services1.isMCQ.value ? FontWeight.w600 : FontWeight.w200,
                              //           ),),
                              //       ),
                              //     ),
                              //   ],),
                            ],)





                      ),

                    ),
                    backgroundColor: AppConstants().primaryWhite,
                    drawer: Drawer(
                      width: 70.sw,
                      backgroundColor: AppConstants().lightGrey,
                      shape:  RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(2.sw),
                            bottomRight: Radius.circular(2.sw)),
                      ),

                      child: frostedGlass(
                          width: 50.sw,
                          height: 100.sw,
                          color: AppConstants().paleGrey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(height: 3.sh),
                              ListTile (
                                  title: Column(
                                    children: [
                                      Text('Premimum User', style: TextStyle(fontSize:  2.2.sh,
                                          color:AppConstants().primaryGreen )),
                                      Container(height: 0.2.sh,
                                        width: 60.sw,
                                        color: Colors.white,
                                      )
                                    ],)
                              ),
                              ListTile (
                                  title: Row(
                                    children: [
                                      Text('Edit Profile', style: TextStyle(fontSize: 2.2.sh,
                                          color:AppConstants().primaryGreen )),
                                    ],
                                  )

                              ),
                              ListTile (
                                  title: Row(
                                    children: [
                                      Text('Buy Subscription', style: TextStyle(fontSize:  2.2.sh,
                                          color:AppConstants().primaryGreen )),
                                    ],
                                  )
                              ),
                              ListTile (
                                  title: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        onTap: ()async{
                                          await launchUrl(whatsAppCom);
                                        },
                                        child: Text('Join our group', style: TextStyle(fontSize:  2.2.sh,
                                            color:AppConstants().primaryGreen )),
                                      ),
                                    ],
                                  )
                              ),
                              ListTile (
                                  title: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        onTap: ()async{
                                          await launchUrl(whatsApp);
                                        },
                                        child: Text('Contact us', style: TextStyle(fontSize:  2.2.sh,
                                            color:AppConstants().primaryGreen )),
                                      ),
                                    ],
                                  )
                              ),
                              ListTile (
                                  title: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text('Delete Account', style: TextStyle(fontSize:  2.2.sh,
                                          color: Colors.red )),],
                                  )
                              ),
                              Container(height: 0.2.sh,
                                width: 60.sw,
                                color: Colors.white,
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    InkWell(
                                      onTap: ()async{
                                        await launchUrl(yt);
                                      },
                                      child: Image.asset('images/yt.png',
                                        height:
                                        sizingInformation.deviceScreenType == DeviceScreenType.desktop?
                                        3.sh: 5.sh,
                                        width:
                                        sizingInformation.deviceScreenType == DeviceScreenType.desktop?
                                        5.sw: 7.sw,
                                        color: AppConstants().primaryGreen,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: ()async{
                                        await launchUrl(fb);
                                      },
                                      child: Image.asset('images/fb.png',
                                        height:
                                        sizingInformation.deviceScreenType == DeviceScreenType.desktop?
                                        3.sh: 5.sh,
                                        width:
                                        sizingInformation.deviceScreenType == DeviceScreenType.desktop?
                                        5.sw: 7.sw,
                                        color: AppConstants().primaryGreen,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: ()async{
                                        await launchUrl(insta);
                                      },
                                      child: Image.asset('images/ins.png',
                                        height:
                                        sizingInformation.deviceScreenType == DeviceScreenType.desktop?
                                        3.sh: 5.sh,
                                        width:
                                        sizingInformation.deviceScreenType == DeviceScreenType.desktop?
                                        5.sw: 7.sw,
                                        color: AppConstants().primaryGreen,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: ()async{
                                        await launchUrl(apprays);
                                      },
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(2.sw),
                                        child: Image.asset('images/arlogo.png',
                                          height:
                                          sizingInformation.deviceScreenType == DeviceScreenType.desktop?
                                          3.sh: 5.sh,
                                          width:
                                          sizingInformation.deviceScreenType == DeviceScreenType.desktop?
                                          5.sw: 7.sw,
                                        ),
                                      ),
                                    ),]),
                            ],)
                      ),
                    ),

                    body:
                    Obx(()=>
                        SafeArea(
                            child:
                            SingleChildScrollView(
                                controller: _scrollController,
                                child:
                                Column(children: [


                                  AnimatedSwitcher(
                                    duration: Duration(milliseconds: 700),
                                    transitionBuilder: (child, animation) => RotationTransition(turns: animation, child: child),
                                    child: services1.isCss.value?   css_subjects_not_user() :empty_widget(),
                                  ),



                                  // AnimatedSwitcher(
                                  //   duration: Duration(milliseconds: 700),
                                  //   transitionBuilder: (child, animation) => ScaleTransition(scale: animation, child: child),
                                  //   child: services1.isMySubjects.value ?  my_subjects_screen(): empty_widget(),
                                  // ),


                                  AnimatedSwitcher(
                                    duration: Duration(milliseconds: 700),
                                    transitionBuilder: (child, animation) => RotationTransition(turns: animation, child: child),
                                    child:  services1.isPms.value?  pms_subjects_not_user():empty_widget(),
                                  ),

                                ],)
                            )),),


                    floatingActionButton:
                    Builder(
                        builder: (context) {
                          return
                            FloatingActionButton(
                                backgroundColor: AppConstants().lightGreen,
                                onPressed: () {
                                  Scaffold.of(context).openDrawer();},
                                child:
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.sw),
                                      border: Border.all(
                                        color:  AppConstants().lightGreen,
                                        width: 1.5.sw,),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.2),
                                          spreadRadius: 4,
                                          blurRadius: 10,
                                          offset: Offset(5, 10),
                                        )
                                      ]),
                                  child: Image.asset('images/csslogo.png',
                                    width: 15.sw,
                                    height: 15.sh,

                                  ),
                                )
                            );
                        })),);});}
}


Widget _buildLoadingIndicator() {
  return Center(
    child: CircularProgressIndicator(), // You can customize the loading indicator as per your preference
  );
}


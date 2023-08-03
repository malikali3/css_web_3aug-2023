
//this is bottom expandable button

// //bottom expandable button
// floatingActionButton:
//
// SizedBox(
// // to set the size of speedDial icon
// height: iconSize * 2.3,
// width: iconSize * 2.3,
// child: SpeedDial(
// //set the size of background circles of speeddial children
// childrenButtonSize: Size(iconSize * 2.5, iconSize * 2.5),
//
// openCloseDial: isDialOpen,
// //closeManually: true,
// animatedIcon: AnimatedIcons.menu_close,
// foregroundColor:white,
// backgroundColor: lightGreen,
// spaceBetweenChildren: circleSize * 0.04,
// spacing: circleSize * 0.03,
// overlayColor: Colors.black,
// overlayOpacity: 0.5,
// children: [
//
// SpeedDialChild(
// child: Icon(Icons.menu_book_outlined, color:lightGreen, size: iconSize,),
// label: "CSS",
// labelStyle: TextStyle(fontSize: buttonText),
// backgroundColor: lightGrey,
// onTap: (){
// Navigator.of(context).push(
// PageRouteBuilder(
// transitionDuration: const Duration(milliseconds: 500),
// pageBuilder: (BuildContext context,
// Animation<double> animation,
// Animation<double> secondaryAnimation) {
// return css_screen();
// },
// transitionsBuilder: (BuildContext context,
// Animation<double> animation,
// Animation<double> secondaryAnimation,
// Widget child) {
// return SlideTransition(
// position: Tween<Offset>(
// begin: const Offset(1, 0),
// end: Offset.zero,
// ).animate(animation),
// child: child,
// );
// },
// ),
// );
// },
// ),
//
// SpeedDialChild(
// child: Icon(Icons.menu_book_outlined, color:lightGreen, size: iconSize,),
// label: "PMS",
// labelStyle: TextStyle(fontSize: buttonText),
// backgroundColor: lightGrey,
// onTap: () {
// Navigator.of(context).push(
// PageRouteBuilder(
// transitionDuration: const Duration(milliseconds: 500),
// pageBuilder: (BuildContext context,
// Animation<double> animation,
// Animation<double> secondaryAnimation) {
// return pms_screen();
// },
// transitionsBuilder: (BuildContext context,
// Animation<double> animation,
// Animation<double> secondaryAnimation,
// Widget child) {
// return SlideTransition(
// position: Tween<Offset>(
// begin: const Offset(1, 0),
// end: Offset.zero,
// ).animate(animation),
// child: child,
// );
// },
// ),
// );                          },
// ),
//
// ],
// ),
// ),
// //          bottomNavigationBar: BottomAppBar(
// //          color: Colors.red,
// //          child: Container(height: circleSize * 0),
// // ),
// floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//
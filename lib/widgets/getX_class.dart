import 'package:get/get.dart';

class Services extends GetxController{

  //this if for enter_phone_screen
  RxBool isSelected = true.obs;
  RxBool isCss = true.obs;
  RxBool isPms = false.obs;
  RxBool isMySubjects = true.obs;
  RxBool isCssColor = true.obs;
  RxBool isPmsColor = false.obs;
  RxBool isSyllabus = false.obs;
  RxBool isMCQ = false.obs;
  RxBool isPastSubjective = true.obs;
  RxBool isBooks = false.obs;
  RxBool cssForMySub = false.obs;
  RxBool pmsForMySub = false.obs;
  RxBool AllSubjects = false.obs;
  RxBool EE = true.obs;
  RxBool numberExist = false.obs;


  ClickCssForMySub(){
    cssForMySub.value= true;
    pmsForMySub.value= false;
    update();
  }

  ClickAllSubjects(){
    isMySubjects.value= false;
    AllSubjects.value= true;
    update();
  }

  ClickPmsForMySub(){
    cssForMySub.value= false;
    pmsForMySub.value= true;
    update();
  }

  isEEtrue(){
    EE.value= true;
    update();
  }

  isEEfalse(){
    EE.value=false;
    update();
  }

  isCssClicked(){
    isCss.value = true;
    isPms.value= false;
    //isMySubjects.value=false;
    update();
  }


  isPmsClicked(){
    isPms.value =true;
    isCss.value= false;
    //isMySubjects.value=false;
    update();
  }

  isMySubjectsClicked(){
    isMySubjects.value= true;
    AllSubjects.value= false;
    update();
  }

  isSyllabusClicked(){
    isSyllabus.value =true;
    isPastSubjective.value =false;
    isBooks.value =false;
    isMCQ.value=false;
    update();
  }

  isMCQClicked(){
    isMCQ.value=true;
    isSyllabus.value =false;
    isPastSubjective.value =false;
    isBooks.value =false;
    update();
  }
  isPastSubjectiveSelected(){
    isPastSubjective.value =true;
    isBooks.value =false;
    isSyllabus.value =false;
    isMCQ.value=false;

    update();
  }

  isBooksSelected(){
    isBooks.value =true;
    isPastSubjective.value =false;
    isSyllabus.value =false;
    isMCQ.value=false;

    update();
  }


  //this if for enter_phone_screen
  isSelectedfun(){
    isSelected.value = false;
    // isSelected.toggle();
  }


  // this if for checking user mobile number
  numberExistfunTrue(){
    numberExist.value = true;
  }

  numberExistfunFalse(){
    numberExist.value = false;
  }





}


// onTap: ()async{
// if(index==0) {
// _db.collection('users_basic_data').doc('$id').collection('my_subjects').doc('$id').
// update({
// 'ListofSubjects': FieldValue.arrayRemove(arrayOfMaps),
// });
// services1.isEEfalse();
// }
//
// },




// onTap: ()async{
// if(index==0) {
// _db.collection('users_basic_data').doc('$id').collection('my_subjects').doc('$id').
// update({
// 'ListofSubjects': FieldValue.arrayUnion(arrayOfMaps),
// });
// services1.isEEtrue();
// }
//
// },
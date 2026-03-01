import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:another_flushbar/flushbar.dart';

class Utils {

 static toastMessage(String message){
   Fluttertoast.showToast(
       msg: message,
     backgroundColor: Colors.black,
     textColor: Colors.white,
   );
 }


 static void flushBarErrorMessage(String message,BuildContext context){
   showFlushbar(context: context,
       flushbar: Flushbar(
         forwardAnimationCurve: Curves.decelerate,
         margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
         padding: EdgeInsets.all(15),
         message: message,
         duration: Duration(seconds: 3),
         borderRadius: BorderRadius.circular(20),
         backgroundColor: Colors.red,
         reverseAnimationCurve: Curves.easeInOut,
         positionOffset: 20,
         icon: Icon(Icons.error,size: 28,color: Colors.white,),
       )..show(context),
   );
 }

 static showSnackBar(String message, BuildContext context) {
   ScaffoldMessenger.of(context).showSnackBar(
     SnackBar(
       backgroundColor: Colors.red,
       content: Text(message),
     ),
   );
 }

}


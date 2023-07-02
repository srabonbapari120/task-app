import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

toastMessage(String title,bool error){
  Fluttertoast.showToast(
      msg: title.toString(),
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: error?Colors.green:Colors.red,
      textColor: Colors.white,
      fontSize: 16.0
  );
}
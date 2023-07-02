import 'dart:async';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

import '../ui/view/login_view.dart';
import '../ui/view/navigation_view.dart';

class SplashController extends GetxController{


  Future loginStatus(BuildContext context)async{
    SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
    final token= await sharedPreferences.getString('token');

    if(token != null){
      return Timer(Duration(seconds: 1), () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>NavigationView()));
      });
    }else{
      return Timer(Duration(seconds: 1), () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginView()));
      });
    }
  }
}
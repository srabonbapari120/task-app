import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:task/ui/view/login_view.dart';

class AppBarController extends GetxController{

  RxString? email=''.obs;
  RxString? firstName=''.obs;
  RxString? photo=''.obs;

  Future UserData()async{
    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    email?.value= (await sharedPreferences.getString('email'))!;
    photo?.value= (await sharedPreferences.getString('photo'))!;
    firstName?.value= (await sharedPreferences.getString('firstName'))!;
  }

  Future LogOutUser(BuildContext context)async{
    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    await sharedPreferences.clear();
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginView()), (route) => false);

  }

}
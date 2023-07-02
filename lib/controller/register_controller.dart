import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/data/network_services.dart';
import 'package:task/ui/utils/toast_message.dart';
import 'package:task/ui/view/login_view.dart';
import '../../constant/constant.dart';

class RegisterController extends GetxController{

  RxBool loading= false.obs;
  Future<dynamic> userRegister(String email, String firstName, String lastName, String phone, String password,BuildContext context)async{
    loading.value=true;
    try{
      final result= await NetworkServices().postData(Constant.registerURL,'' ,body: {
        "email":email,
        "firstName":firstName,
        "lastName":lastName,
        "mobile":phone,
        "password":password,
      });
      if(result != null && result['status'] == 'success'){
        loading.value=false;
        toastMessage("Register success",false);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginView()));
      }else{
        loading.value=false;
        toastMessage("Failed",true);
      }

    }catch(e){
      loading.value=false;
      toastMessage(e.toString(),true);
    }
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/data/network_services.dart';
import 'package:task/ui/utils/toast_message.dart';
import 'package:task/ui/view/login_view.dart';
import '../constant/constant.dart';

class SetPasswordController extends GetxController{
  RxBool loading= false.obs;
  
  Future setNewPassword(String email, String otp, String password, BuildContext context)async{

    Map<dynamic, dynamic> body={
      "email":email,
      "OTP":otp,
      "password":password
    };
    try{
      loading.value=true;
      final result= await NetworkServices().postData(Constant.setNewPasswordURL,'', body: body);
      if(result != null && result["status"]=='success'){
        loading.value=false;
        toastMessage("Success", false);
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginView()), (route) => false);
      }else{
        loading.value=false;
        toastMessage("Error", true);
      }
    }catch(e){
      loading.value=false;
      toastMessage(e.toString(), true);
    }
  }
  
  
}
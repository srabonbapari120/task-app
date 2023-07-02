import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/constant/constant.dart';
import 'package:task/data/network_services.dart';
import 'package:task/ui/utils/toast_message.dart';
import 'package:task/ui/view/pin_verification_view.dart';

class ForgotViewController extends GetxController{

  RxBool loading= false.obs;

  Future forgotEmail(String email, BuildContext context)async{
    try{
      loading.value=true;
      final result = await NetworkServices().getData("${Constant.forgotEmailURL}${email}",'');
      if(result != null && result['status']=='success'){
        loading.value=false;
        toastMessage("Success",false);
        Navigator.push(context, MaterialPageRoute(builder: (context)=>PinVerificationView(email: email,)));
      }else{
        loading.value=false;
        toastMessage("Error",true);
      }
    }catch(e){
      loading.value=false;
      toastMessage(e.toString(),true);
    }
  }
}
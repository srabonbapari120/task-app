import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/constant/constant.dart';
import 'package:task/data/network_services.dart';
import 'package:task/ui/utils/toast_message.dart';
import 'package:task/ui/view/set_password_view.dart';

class PinVerificationController extends GetxController{
  RxBool loading= false.obs;

  Future pinVerification(String pinCode,String email, BuildContext context) async{
    try{
      loading.value=true;
      final result= await NetworkServices().getData(Constant.otpVerificationURL + email +"/" + pinCode,'');
      if(result != null && result['status']=='success'){
        loading.value=false;
        toastMessage("Verification Complete", false);
        Navigator.push(context, MaterialPageRoute(builder: (context)=>SetPasswordView(otp: pinCode,email: email,)));
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
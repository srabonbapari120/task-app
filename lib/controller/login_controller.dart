import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/data/auth_utils.dart';
import 'package:task/data/network_services.dart';
import 'package:task/ui/utils/toast_message.dart';
import 'package:task/ui/view/navigation_view.dart';
import '../../constant/constant.dart';

class LoginController extends GetxController {
  RxBool loading = false.obs;

  Future<dynamic> userLogin(String email, String password, context) async {
    loading.value = true;
    try {
      final result = await NetworkServices().postData(
        Constant.loginURL,'',
        body: {"email": email, "password": password},
      );
      if (result != null && result['status'] == 'success'){
        await AuthUtils.saveUserData(
            result['token'],
            result['data']['firstName'],
            result['data']['lastName'],
            result['data']['mobile'],
            result['data']['email'],
            result['data']['photo']);
        loading.value = false;
        toastMessage("Login success",false);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => NavigationView()));
      } else {
        loading.value = false;
        toastMessage("Login failed",true);
      }
    } catch (e) {
      loading.value = false;
      toastMessage(e.toString(),true);
    }
  }
}

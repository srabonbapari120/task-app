import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/constant/constant.dart';
import 'package:task/data/network_services.dart';
import 'package:task/ui/utils/toast_message.dart';
import 'package:task/ui/view/login_view.dart';
import '../../model/new_view_model.dart';

class NewViewController extends GetxController{
  var data = RxList<Data>().obs;

  @override
  void onInit(){
    super.onInit();
    getNewTask();
  }

  Future getNewTask() async{
    try{
      SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
      final token= await sharedPreferences.getString('token');
      if(token != null){
       final result = await NetworkServices().getData(Constant.newTaskURL, token);
        if(result != null && result['status'] == 'success'){
          final result1= result['data'];
          data.value = Data.fromJson(result1) as RxList<Data>;
        }else{
          toastMessage("Error Loading", true);
        }
      }else{
        toastMessage("Token Exprear", true);
      }
    }catch(e){
      toastMessage(e.toString(), true);
    }
  }
}
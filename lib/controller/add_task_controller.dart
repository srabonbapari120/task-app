import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/constant/constant.dart';
import 'package:task/data/network_services.dart';
import 'package:task/ui/utils/toast_message.dart';
import 'package:flutter/material.dart';
import 'package:task/ui/view/navigation_view.dart';

class AddTaskController extends GetxController{

  RxBool loading= false.obs;

 Future<dynamic> postTask(String title, String desc,BuildContext context) async{

   loading.value=true;
   SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
   final token= await sharedPreferences.getString('token');
   final addTaskURL= Constant.addTaskURL;
   Map<dynamic, dynamic> body = {
     "title": title,
     "description": desc,
     "status":"New"
   };
   try{
     final result= await NetworkServices().postData(addTaskURL,token,body: body);
     if(result !=null && result['status']=='success'){
       toastMessage('Post Added Sucessfully',false);
       loading.value=false;
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>NavigationView()));
     }else{
       loading.value=false;
       toastMessage('Post Not Added',true);
     }
   }catch(e){
     loading.value=false;
     toastMessage(e.toString(),true);
   }
  }
}
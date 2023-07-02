import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constant/constant.dart';
import '../data/network_services.dart';
import '../model/new_view_model.dart';
import '../ui/utils/toast_message.dart';

class CompletedViewController extends GetxController{

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
        final result = await NetworkServices().getData(Constant.completedTaskURL, token);
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
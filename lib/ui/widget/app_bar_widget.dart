import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/app_bar_controller.dart';
import '../view/update_profile_view.dart';

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {

  final AppBarController appBarController = Get.put(AppBarController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    appBarController.UserData();
  }
  @override
  Widget build(BuildContext context) {
    return Obx(() => Padding(
      padding: const EdgeInsets.only(left: 18.0, top: 5, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const UpdateProfileView()));
            },
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundImage: NetworkImage("https://upload.wikimedia.org/wikipedia/en/a/a1/NafSadh_Profile.jpg"),
                ),
                const SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(appBarController.firstName?.value??"",
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            textBaseline: TextBaseline.alphabetic)),
                    Text(appBarController.email?.value??"",
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(onPressed: (){
            appBarController.LogOutUser(context);
          }, icon: const Icon(Icons.logout_outlined)),
        ],
      ),
    ),);
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/new_view_controller.dart';

class NewScreen extends StatelessWidget {
   NewScreen({Key? key}) : super(key: key);

  final NewViewController newViewController = Get.put(NewViewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: RefreshIndicator(
        onRefresh: ()async{
          await newViewController.getNewTask();
        },
        child: Column(
          children: [
            Container(
              height: 100,
              width: double.infinity,
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

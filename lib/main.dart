import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/ui/view/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: SplashView(),
    );
  }
}


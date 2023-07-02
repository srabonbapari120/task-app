import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/ui/view/login_view.dart';

import '../../controller/forgot_view_controller.dart';
import '../utils/text_style.dart';
import '../widget/button_widget.dart';
import '../widget/text_field_widget.dart';

class ForgotView extends StatefulWidget {
  const ForgotView({Key? key}) : super(key: key);

  @override
  State<ForgotView> createState() => _ForgotViewState();
}

class _ForgotViewState extends State<ForgotView> {
  final ForgotViewController forgotViewController =
      Get.put(ForgotViewController());
  TextEditingController email = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Your Email Address",
                    style: textTitleStyle,
                  ),
                  Text(
                    "A 6 digit verification pin will send to your email address",
                    style: textSubTitleStyle,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFieldWidget(
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return "Enter Email";
                      }
                      return null;
                    },
                    hintText: 'Email',
                    controller: email,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Obx(
                    () => forgotViewController.loading.value
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : ButtonWidget(
                            icon: Icons.send,
                            onPress: () {
                              if (formkey.currentState!.validate()) {
                                forgotViewController.forgotEmail(
                                    email.text, context);
                              }
                            }),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Have Account?",
                        style: textSubTitleStyle,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginView()));
                          },
                          child: Text("Sign In"))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/ui/view/forgot_view.dart';
import 'package:task/ui/view/register_view.dart';
import '../../controller/login_controller.dart';
import '../utils/text_style.dart';
import '../widget/button_widget.dart';
import '../widget/text_field_widget.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Center(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Form(
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text(
                        "Get Started With",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFieldWidget(
                      hintText: 'Email',
                      controller: emailController,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return "Enter Email";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextFieldWidget(
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return "Enter Password";
                        }
                        return null;
                      },
                      hintText: 'Password',
                      controller: passwordController,
                      obScureText: true,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Obx(() => loginController.loading.value?Center(child: CircularProgressIndicator(),):ButtonWidget(
                      icon: Icons.send,
                      onPress: () {
                        if (formkey.currentState!.validate()) {
                          loginController.userLogin(emailController.text, passwordController.text,context);
                        }
                      },
                    ),),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                        child: TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotView()));
                      },
                      child: Text("Forgot Password ?",style: TextStyle(color: Colors.grey),),),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have account?",
                          style: textSubTitleStyle,
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterView()));
                            },
                            child: Text("Sign Up"))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

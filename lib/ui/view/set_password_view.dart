import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/controller/set_password_controller.dart';
import '../utils/text_style.dart';
import '../widget/button_widget.dart';
import '../widget/text_field_widget.dart';
import 'login_view.dart';

class SetPasswordView extends StatefulWidget {
  SetPasswordView({Key? key,required this.otp,required this.email}) : super(key: key);
  String otp;
  String email;

  @override
  State<SetPasswordView> createState() => _SetPasswordViewState();
}

class _SetPasswordViewState extends State<SetPasswordView> {

  final SetPasswordController setPasswordController = Get.put(SetPasswordController());
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
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
                  Text("Set Password",style: textTitleStyle,),
                  Text("Minimum Length password 8 character with latter and number combination",style: textSubTitleStyle,),
                  SizedBox(height: 10,),
                  TextFieldWidget(
                    validator: (value){
                      if(value?.isEmpty ?? true){
                        return "Enter Password";
                      }
                      return null;
                    },
                    hintText: 'Password',
                    controller: password,
                    obScureText: true,
                  ),
                  SizedBox(height: 5,),
                  TextFieldWidget(
                    validator: (value){
                      if(value?.isEmpty ?? true){
                        return "Enter Confirm Password";
                      }
                      return null;
                    },
                    hintText: 'Confirm Password',
                    controller: confirmPassword,
                    obScureText: true,
                  ),
                  SizedBox(height: 20,),
                  Obx(() => setPasswordController.loading.value?Center(child: CircularProgressIndicator(),):ButtonWidget(icon: Icons.send, onPress: (){
                    if(formkey.currentState!.validate()){
                      setPasswordController.setNewPassword(widget.email, widget.otp, confirmPassword.text, context);
                    }
                  }),),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Have Account?",style: textSubTitleStyle,),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginView()));
                      }, child: Text("Sign In"))
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

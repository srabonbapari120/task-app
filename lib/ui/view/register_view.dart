import 'package:flutter/material.dart';
import 'package:task/ui/view/login_view.dart';
import 'package:task/ui/widget/button_widget.dart';
import '../../controller/register_controller.dart';
import '../utils/text_style.dart';
import '../widget/text_field_widget.dart';
import 'package:get/get.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {

  TextEditingController email = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  final formkey = GlobalKey<FormState>();
  final RegisterController registerController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Text("Join With Us",style: textTitleStyle,),
                        ),
                        SizedBox(height: 20,),
                        TextFieldWidget(
                          validator: (value){
                            if(value?.isEmpty ?? true){
                              return "Enter Email";
                            }
                            return null;
                          },
                          hintText: 'Email',
                          controller: email,
                        ),
                        SizedBox(height: 5,),
                        TextFieldWidget(
                          validator: (value){
                            if(value?.isEmpty ?? true){
                              return "Enter First Name";
                            }
                            return null;
                          },
                          hintText: 'First Name',
                          controller: firstName,
                        ),
                        SizedBox(height: 5,),
                        TextFieldWidget(
                          validator: (value){
                            if(value?.isEmpty ?? true){
                              return "Enter Last Name";
                            }
                            return null;
                          },
                          hintText: 'Last Name',
                          controller: lastName,
                        ),
                        SizedBox(height: 5,),
                        TextFieldWidget(
                          validator: (value){
                            if(value?.isEmpty ?? true){
                              return "Enter Mobile";
                            }
                            return null;
                          },
                          hintText: 'Mobile',
                          controller: phone,
                        ),
                        SizedBox(height: 5,),
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
                        SizedBox(height: 20,),
                        Obx(() =>
                        registerController.loading.value?Center(child: CircularProgressIndicator(),): ButtonWidget(icon: Icons.send, onPress: (){
                          if(formkey.currentState!.validate()){
                            registerController.userRegister(email.text, firstName.text, lastName.text, phone.text, password.text,context);
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
      ),
    );
  }
}

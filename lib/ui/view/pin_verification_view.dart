import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task/controller/pin_verification_controller.dart';
import '../utils/text_style.dart';
import 'login_view.dart';

class PinVerificationView extends StatefulWidget {
  PinVerificationView({Key? key,required this.email}) : super(key: key);

  String email;

  @override
  State<PinVerificationView> createState() => _PinVerificationViewState();
}

class _PinVerificationViewState extends State<PinVerificationView> {

  final PinVerificationController pinVerificationController= Get.put(PinVerificationController());
  TextEditingController pinController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Pin Verification",style: textTitleStyle,),
                Text("A 6 digit verification pin will send to your email address",style: textSubTitleStyle,),
                SizedBox(height: 10,),
                PinCodeTextField(
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    activeFillColor: Colors.white,
                  ),
                  animationDuration: Duration(milliseconds: 300),
                  backgroundColor: Colors.white,
                  enableActiveFill: true,
                  controller: pinController,
                  onCompleted: (v) {
                    pinVerificationController.pinVerification(v.toString(), widget.email, context);
                  },
                  onChanged: (value) {
                  },
                  beforeTextPaste: (text) {
                    return true;
                  }, appContext: (context),
                ),
                SizedBox(height: 20,),
                Obx(() => pinVerificationController.loading.value?Center(child: CircularProgressIndicator(),): Container(),),
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
    );
  }
}

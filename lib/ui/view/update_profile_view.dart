import 'package:flutter/material.dart';
import '../utils/text_style.dart';
import '../widget/app_bar_widget.dart';
import '../widget/text_field_widget.dart';

class UpdateProfileView extends StatefulWidget {
  const UpdateProfileView({Key? key}) : super(key: key);

  @override
  State<UpdateProfileView> createState() => _UpdateProfileViewState();
}

class _UpdateProfileViewState extends State<UpdateProfileView> {
  TextEditingController email = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: AppBarWidget(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  "Update Profile",
                  style: textTitleStyle,
                ),
              ),
              SizedBox(
                height: 20,
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
                height: 5,
              ),
              TextFieldWidget(
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return "Enter First Name";
                  }
                  return null;
                },
                hintText: 'First Name',
                controller: firstName,
              ),
              SizedBox(
                height: 5,
              ),
              TextFieldWidget(
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return "Enter Last Name";
                  }
                  return null;
                },
                hintText: 'Last Name',
                controller: lastName,
              ),
              SizedBox(
                height: 5,
              ),
              TextFieldWidget(
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return "Enter Number";
                  }
                  return null;
                },
                hintText: 'Phone',
                controller: mobile,
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
                controller: password,
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget(
      {Key? key,
      required this.hintText,
      this.obScureText,
      required this.controller,
      this.validator,this.mixLine})
      : super(key: key);
  String hintText;
  bool? obScureText;
  int? mixLine;
  TextEditingController controller;
  Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: TextFormField(
        maxLines: mixLine ?? 1,
        validator: (value) {
          if (validator != null) {
            return validator!(value);
          }
          return null;
        },
        obscureText: obScureText ?? false,
        controller: controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.white)),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  ButtonWidget({Key? key,required this.icon,required this.onPress}) : super(key: key);
 IconData icon;
 VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(15),
          color: Colors.green,
        ),
        child: Center(child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Icon(icon,size: 30,color: Colors.white,),
        ),),
      ),
    );
  }
}



import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget{
  
   String inputText;
   double height=44;
   VoidCallback onPressed;

  
  CustomButton({required this.inputText, required this.height, required this.onPressed});
  
  @override
  Widget build(BuildContext context) {
  return Container(
      width: MediaQuery.of(context).size.width ,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        color: Color.fromARGB(243, 255, 136, 0),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          inputText,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
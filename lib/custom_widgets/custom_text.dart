import 'package:flutter/material.dart';
import 'package:school_management/commons/field_validation.dart';

class CustomText extends StatefulWidget {
  final String inputText;
  final double height;
  final bool shouldMaskText;
  final TextEditingController fieldController;

  CustomText({
    required this.inputText,
    required this.height,
    this.shouldMaskText = false,
    required this.fieldController,
  });

  @override
  _CustomTextState createState() => _CustomTextState();
}

class _CustomTextState extends State<CustomText> {
  bool _showError = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.fieldController,
      obscureText: widget.shouldMaskText,
      decoration: InputDecoration(
        hintText: widget.inputText,
        filled: true,
        fillColor: Colors.white,
        hintStyle: TextStyle(color: Color.fromARGB(255, 192, 188, 188)),
        border: OutlineInputBorder( 
          borderSide: BorderSide(
            color: _showError ? Colors.red : Colors.transparent,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: _showError ? Colors.red : Colors.transparent,
            width: 3,
          ),
        ),
      ),
      onChanged: (value) {
        String? errorMessage = FieldValidation.validateTextField(
            value, widget.inputText);
        if (errorMessage != null) {
          setState(() {
            _showError = true;
          });
        } else {
          setState(() {
            _showError = false;
          });
        }
      },
      onSubmitted: (value) {
        print("**************** onSubmitted called for $value");
        String? errorMessage = FieldValidation.validateTextField(
            value, widget.inputText);
        if (errorMessage != null) {
          setState(() {
            _showError = true;
          });
        } else {
          setState(() {
            _showError = false;
          });
          // Validation passed, do something with the input value
        }
      },
    );
  }
}

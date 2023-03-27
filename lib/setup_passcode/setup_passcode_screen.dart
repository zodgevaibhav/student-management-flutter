import 'package:flutter/material.dart';
import 'package:school_management/custom_widgets/custom_text.dart';
import 'package:school_management/setup_passcode/setup_passcode_service.dart';

import '../custom_widgets/custom_button.dart';

class SetupPassCodeScreen extends StatefulWidget {
  @override
  _SetupPassCodeScreenState createState() => _SetupPassCodeScreenState();
}

class _SetupPassCodeScreenState extends State<SetupPassCodeScreen> {
  final _passcodeController = TextEditingController();
  final _confirmPasscodeController = TextEditingController();

  void _setPasscode() async {
    SetupPasscodeService().setPasscode(
        _passcodeController.text, _confirmPasscodeController.text, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 137, 137, 138),
              Color.fromARGB(255, 49, 50, 49),
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Image.asset(
                    'assets/images/school_logo.png',
                    width: 160.0,
                    height: 160.0,
                    fit: BoxFit.contain,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    'Registration',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                const SizedBox(height: 16.0),
                CustomText(
                  inputText: "Passcode",
                  height: 16,
                  fieldController: _passcodeController,
                  shouldMaskText: true,
                ),
                const SizedBox(height: 16.0),
                CustomText(
                  inputText: "Confirm Passcode",
                  height: 16,
                  fieldController: _confirmPasscodeController,
                  shouldMaskText: true,
                ),
                const SizedBox(height: 16.0),
                CustomButton(
                  height: 44,
                  inputText: 'Next',
                  onPressed: _setPasscode,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

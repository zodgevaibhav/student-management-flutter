import 'package:flutter/material.dart';
import 'package:school_management/login/login_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {'/':(context)=>LoginScreen()},
    )
  );
}
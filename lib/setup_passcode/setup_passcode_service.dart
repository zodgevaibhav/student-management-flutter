import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:school_management/commons/api_endpoint.dart';
import 'package:school_management/dashboard/dashboard_screen.dart';
import 'package:school_management/home/home_screen.dart';

import '../commons/api.util.dart';

class SetupPasscodeService{

void setPasscode(final String passcode, final String confirmPasscode, BuildContext context) async {
      final response = await Api.post(
            APIEndPoints.VALIDATE,
            headers: {
              'Content-Type': 'application/json',
            },
            data: {
              'grnNumber':passcode,
              'mobile':confirmPasscode,
            },
        );

  //    final jsonReponse = json.decode(response.data);

      if (response.statusCode==200 && response.data["message"]=="SUCCESS") {
          
          Navigator.push(context, MaterialPageRoute(builder: ((context) => HomeScreen())));
      } else {
          print("Login fail");
      }
  }
}
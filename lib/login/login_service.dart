import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:school_management/commons/api_endpoint.dart';
import 'package:school_management/dashboard/dashboard_screen.dart';
import 'package:school_management/home/home_screen.dart';
import 'package:school_management/setup_passcode/setup_passcode_screen.dart';

import '../commons/api.util.dart';

class LoginService{

void validateGRNMobile(final String grnNumber, final String mobile, BuildContext context) async {
      final response = await Api.post(
            APIEndPoints.VALIDATE,
            headers: {
              'Content-Type': 'application/json',
            },
            data: {
              'grnNumber':grnNumber,
              'mobile':mobile,
            },
        );

  //    final jsonReponse = json.decode(response.data);

      if (response.statusCode==201 && response.data["message"]=="SUCCESS") { //New Login
          Navigator.push(context, MaterialPageRoute(builder: ((context) => SetupPassCodeScreen())));
      }
      else if(response.statusCode==200 && response.data["message"]=="SUCCESS")  // Existing login
      {
          Navigator.push(context, MaterialPageRoute(builder: ((context) => Dashboard())));
      } else {
          print("Login fail");
      }
  }
}
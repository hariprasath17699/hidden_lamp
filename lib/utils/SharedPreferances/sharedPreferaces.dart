import 'package:flutter/material.dart';
import 'package:hidden_lamp/screens/authentication/view/signIn.dart';
import 'package:shared_preferences/shared_preferences.dart';

class sharedPreferances {
  saveUserDetails(String phoneNumber, String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('phoneNumber', phoneNumber);
    prefs.setString('status', phoneNumber);
    prefs.setString('name', name);

    String? setStatus = prefs.getString("status");
    String? phone = prefs.getString("phoneNumber");
    String? username = prefs.getString("name");
  }

  getUserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? setStatus = prefs.getString("status");

    String? phone = prefs.getString("phoneNumber");
    String? username = prefs.getString("name");
    return {'setStatus': setStatus, 'phone': phone, 'userName': username};
  }

  clearSharePreferances(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('phoneNumber', '');
    prefs.setString('status', '0');

    String? setStatus = prefs.getString("status");
    String? phone = prefs.getString("phoneNumber");
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) => SignIn(),
      ),
    );
  }
}

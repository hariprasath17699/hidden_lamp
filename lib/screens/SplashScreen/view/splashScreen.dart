import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hidden_lamp/screens/bottomNavigationBar/view/BottomNavigationBar.dart';
import 'package:hidden_lamp/screens/welcome/view/welcome.dart';

import '../../../utils/SharedPreferances/sharedPreferaces.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  getData() async {
    Timer(
      const Duration(milliseconds: 2000),
      () async {
        var userData = await sharedPreferances().getUserDetails();
        print('====>$userData');
        if (userData['phone'] != null && userData['setStatus'] != '0') {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) =>
                  const CustomBottomNavigationBar()));
        } else {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => const Welcome()));
        }
      },
    );
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        'assets/splashBackground.png',
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
      ),
    );
  }
}

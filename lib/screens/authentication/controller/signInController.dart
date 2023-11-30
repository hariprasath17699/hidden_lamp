import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hidden_lamp/screens/authentication/model/user.dart';
import 'package:hidden_lamp/utils/MATUtils/MATUtils.dart';
import 'package:hidden_lamp/utils/SharedPreferances/sharedPreferaces.dart';

import '../../bottomNavigationBar/view/BottomNavigationBar.dart';

class SigninController {
  handleSignin(User user, BuildContext context) async {
    if (user.phoneNumber != '' && user.password != '') {
      CollectionReference users =
          FirebaseFirestore.instance.collection('Users');
      var snapShot = await users.doc(user.phoneNumber).get();

      if (snapShot.exists) {
        Map<String, dynamic>? snapShotdata =
            snapShot.data() as Map<String, dynamic>?;
        var value = snapShotdata!['password'];
        if (value == user.password) {
          MATUtils().showToast(context, 'Login successful...!');

          await sharedPreferances()
              .saveUserDetails(user.phoneNumber, snapShotdata['name']);
          var userData = await sharedPreferances().getUserDetails();

          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) =>
                  const CustomBottomNavigationBar()));
        } else {
          MATUtils().showToast(context, 'Login failed...!');
        }
      } else {
        MATUtils().showToast(context, 'User not avalible!');
      }
    } else {
      Navigator.of(context).pop();
      MATUtils().showToast(context, 'All fields Required!');
    }
  }
}

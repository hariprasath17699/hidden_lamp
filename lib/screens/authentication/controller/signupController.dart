import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hidden_lamp/screens/authentication/model/user.dart';
import 'package:hidden_lamp/utils/MATUtils/MATUtils.dart';

import '../../bottomNavigationBar/view/BottomNavigationBar.dart';

class SignupController {
  handleSignup(User user, BuildContext context) async {
    if (user.name != '' &&
        user.rollNumber != '' &&
        user.guardianName != '' &&
        user.phoneNumber != '' &&
        user.className != '' &&
        user.section != '' &&
        user.section != '' &&
        user.school != '' &&
        user.address != '' &&
        user.state != '' &&
        user.city != '' &&
        user.pincode != '' &&
        user.password != '' &&
        user.pincode != '') {
      CollectionReference users =
          FirebaseFirestore.instance.collection('Users');
      var snapShot = await users.doc(user.phoneNumber).get();

      if (snapShot.exists) {
        Map<String, dynamic>? snapShotdata =
            snapShot.data() as Map<String, dynamic>?;

        MATUtils().showToast(context, 'User Already Exist!');
      } else {
        users
            .doc(user.phoneNumber)
            .set(UserModel().toMap(user))
            .then((value) => {
                  Navigator.of(context).pop(),
                  MATUtils().showToast(context, 'User Registered Successfully'),
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const CustomBottomNavigationBar()))
                })
            .catchError((error) => {
                  Navigator.of(context).pop(),
                  MATUtils().showToast(context, 'Failed Try Again'),
                });
      }
    } else {
      Navigator.of(context).pop();
      MATUtils().showToast(context, 'All fields Required!');
    }
  }
}

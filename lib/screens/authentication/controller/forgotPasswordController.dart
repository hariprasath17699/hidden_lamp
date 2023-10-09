import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hidden_lamp/screens/authentication/model/user.dart';
import 'package:hidden_lamp/utils/MATUtils/MATUtils.dart';

import '../../bottomNavigationBar/view/BottomNavigationBar.dart';

class ForgotPasswordController {
  CollectionReference forgotPasswords =
      FirebaseFirestore.instance.collection('forgotPassword');
  CollectionReference users = FirebaseFirestore.instance.collection('Users');

  requestPassword(String number, BuildContext context) async {
    if (number != '') {
      var snapShot = await forgotPasswords.doc(number).get();
      var user = await users.doc(number).get();
      if (!user.exists) {
        MATUtils().showToast(context, 'User not exist');
        return;
      }
      if (snapShot.exists) {
        Map<String, dynamic>? snapShotdata =
            snapShot.data() as Map<String, dynamic>?;

        MATUtils().showToast(context, 'Request Already Exist!');
      } else {
        forgotPasswords
            .doc(number)
            .set({'number': number, 'tempPassword': ''})
            .then((value) => {
                  MATUtils()
                      .showToast(context, 'Request Registered Successfully'),
                })
            .catchError((error) => {
                  MATUtils().showToast(context, 'Failed Try Again'),
                });
      }
    } else {
      MATUtils().showToast(context, 'All fields Required!');
    }
  }

  resetPassword(String number, String password, String tempPassword,
      BuildContext context) async {
    if (number != '') {
      var snapShot = await forgotPasswords.doc(number).get();

      if (snapShot.exists) {
        Map<String, dynamic>? snapShotdata =
            snapShot.data() as Map<String, dynamic>?;
        if (snapShotdata!['tempPassword'] == tempPassword) {
          users
              .doc(number)
              .set({'password': password})
              .then((value) => {
                    Navigator.of(context).pop(),
                    MATUtils().showToast(context, 'Password Reset Successful'),
                  })
              .catchError((error) => {
                    Navigator.of(context).pop(),
                    MATUtils().showToast(context, 'Failed Try Again'),
                  });
        } else {
          MATUtils().showToast(context, 'Incorrect Temporary password!');
        }
      } else {
        MATUtils().showToast(context, 'Raise Request For Password!');
      }
    } else {
      MATUtils().showToast(context, 'All fields Required!');
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hidden_lamp/screens/assignments/model.dart/AssignmentModel.dart';

import '../../../utils/MATUtils/MATUtils.dart';

// Assignment assignment = Assignment(
//                         assignmentName: 'Machine Learning',
//                         assignmentUrl:
//                             'https://docs.google.com/forms/d/e/1FAIpQLSe8bshiyuQT-oj_mEz_gfpr4OOXIdLyZ_GKxSD6cMvVuoPYJg/viewform',
//                         className: ['2nd class'],
//                         createdData: '12/2/2023',
//                         deadline: '2 Days',
//                         discription:
//                             'AI is powerful technology to learn & explore the world',
//                         docId: '3D-5A0111',
//                         school: ['Sri Datta High School'],
//                         time: '1:20');
//                     AssignmentController()
//                         .insertAssignment(assignment, context);
class AssignmentController {
  insertAssignment(Assignment assignment, BuildContext context) async {
    CollectionReference assigments =
        FirebaseFirestore.instance.collection('Assignments');
    var snapShot = await assigments.doc().get();

    assigments
        .doc(assignment.docId)
        .set(AssignmentModel().toMap(assignment))
        .then((value) async {
      MATUtils().showToast(context, 'Assignment Registered Successfully');
    }).catchError((error) {
      MATUtils().showToast(context, 'Failed Try Again');
    });
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String name;
  final String rollNumber;
  final String guardianName;
  final String phoneNumber;
  final String className;
  final String section;
  final String school;
  final String address;
  final String state;
  final String city;
  final String pincode;
  final String password;

  User({
    required this.name,
    required this.rollNumber,
    required this.guardianName,
    required this.phoneNumber,
    required this.className,
    required this.section,
    required this.school,
    required this.address,
    required this.state,
    required this.city,
    required this.pincode,
    required this.password,
  });
}
class UserModel{
Map<String, dynamic> toMap(data) {
  return {
    'name': data.name,
    'rollNumber': data.rollNumber,
    'guardianName': data.guardianName,
    'phoneNumber': data.phoneNumber,
    'className': data.className,
    'section': data.section,
    'school': data.school,
    'address': data.address,
    'state': data.state,
    'city': data.city,
    'pincode': data.pincode,
    'password': data.password,
  };
}
}


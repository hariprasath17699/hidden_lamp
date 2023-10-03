import 'package:flutter/material.dart';

import '../../../utils/MATUtils/MATUtils.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black)),
        title: MATUtils().customText('Edit Profile', 22, Colors.black),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Center(
            child: CircleAvatar(
              radius: 100,
              child: Image.asset('assets/4-03.png'),
              backgroundColor: Colors.white,
            ),
          ),
          const Text(
            'Select an Avatar',
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Colors.blue,
                decoration: TextDecoration.underline),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var i = 0; i < 3; i++)
                Center(
                  child: CircleAvatar(
                    radius: 50,
                    child: Image.asset('assets/${i + 1}-03.png'),
                    backgroundColor: Colors.white,
                  ),
                ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var i = 0; i < 3; i++)
                Center(
                  child: CircleAvatar(
                    radius: 50,
                    child: Image.asset('assets/${i + 3}-03.png'),
                    backgroundColor: Colors.white,
                  ),
                ),
            ],
          )
        ],
      ),
    );
  }
}

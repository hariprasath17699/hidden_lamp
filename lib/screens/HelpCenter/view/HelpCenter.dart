import 'package:flutter/material.dart';
import 'package:hidden_lamp/utils/MATUtils/MATUtils.dart';

class HelpCenter extends StatefulWidget {
  const HelpCenter({Key? key}) : super(key: key);

  @override
  State<HelpCenter> createState() => _HelpCenterState();
}

class _HelpCenterState extends State<HelpCenter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help Center'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              MATUtils()
                  .customText('1) How do I create an account?', 20, Colors.red),
              const SizedBox(height: 10),
              MATUtils().customText(
                  'A) You don’t have any permission to create an account as it is a school support app for your STEAM Lab. Our teachers will help you create your account and it will be verified by our team then only your account will be created.',
                  15,
                  Colors.black),
              const SizedBox(height: 10),
              MATUtils().customText('2) How do I log in?', 20, Colors.red),
              const SizedBox(height: 10),
              MATUtils().customText(
                  'A) If your account is created and verified by us then you will get notified and a temporary password will be generated and given to you then you can go to our app and verify your temporary password and then update it with your password and then you can log in with the credentials',
                  15,
                  Colors.black),
              const SizedBox(height: 10),
              MATUtils().customText(
                  '3) I forgot my password. How can I reset it?',
                  20,
                  Colors.red),
              const SizedBox(height: 10),
              MATUtils().customText(
                  'A) If you forgot your password just click on “Forgot Password” on your login page, then it will ask for your mobile number that you had given earlier at the time of creating your account. Enter your number and then click “Reset”. It will generate a temporary password. Next copy that password and enter it on “verify temporary password” in the “Forgot Password” page. After verifying you will be asked to update your password. Now you can log in using the new password.',
                  15,
                  Colors.black),
              const SizedBox(height: 10),
              MATUtils().customText(
                  '4) How do I enroll in a course?', 20, Colors.red),
              const SizedBox(height: 10),
              MATUtils().customText(
                  'A) You don’t have to enroll in a course manually. Our App is programmed in such a way that when a course is going on in your class, in the app it will automatically be unlocked chapter by chapter.',
                  15,
                  Colors.black),
              const SizedBox(height: 10),
              MATUtils().customText(
                  '5) What types of courses are available?', 20, Colors.red),
              const SizedBox(height: 10),
              MATUtils().customText(
                  'A) The courses that are available within the app are Robotics, 3D Design and Printing, Internet of Things, Electronics, App Development, Artificial Intelligence, Drone, and many more.',
                  15,
                  Colors.black),
              const SizedBox(height: 10),
              MATUtils().customText(
                  '6) How do I access my enrolled courses?', 20, Colors.red),
              const SizedBox(height: 10),
              MATUtils().customText(
                  'A) The courses that are ongoing or completed for your class will show on “My Courses” on the App.',
                  15,
                  Colors.black),
              const SizedBox(height: 10),
              MATUtils().customText(
                  '7) What is the learning dashboard?', 20, Colors.red),
              const SizedBox(height: 10),
              MATUtils().customText(
                  'A) The learning dashboard is the place where you can see your progress, ongoing courses, assignments, projects that will be updated by students, tech tips, etc.',
                  15,
                  Colors.black),
              const SizedBox(height: 10),
              MATUtils().customText(
                  '8) How can I communicate with instructors for any help?',
                  20,
                  Colors.red),
              const SizedBox(height: 10),
              MATUtils().customText(
                  'A) If you are facing any problems or doubts regarding your class or topic you can always go to the “Chat with us” option which is in the side menu bar in our app and after connecting to our team they will solve your problems.',
                  15,
                  Colors.black),
            ],
          ),
        ),
      ),
    );
  }
}

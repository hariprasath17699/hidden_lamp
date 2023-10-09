import 'package:flutter/material.dart';
import 'package:hidden_lamp/screens/authentication/controller/forgotPasswordController.dart';
import 'package:hidden_lamp/utils/MATUtils/MATUtils.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController tempPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              size: 30,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Forgot Password",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(25),
            margin: EdgeInsets.only(top: 20),
            width: MediaQuery.of(context).size.width / 1.1,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 58, 143, 213),
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MATUtils().customText('Step 1', 25, Colors.black),
                const SizedBox(
                  height: 14,
                ),
                MATUtils().customText('Phone Number', 18, Colors.white),
                const SizedBox(
                  height: 14,
                ),
                MATUtils().customTextField(
                    text: 'Enter phone number', controller: phoneController),
                const SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  onTap: () {
                    ForgotPasswordController()
                        .requestPassword(phoneController.text, context);
                  },
                  child: Center(
                    child: Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height / 15,
                      width: MediaQuery.of(context).size.width / 1.5,
                      margin: const EdgeInsets.only(top: 20, bottom: 20),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 223, 187, 7),
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      child: MATUtils()
                          .customText('Request Password', 20, Colors.white),
                    ),
                  ),
                ),
                MATUtils().customText('Step 2', 24, Colors.black),
                const SizedBox(
                  height: 14,
                ),
                MATUtils().customText('Temporary Password', 18, Colors.white),
                const SizedBox(
                  height: 14,
                ),
                MATUtils().customTextField(
                    text: 'Enter temporary password',
                    controller: tempPasswordController),
                const SizedBox(
                  height: 16,
                ),
                MATUtils().customText(' Password', 18, Colors.white),
                const SizedBox(
                  height: 14,
                ),
                MATUtils().customTextField(
                    text: 'Enter  password', controller: passwordController),
                const SizedBox(
                  height: 16,
                ),
                MATUtils().customText('Confirm Password', 18, Colors.white),
                const SizedBox(
                  height: 14,
                ),
                MATUtils().customTextField(
                    text: 'Enter Confirm password',
                    controller: confirmPasswordController),
                const SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  onTap: () {
                    if (passwordController.text !=
                        confirmPasswordController.text) {
                      MATUtils()
                          .showToast(context, 'Both passwords should be equal');
                      return;
                    }
                    ForgotPasswordController().resetPassword(
                        phoneController.text,
                        passwordController.text,
                        tempPasswordController.text,
                        context);
                  },
                  child: Center(
                    child: Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height / 15,
                      width: MediaQuery.of(context).size.width / 1.5,
                      margin: const EdgeInsets.only(top: 20, bottom: 20),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 223, 187, 7),
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      child: MATUtils()
                          .customText('Reset Password', 20, Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

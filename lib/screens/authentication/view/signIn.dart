import 'package:flutter/material.dart';
import 'package:hidden_lamp/screens/authentication/controller/signInController.dart';
import 'package:hidden_lamp/screens/authentication/model/user.dart';
import 'package:hidden_lamp/screens/authentication/view/forgotPassword.dart';
import 'package:hidden_lamp/screens/authentication/view/signUp.dart';
import 'package:hidden_lamp/screens/bottomNavigationBar/view/BottomNavigationBar.dart';
import 'package:hidden_lamp/utils/MATUtils/MATUtils.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController password = TextEditingController();
  bool _checkbox = false;
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
          "Log In",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(25),
            height: MediaQuery.of(context).size.height / 1.6,
            width: MediaQuery.of(context).size.width / 1.1,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 58, 143, 213),
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MATUtils().customText('Phone Number', 22, Colors.white),
                const SizedBox(
                  height: 14,
                ),
                MATUtils().customTextField(
                    text: 'Enter phone number',
                    controller: phoneNumberController),
                const SizedBox(
                  height: 14,
                ),
                MATUtils().customText('Password', 22, Colors.white),
                const SizedBox(
                  height: 14,
                ),
                MATUtils().customTextField(
                    text: 'Enter password', controller: password),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Checkbox(
                      value: _checkbox,
                      activeColor: Colors.white,
                      checkColor: Colors.black,
                      onChanged: (value) {
                        setState(() {
                          _checkbox = !_checkbox;
                        });
                      },
                    ),
                    MATUtils()
                        .customText('Keep me signed In', 13, Colors.white),
                    const SizedBox(
                      width: 40,
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ForgotPassword()));
                        },
                        child: MATUtils()
                            .customText('Forgot password?', 13, Colors.white)),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    SigninController signinController = SigninController();
                    User user = User(
                      address: '',
                      city: '',
                      className: '',
                      guardianName: '',
                      name: '',
                      password: password.text,
                      phoneNumber: phoneNumberController.text,
                      pincode: '',
                      rollNumber: '',
                      school: '',
                      section: '',
                      state: '',
                    );
                    signinController.handleSignin(user, context);
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
                      child: MATUtils().customText('Login', 20, Colors.white),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MATUtils().customText(
                        'Don\'t have a account?    ', 12, Colors.white),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => SignUp()));
                      },
                      child: const Text(
                        'SignUp',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

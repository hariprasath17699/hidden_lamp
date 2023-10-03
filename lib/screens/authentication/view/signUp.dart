import 'package:flutter/material.dart';
import 'package:hidden_lamp/screens/authentication/view/signIn.dart';

import '../../../utils/MATUtils/MATUtils.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController rollNumberController = TextEditingController();
  TextEditingController gurdianNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController classController = TextEditingController();
  TextEditingController sectionController = TextEditingController();
  TextEditingController schoolController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
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
          "Sign up",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(25),
            margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 58, 143, 213),
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MATUtils().customText('Name', 17, Colors.white),
                const SizedBox(
                  height: 14,
                ),
                MATUtils().customTextField(
                    controller: nameController, text: 'Enter your name'),
                const SizedBox(
                  height: 14,
                ),
                MATUtils().customText('Roll Number', 17, Colors.white),
                const SizedBox(
                  height: 14,
                ),
                MATUtils().customTextField(
                    controller: rollNumberController,
                    text: 'Enter Roll Number'),
                const SizedBox(
                  height: 16,
                ),
                MATUtils().customText('Guardians name', 17, Colors.white),
                const SizedBox(
                  height: 14,
                ),
                MATUtils().customTextField(
                    controller: gurdianNameController,
                    text: 'Enter Guardians name'),
                const SizedBox(
                  height: 14,
                ),
                MATUtils().customText('Phone Number', 17, Colors.white),
                const SizedBox(
                  height: 14,
                ),
                MATUtils().customTextField(
                    controller: phoneNumberController,
                    text: 'Enter phone number'),
                const SizedBox(
                  height: 16,
                ),
                MATUtils().customText('Class', 17, Colors.white),
                const SizedBox(
                  height: 14,
                ),
                MATUtils().customTextField(
                    controller: classController, text: 'Enter Class'),
                const SizedBox(
                  height: 14,
                ),
                MATUtils().customText('section', 17, Colors.white),
                const SizedBox(
                  height: 14,
                ),
                MATUtils().customTextField(
                    controller: sectionController, text: 'Enter section'),
                const SizedBox(
                  height: 16,
                ),
                MATUtils().customText('School', 17, Colors.white),
                const SizedBox(
                  height: 14,
                ),
                MATUtils().customTextField(
                    controller: schoolController, text: 'Enter School name'),
                const SizedBox(
                  height: 14,
                ),
                MATUtils().customText('Address', 17, Colors.white),
                const SizedBox(
                  height: 14,
                ),
                MATUtils().customTextField(
                    controller: addressController, text: 'Enter Address'),
                const SizedBox(
                  height: 16,
                ),
                MATUtils().customText('State', 17, Colors.white),
                const SizedBox(
                  height: 14,
                ),
                MATUtils().customTextField(
                    controller: stateController, text: 'Enter State'),
                const SizedBox(
                  height: 14,
                ),
                MATUtils().customText('City', 17, Colors.white),
                const SizedBox(
                  height: 14,
                ),
                MATUtils().customTextField(
                    controller: cityController, text: 'Enter City'),
                const SizedBox(
                  height: 16,
                ),
                MATUtils().customText('Pincode', 17, Colors.white),
                const SizedBox(
                  height: 14,
                ),
                MATUtils().customTextField(
                    controller: pincodeController, text: 'Enter Pincode'),
                const SizedBox(
                  height: 14,
                ),
                MATUtils().customText('Password', 17, Colors.white),
                const SizedBox(
                  height: 14,
                ),
                MATUtils().customTextField(
                    controller: passwordController, text: 'Enter password'),
                const SizedBox(
                  height: 14,
                ),
                MATUtils().customText('Confirm Password', 17, Colors.white),
                const SizedBox(
                  height: 14,
                ),
                MATUtils().customTextField(
                    controller: confirmPasswordController,
                    text: 'Enter confirm password'),
                GestureDetector(
                  onTap: () {
                    showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                              content: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Please wait...\nyour credentails is being verified.',
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Image.asset(
                                      'assets/waiting.jpg',
                                      height: 70,
                                      width: 70,
                                    )
                                  ]),
                            ));
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
                      child: MATUtils().customText('SignUp', 20, Colors.white),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MATUtils().customText(
                        'You already have account? ', 12, Colors.white),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => SignIn()));
                      },
                      child: const Text(
                        'SignIn',
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

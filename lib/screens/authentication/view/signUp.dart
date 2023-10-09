import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:hidden_lamp/screens/authentication/controller/signupController.dart';
import 'package:hidden_lamp/screens/authentication/model/user.dart';
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
  TextEditingController addressController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  String schoolName = 'Select Option';
  String classNumber = 'Select Option';
  String section = 'Select Option';
  var schools = [
    'Select Option',
    'Sri datta high School',
    'United Mission School',
    'Baldwin Girls High School',
    'St. Josephs Boys High School',
    'National High School',
  ];
  var classes = [
    'Select Option',
    '1st class',
    '2nd class',
    '3rd class',
    '4th class',
    '5th class',
    '6th class',
    '7th class',
    '8th class',
    '9th class',
    '10th class',
  ];
  var sections = [
    'Select Option',
    'A',
    'B',
    'C',
  ];
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
                  height: 14,
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
                  height: 14,
                ),
                MATUtils().customText('Class', 17, Colors.white),
                const SizedBox(
                  height: 14,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),

                  // dropdown below..
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: classNumber,
                    onChanged: (String? newValue) {
                      setState(() {
                        classNumber = newValue!;
                      });
                    },
                    items: classes
                        .map<DropdownMenuItem<String>>(
                            (String value) => DropdownMenuItem<String>(
                                  value: value,
                                  child: SizedBox(
                                    child: Text(
                                      value,
                                    ),
                                  ),
                                ))
                        .toList(),
                    icon: const Icon(Icons.arrow_drop_down),
                    iconSize: 42,
                    underline: SizedBox(),
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                MATUtils().customText('section', 17, Colors.white),
                const SizedBox(
                  height: 14,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),

                  // dropdown below..
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: section,
                    onChanged: (String? newValue) {
                      setState(() {
                        section = newValue!;
                      });
                    },
                    items: sections
                        .map<DropdownMenuItem<String>>(
                            (String value) => DropdownMenuItem<String>(
                                  value: value,
                                  child: SizedBox(
                                    child: Text(
                                      value,
                                    ),
                                  ),
                                ))
                        .toList(),
                    icon: const Icon(Icons.arrow_drop_down),
                    iconSize: 42,
                    underline: SizedBox(),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                MATUtils().customText('School', 17, Colors.white),
                const SizedBox(
                  height: 14,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),

                  // dropdown below..
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: schoolName,
                    onChanged: (String? newValue) {
                      setState(() {
                        schoolName = newValue!;
                      });
                    },
                    items: schools
                        .map<DropdownMenuItem<String>>(
                            (String value) => DropdownMenuItem<String>(
                                  value: value,
                                  child: SizedBox(
                                    child: Text(
                                      value,
                                    ),
                                  ),
                                ))
                        .toList(),
                    icon: const Icon(Icons.arrow_drop_down),
                    iconSize: 42,
                    underline: SizedBox(),
                  ),
                ),
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
                    if (passwordController.text !=
                        confirmPasswordController.text) {
                      MATUtils()
                          .showToast(context, 'Both passwords should be equal');
                      return;
                    }
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
                    User user = User(
                        address: addressController.text,
                        city: cityController.text,
                        className: classNumber,
                        guardianName: gurdianNameController.text,
                        name: nameController.text,
                        password: passwordController.text,
                        phoneNumber: phoneNumberController.text,
                        pincode: pincodeController.text,
                        rollNumber: rollNumberController.text,
                        school: schoolName,
                        section: section,
                        state: stateController.text);
                    SignupController signupController = SignupController();
                    signupController.handleSignup(user, context);
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

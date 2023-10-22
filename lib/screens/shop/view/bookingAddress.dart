import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hidden_lamp/screens/authentication/view/signUp.dart';
import 'package:hidden_lamp/screens/bottomNavigationBar/view/BottomNavigationBar.dart';
import 'package:hidden_lamp/utils/MATUtils/MATUtils.dart';

import '../../../utils/SharedPreferances/sharedPreferaces.dart';

class BookingAddress extends StatefulWidget {
  final List products;
  const BookingAddress({Key? key, required this.products}) : super(key: key);

  @override
  State<BookingAddress> createState() => _BookingAddressState();
}

class _BookingAddressState extends State<BookingAddress> {
  TextEditingController nameController = TextEditingController();
  TextEditingController schoolController = TextEditingController();
  TextEditingController addressController = TextEditingController();

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
          "Address",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(25),
            margin: EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height / 1.3,
            width: MediaQuery.of(context).size.width / 1.1,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 58, 143, 213),
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MATUtils().customText('Name', 18, Colors.white),
                const SizedBox(
                  height: 14,
                ),
                MATUtils().customTextField(
                    text: 'Enter Name', controller: nameController),
                const SizedBox(
                  height: 14,
                ),
                MATUtils().customText('School', 18, Colors.white),
                const SizedBox(
                  height: 14,
                ),
                MATUtils().customTextField(
                    text: 'Enter School Name', controller: schoolController),
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
                  height: 14,
                ),
                MATUtils().customText('Address', 22, Colors.white),
                const SizedBox(
                  height: 14,
                ),
                MATUtils().customTextField(
                    text: 'Enter Address', controller: addressController),
                const SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  onTap: () {
                    if (nameController.text != null ||
                        schoolController.text != null ||
                        phoneController.text != null ||
                        addressController.text != null ||
                        nameController.text != '' ||
                        schoolController.text != '' ||
                        phoneController.text != '' ||
                        addressController.text != '') {
                      MATUtils().showToast(context, 'Fields can\'t be Empty');
                    } else {
                      CollectionReference order =
                          FirebaseFirestore.instance.collection('Orders');
                      order.doc().set({
                        'name': nameController.text,
                        'school': schoolController.text,
                        'phone': phoneController.text,
                        'address': addressController.text,
                        'order': widget.products,
                      }).then((value) async {
                        Navigator.of(context).pop();
                        MATUtils()
                            .showToast(context, 'Order Placed Successfully');

                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const CustomBottomNavigationBar()));
                      }).catchError((error) {
                        Navigator.of(context).pop();
                        MATUtils().showToast(context, 'Failed Try Again');
                      });
                    }
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
                      child: MATUtils().customText('Send ', 20, Colors.white),
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

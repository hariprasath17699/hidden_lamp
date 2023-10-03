import 'package:flutter/material.dart';
import 'package:hidden_lamp/screens/authentication/view/signUp.dart';
import 'package:hidden_lamp/screens/bottomNavigationBar/view/BottomNavigationBar.dart';
import 'package:hidden_lamp/utils/MATUtils/MATUtils.dart';

class BookingAddress extends StatefulWidget {
  const BookingAddress({Key? key}) : super(key: key);

  @override
  State<BookingAddress> createState() => _BookingAddressState();
}

class _BookingAddressState extends State<BookingAddress> {
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
      body: Center(
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
              MATUtils().customTextField(text: 'Enter Name'),
              const SizedBox(
                height: 14,
              ),
              MATUtils().customText('School', 18, Colors.white),
              const SizedBox(
                height: 14,
              ),
              MATUtils().customTextField(text: 'Enter School Name'),
              const SizedBox(
                height: 14,
              ),
              MATUtils().customText('Phone Number', 18, Colors.white),
              const SizedBox(
                height: 14,
              ),
              MATUtils().customTextField(text: 'Enter phone number'),
              const SizedBox(
                height: 14,
              ),
              MATUtils().customText('Address', 22, Colors.white),
              const SizedBox(
                height: 14,
              ),
              MATUtils().customTextField(text: 'Enter Address'),
              const SizedBox(
                height: 16,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) =>
                          CustomBottomNavigationBar()));
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
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hidden_lamp/utils/MATUtils/MATUtils.dart';

class ViewCourse extends StatefulWidget {
  const ViewCourse({Key? key}) : super(key: key);

  @override
  State<ViewCourse> createState() => _ViewCourseState();
}

class _ViewCourseState extends State<ViewCourse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 242, 242),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: MATUtils().customText("Course Name", 18, Colors.black),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 5,
                  width: MediaQuery.of(context).size.width / 1.1,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: Image.asset(
                    'assets/l5.png',
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 18,
                  width: MediaQuery.of(context).size.width / 1.1,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                        ),
                        MATUtils().customText('07:10/15:50', 13, Colors.black),
                        const SizedBox(
                          width: 30,
                        ),
                        const Icon(
                          Icons.volume_up_outlined,
                          color: Colors.white,
                        ),
                        const Icon(
                          Icons.fullscreen,
                          color: Colors.white,
                        ),
                      ]),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height / 21,
                      width: MediaQuery.of(context).size.width / 2.25,
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),
                      child: MATUtils()
                          .customText('Platlist 20', 15, Colors.white),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height / 21,
                      width: MediaQuery.of(context).size.width / 2.25,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),
                      child: MATUtils().customText('Theory', 15, Colors.white),
                    )
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                MATUtils().customText('Course Content', 20, Colors.black),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width / 1,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: MATUtils().customText(
                      '01. Get to know about arthifical intelligence deep',
                      14,
                      Colors.white),
                ),
                const SizedBox(
                  height: 12,
                ),
                for (var i = 0; i < 9; i++)
                  Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      padding: const EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width / 1,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MATUtils().customText(
                              '0${i + 2}. Get to know about arthifical intelligence deep\n      10:15mins',
                              14,
                              Colors.black),
                          const Icon(
                            Icons.lock,
                            color: Colors.grey,
                          ),
                        ],
                      ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hidden_lamp/utils/MATUtils/MATUtils.dart';
import 'package:hidden_lamp/utils/Webview/webview.dart';

class ViewCourse extends StatefulWidget {
  const ViewCourse({Key? key, required this.courses}) : super(key: key);
  final courses;

  @override
  State<ViewCourse> createState() => _ViewCourseState();
}

class _ViewCourseState extends State<ViewCourse> {
  bool isPlayListSlected = true;
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
        title: MATUtils()
            .customText(widget.courses['Course Name'], 18, Colors.black),
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
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => WebViewPage(
                                  title: 'Course',
                                  Url: widget.courses['pdf'],
                                ),
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                          ),
                        ),
                        MATUtils().customText(
                            "${widget.courses['noofEpisodes']}",
                            13,
                            Colors.white),
                        const SizedBox(
                          width: 60,
                        ),
                      ]),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        isPlayListSlected = true;
                        setState(() {});
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height / 21,
                        width: MediaQuery.of(context).size.width / 2.25,
                        decoration: BoxDecoration(
                          color: isPlayListSlected ? Colors.blue : Colors.grey,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(25),
                          ),
                        ),
                        child: MATUtils()
                            .customText('Platlist 20', 15, Colors.white),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        isPlayListSlected = false;
                        setState(() {});
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height / 21,
                        width: MediaQuery.of(context).size.width / 2.25,
                        decoration: BoxDecoration(
                          color: isPlayListSlected ? Colors.grey : Colors.blue,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(25),
                          ),
                        ),
                        child:
                            MATUtils().customText('Theory', 15, Colors.white),
                      ),
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
                const SizedBox(
                  height: 12,
                ),
             
                
              
    
              ],
            ),
          ),
        ),
      ),
    );
  }
}

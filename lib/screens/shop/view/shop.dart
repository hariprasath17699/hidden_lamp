import 'package:flutter/material.dart';
import 'package:hidden_lamp/screens/shop/view/cart.dart';

import '../../../utils/MATUtils/MATUtils.dart';

class Shop extends StatefulWidget {
  const Shop({Key? key}) : super(key: key);

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  int selectedOption = 0;
  var subCategory = ['All', 'Robotics', '3D Printer', 'IOT'];
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) => Cart()));
          },
          child: const Icon(Icons.shopping_cart_outlined),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                      child: MATUtils().customText('Courses', 22, Colors.black),
                    ),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.search))
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Chip(
                    backgroundColor: Colors.green,
                    avatar: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Text('A'),
                    ),
                    label: Text('All', style: TextStyle(color: Colors.white)),
                  ),
                  Chip(
                    backgroundColor: Colors.white,
                    avatar: CircleAvatar(
                      backgroundColor: Colors.yellow,
                      child: Text('O', style: TextStyle(color: Colors.black)),
                    ),
                    label: Text('Onging'),
                  ),
                  Chip(
                    backgroundColor: Colors.white,
                    avatar: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Text('C', style: TextStyle(color: Colors.white)),
                    ),
                    label: Text('Completed'),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (var i = 0; i < 4; i++)
                    Row(
                      children: [
                        Radio(
                          value: 2,
                          groupValue: selectedOption,
                          onChanged: (value) {},
                        ),
                        Text(subCategory[i]),
                      ],
                    ),
                ],
              ),
              ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 6),
                          padding: const EdgeInsets.all(8),
                          height: MediaQuery.of(context).size.height / 6.5,
                          width: MediaQuery.of(context).size.width / 1.7,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Image.asset(
                                      'assets/iot${index + 1}.jpeg',
                                      fit: BoxFit.fitWidth,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              10,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MATUtils().customText(
                                      "Raspberry Pi", 15, Colors.black),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  MATUtils().customText(
                                      "Description about the project",
                                      11,
                                      Colors.black),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      MATUtils().customText(
                                          "₹ 200", 15, Colors.black),
                                      const SizedBox(
                                        width: 30,
                                      ),
                                      Container(
                                        height: 25,
                                        width: 60,
                                        decoration: const BoxDecoration(
                                          color: Colors.black26,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(25),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                if (count > 0) {
                                                  count--;
                                                  setState(() {});
                                                }
                                              },
                                              child: MATUtils().customText(
                                                  '-', 20, Colors.black),
                                            ),
                                            MATUtils().customText(
                                                count.toString(),
                                                15,
                                                Colors.black),
                                            GestureDetector(
                                              onTap: () {
                                                count++;
                                                setState(() {});
                                              },
                                              child: MATUtils().customText(
                                                  '+', 15, Colors.black),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
    ;
  }
}

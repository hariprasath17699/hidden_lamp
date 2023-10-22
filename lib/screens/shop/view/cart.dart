import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hidden_lamp/screens/shop/view/bookingAddress.dart';

import '../../../utils/MATUtils/MATUtils.dart';

class Cart extends StatefulWidget {
  final List products;
  const Cart({Key? key, required this.products}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  int selectedOption = 0;
  var subCategory = ['All', 'Robotics', '3D Printer', 'IOT'];
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black)),
        title: MATUtils().customText('cart', 22, Colors.black),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListView.builder(
                primary: false,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.products.length,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 100,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Image.network(
                                      widget.products[index]['ImageUrl'],
                                      fit: BoxFit.fitWidth,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              10,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 70,
                            ),
                            Flexible(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Flexible(
                                    child: Container(
                                      padding: EdgeInsets.only(right: 13.0),
                                      child: Text(
                                        widget.products[index]['productName'],
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 13.0,
                                          fontFamily: 'Roboto',
                                          color: Color(0xFF212121),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  MATUtils().customText(
                                      widget.products[index]['description'],
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
                                                if (widget.products[index]
                                                        ['count'] >
                                                    1) {
                                                  Map<String, dynamic> mp =
                                                      widget.products[index]
                                                          as Map<String,
                                                              dynamic>;
                                                  mp.addAll({
                                                    'count':
                                                        widget.products[index]
                                                                ['count'] -
                                                            1
                                                  });
                                                  setState(() {});
                                                }
                                              },
                                              child: MATUtils().customText(
                                                  '-', 20, Colors.black),
                                            ),
                                            MATUtils().customText(
                                                widget.products[index]['count']
                                                    .toString(),
                                                15,
                                                Colors.black),
                                            GestureDetector(
                                              onTap: () {
                                                Map<String, dynamic> mp =
                                                    widget.products[index]
                                                        as Map<String, dynamic>;
                                                mp.addAll({
                                                  'count':
                                                      widget.products[index]
                                                              ['count'] +
                                                          1
                                                });
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
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
            Align(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => BookingAddress(
                            products: widget.products,
                          )));
                },
                child: Center(
                  child: Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height / 18,
                    width: MediaQuery.of(context).size.width / 1.5,
                    margin: const EdgeInsets.only(top: 20, bottom: 20),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 223, 187, 7),
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    child:
                        MATUtils().customText('Raise Query', 20, Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}

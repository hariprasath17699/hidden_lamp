import 'package:flutter/material.dart';
import 'package:hidden_lamp/screens/shop/view/cart.dart';
import 'package:provider/provider.dart';

import '../../../Provider/providers.dart';
import '../../../utils/MATUtils/MATUtils.dart';
import '../../../utils/SharedPreferances/sharedPreferaces.dart';

class Shop extends StatefulWidget {
  const Shop({Key? key}) : super(key: key);

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  String selectedOption = 'All';
  var subCategory = ['All', 'Robotics', '3D Printer', 'IOT'];
  List productsSelected = [];
  int count = 0;
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      getData();
    });
    super.initState();
  }

  getData() async {
    LogicState userProvider = Provider.of(context, listen: false);
    var userData = await sharedPreferances().getUserDetails();
    await userProvider.fetchProductsData();
  }

  @override
  Widget build(BuildContext context) {
    var productsData = Provider.of<LogicState>(context).getProductsData;
    var isProductsLoading = Provider.of<LogicState>(context).isProductsLoading;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => Cart(
                      products: productsSelected,
                    )));
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: MATUtils().customText('Shop', 22, Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (var i = 0; i < 4; i++)
                    Row(
                      children: [
                        Radio(
                          value: subCategory[i],
                          groupValue: selectedOption,
                          onChanged: (newValue) {
                            setState(() {
                              selectedOption = newValue.toString();
                            });
                          },
                        ),
                        Text(subCategory[i]),
                      ],
                    ),
                ],
              ),
              isProductsLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: productsData.length,
                      itemBuilder: (context, index) {
                        return selectedOption == 'All'
                            ? showProducts(productsData[index])
                            : productsData[index]['type'] == selectedOption
                                ? showProducts(productsData[index])
                                : Container();
                      })
            ],
          ),
        ),
      ),
    );
    ;
  }

  Widget showProducts(var productsData) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
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
                        productsData['ImageUrl'],
                        fit: BoxFit.fitWidth,
                        height: MediaQuery.of(context).size.height / 10,
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
                          productsData['productName'],
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
                        productsData['description'], 11, Colors.black),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MATUtils().customText("₹ 200", 15, Colors.black),
                        const SizedBox(
                          width: 30,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (!productsSelected.contains(productsData)) {
                              Map<String, dynamic> mp =
                                  productsData as Map<String, dynamic>;
                              mp.addAll({'count': 1});
                              productsSelected.add(mp);
                              setState(() {});
                            } else {
                              productsSelected.remove(productsData);
                              setState(() {});
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(25)),
                              color: !productsSelected.contains(productsData)
                                  ? Colors.black45
                                  : Colors.redAccent,
                            ),
                            child: productsSelected.contains(productsData)
                                ? const Text(
                                    "Added",
                                    style: TextStyle(color: Colors.white),
                                  )
                                : const Text(
                                    "Add to Cart",
                                    style: TextStyle(color: Colors.white),
                                  ),
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
  }
}

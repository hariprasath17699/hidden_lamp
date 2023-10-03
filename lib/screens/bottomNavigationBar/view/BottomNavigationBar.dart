import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';

import 'package:flutter/material.dart';
import 'package:hidden_lamp/screens/Courses/controller/Courses.dart';
import 'package:hidden_lamp/screens/assignments/view/Assignments.dart';
import 'package:hidden_lamp/screens/home/view/home.dart';
import 'package:hidden_lamp/screens/profile/view/profile.dart';
import 'package:hidden_lamp/screens/shop/view/shop.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _page = 0;
  var home;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  void initState() {
    home = Home();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          backgroundColor: Colors.white,
          items: const [
            CurvedNavigationBarItem(
              child: CircleAvatar(
                child: Icon(Icons.home),
              ),
              label: 'Home',
            ),
            CurvedNavigationBarItem(
              child: CircleAvatar(
                child: Icon(Icons.assessment),
                radius: 20,
              ),
              label: 'Tasks',
            ),
            CurvedNavigationBarItem(
              child: CircleAvatar(
                child: Icon(
                  Icons.book_online,
                  color: Colors.white,
                ),
              ),
              label: 'Courses',
            ),
            CurvedNavigationBarItem(
              child: CircleAvatar(
                child: Icon(Icons.shopping_cart),
                radius: 20,
              ),
              label: 'Shop',
            ),
            CurvedNavigationBarItem(
              child: CircleAvatar(
                child: Icon(Icons.person),
              ),
              label: 'Profile',
            ),
          ],
          onTap: (index) {
            setState(() {
              _page = index;
            });
            switch (index) {
              case 0:
                home = const Home();
                break;
              case 1:
                home = const Assignments();
                break;
              case 2:
                home = const Courses();
                break;
              case 3:
                home = const Shop();
                break;
              case 4:
                home = const Profile();
                break;
            }
          },
        ),
        body: home);
  }
}

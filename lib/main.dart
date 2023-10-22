import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:hidden_lamp/screens/bottomNavigationBar/view/BottomNavigationBar.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hidden_lamp/screens/SplashScreen/view/splashScreen.dart';

import 'Provider/providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => LogicState())],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LogicState(),
      child: MaterialApp(
        title: 'Hidden Lamp',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        //home: const CustomBottomNavigationBar(),
        home: SplashScreen(),
      ),
    );
  }
}

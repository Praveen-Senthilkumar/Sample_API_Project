
import 'package:flutter/material.dart';
import 'package:sample_project_1/feature/splash_screen.dart';
import 'package:sample_project_1/home/home_page.dart';




void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      //const MyHomePage(title: 'Random Fact'),
    );
  }
}



import 'package:flutter/material.dart';
import 'login_page.dart';
import 'homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    HomePage.tag: (context) => HomePage(),
  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Log in',
      theme: ThemeData(
        fontFamily: 'Nunito',
        primarySwatch: Colors.teal,
        backgroundColor: Colors.white60,
      ),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      routes: routes,
    );
  }
}




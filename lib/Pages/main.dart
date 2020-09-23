import 'package:flutter/material.dart';
import 'file:///G:/chinmay/login_flutterapp/lib/Pages/view_page.dart';
void main(){
  runApp(MyApp(),
  );
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        textTheme: TextTheme(body1: TextStyle(color: Colors.white),),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: View_page(),
    );
  }
}


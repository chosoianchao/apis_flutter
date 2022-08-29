import 'package:demo_call_apis/constant.dart';
import 'package:demo_call_apis/ui/add/add_screen.dart';
import 'package:demo_call_apis/ui/home_page/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      initialRoute: Constant.homeScreen,
      routes: {
        Constant.homeScreen: (context) => MyHomePage(title: 'Quản lý'),
        Constant.addScreen: (context) => AddScreen( isAdd: true,),
      },
    );
  }
}

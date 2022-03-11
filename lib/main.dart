import 'package:flutter/material.dart';
import 'package:http_request_task/pages/create_page.dart';
import 'package:http_request_task/pages/delete_page.dart';
import 'package:http_request_task/pages/detail_page.dart';
import 'package:http_request_task/pages/home_page.dart';
import 'package:http_request_task/pages/update_page.dart';

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
      home: HomePage(),
      routes: {
        HomePage.id:(context) => HomePage(),
        DetailPage.id:(context) => DetailPage(),
        CreatePage.id:(context) => CreatePage(),
        UpdatePage.id:(context) => UpdatePage(),
        DeletePage.id:(context) => DeletePage(),
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_walt_enterprise/pages/index_page.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '尼安德特官网',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        '/': (context) => IndexPage(),
      },
    );
  }

}



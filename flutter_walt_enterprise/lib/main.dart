import 'package:flutter/material.dart';
import 'package:flutter_walt_enterprise/pages/index_page.dart';
import 'package:flutter_walt_enterprise/pages/product_list_page.dart';
import 'package:flutter_walt_enterprise/pages/about_us_page.dart';
import 'package:flutter_walt_enterprise/pages/contact_us_page.dart';
import 'package:flutter_walt_enterprise/pages/news_list_page.dart';
import 'package:flutter_walt_enterprise/pages/leave_message_page.dart';

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

        '/': (context) => IndexPageHome(),
        'product_list_page':(context) => ProductListPageHome(),
        'about_us':(context) => AboutUsPageHome(),
        'contact_us':(context) => ContactUsPageHome(),
        'news_list_page':(contact) => NewsListPageHome(),
        'leave_message_page':(contact) => LeaveMessagePageHome(),

      },
    );
  }



}



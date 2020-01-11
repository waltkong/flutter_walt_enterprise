import 'package:flutter/material.dart';
import 'package:flutter_walt_enterprise/components/category_memu_component.dart';
import 'package:flutter_walt_enterprise/components/drawer_component.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_walt_enterprise/components/banner_component.dart';
import 'package:flutter_walt_enterprise/components/my_separator.dart';

import 'package:flutter_walt_enterprise/datas/product_data.dart';
import 'package:flutter_walt_enterprise/datas/news_data.dart';
import 'package:flutter_walt_enterprise/datas/about_us_data.dart';


class NewsDetailPage extends StatelessWidget {


  final String id;

  NewsDetailPage({
    this.id
  });


  @override
  Widget build(BuildContext context) {

    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context); //iphone6 必须build里写

    return Container(
      child: Scaffold(

        appBar: AppBar(
          title: Text('新闻详情'),
        ),

        drawer: Drawer(
          child: DrawerComponent(),
        ),

        body: Container(
          child: ListView(
            children: <Widget>[

              Container(
                child: BannerComponent(),
              ),

              Container(
                child: CategoryMenuComponent(
                  categoryRow: {'name':'新闻展示'},
                  subCategoryList: [{'name':'公司资讯'},{'name':'行业资讯'}],
                  showOrHide: 'hide',
                ),
              ),


              Container(
                child: Center(
                  child: Text('新闻详情'),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

}





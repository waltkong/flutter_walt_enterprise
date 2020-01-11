import 'package:flutter/material.dart';
import 'package:flutter_walt_enterprise/components/category_memu_component.dart';
import 'package:flutter_walt_enterprise/components/drawer_component.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_walt_enterprise/components/banner_component.dart';
import 'package:flutter_walt_enterprise/components/my_separator.dart';

import 'package:flutter_walt_enterprise/datas/product_data.dart';
import 'package:flutter_walt_enterprise/datas/news_data.dart';
import 'package:flutter_walt_enterprise/datas/about_us_data.dart';

class ContactUsPageHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ContactUsPage();
  }
}


class ContactUsPage extends StatefulWidget {
  @override
  _ContactUsPageState createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {

  Map _aboutUsInfo;

  @override
  void initState() {

    super.initState();

    this._aboutUsInfo = AboutUsData.data;

  }


  @override
  Widget build(BuildContext context) {

    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context); //iphone6 必须build里写

    return Container(
      child: Scaffold(

        appBar: AppBar(
          title: Text('关于我们'),
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
                  categoryRow: {'name':'联系我们'},
                  subCategoryList: [],
                  showOrHide: 'hide',
                ),
              ),

              _contactUsBox(),

            ],
          ),
        ),
      ),
    );
  }


  Widget _contactUsBox(){
    return Container(
      margin: EdgeInsets.only(top:10),
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          Container(
            height: ScreenUtil().setHeight(100),
            child: Text(
              "公司地址： ${_aboutUsInfo['address']}",
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.left,
            ),
          ),

          Container(
            height: ScreenUtil().setHeight(100),
            child: Text(
              "联系电话： ${_aboutUsInfo['phone']}",
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.left,
            ),
          ),

          Container(
            height: ScreenUtil().setHeight(100),
            child: Text(
              "联系人： ${_aboutUsInfo['user']}",
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.left,
            ),
          ),



        ],
      ),
    );
  }



}

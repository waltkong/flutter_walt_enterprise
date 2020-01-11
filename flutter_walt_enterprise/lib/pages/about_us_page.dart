import 'package:flutter/material.dart';
import 'package:flutter_walt_enterprise/components/category_memu_component.dart';
import 'package:flutter_walt_enterprise/components/drawer_component.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_walt_enterprise/components/banner_component.dart';
import 'package:flutter_walt_enterprise/components/my_separator.dart';

import 'package:flutter_walt_enterprise/datas/product_data.dart';
import 'package:flutter_walt_enterprise/datas/news_data.dart';
import 'package:flutter_walt_enterprise/datas/about_us_data.dart';

class AboutUsPageHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AboutUsPage();
  }
}


class AboutUsPage extends StatefulWidget {
  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {

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
                  categoryRow: {'name':'关于我们'},
                  subCategoryList: [],
                  showOrHide: 'hide',
                ),
              ),

              _aboutUsBox(),

            ],
          ),
        ),
      ),
    );
  }


  Widget _aboutUsBox(){
    return Container(
      margin: EdgeInsets.only(top:10),
      padding: EdgeInsets.all(5),
      child: Column(
        children: <Widget>[

          Image.asset(_aboutUsInfo['image'],
            width: ScreenUtil().setWidth(730),
            height: ScreenUtil().setHeight(400),
            fit: BoxFit.cover,
          ),

          Container(
            width: ScreenUtil().setWidth(730),
            height: ScreenUtil().setHeight(450),
            child: Text(
              _aboutUsInfo['content'],
              style: TextStyle(
                color: Color.fromRGBO(153,153,153, 1),
                fontSize: 18,
              ),
              overflow:TextOverflow.ellipsis,
              maxLines: 8,
            ),
          ),



        ],
      ),
    );
  }



}

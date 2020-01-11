import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_walt_enterprise/components/drawer_component.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_walt_enterprise/components/banner_component.dart';
import 'package:flutter_walt_enterprise/components/my_separator.dart';

import 'package:flutter_walt_enterprise/datas/product_data.dart';
import 'package:flutter_walt_enterprise/datas/news_data.dart';
import 'package:flutter_walt_enterprise/datas/about_us_data.dart';

class IndexPageHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IndexPage();
  }
}


class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {

  List _productList;
  List _newsList;
  Map _aboutUsInfo;

  @override
  void initState() {
    super.initState();

    this._productList = ProductData.list;

    this._productList.retainWhere((element) => int.parse(element['id']) <5 );

    this._newsList  = NewsData.list;
    this._newsList.retainWhere((element) => int.parse(element['id']) <5 );

    this._aboutUsInfo = AboutUsData.data;
  }

  @override
  Widget build(BuildContext context) {

    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context); //iphone6 必须build里写

    return Container(

      child: Scaffold(
        appBar: AppBar(
          title: Text('我的官网'),
        ),
        drawer: Drawer(
          child: DrawerComponent(),
        ),
        body: Container(
          child: ListView(
            children: <Widget>[

            // banner
              Container(
                child: BannerComponent(),
              ),

              //产品展示
              _commonHeader('assets/images/dog1.jpg','产品展示','product_list_page'),
              MySeparator(height: 0.2,),
              _productListBox(),

              _commonHeader('assets/images/dog2.jpg','新闻中心','news_list_page'),
              MySeparator(height: 0.2,),
              _newsListBox(),

              _commonHeader('assets/images/dog2.jpg','关于我们','about_us'),
              MySeparator(height: 0.2,),
              _aboutUsBox(),

              _commonHeader('assets/images/dog2.jpg','联系我们','contact_us'),
              MySeparator(height: 0.2,),
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



  Widget _newsListBox(){
    return Container(
      margin: EdgeInsets.only(top:10),
      child: Column(
        children: _getNewsListWidget(),
      ),
    );
  }


  List<Widget> _getNewsListWidget(){
    return _newsList.map((item){
      return _newsItem(item);
    }).toList();
  }

  Widget _newsItem(Map item){
    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(200),
      padding: EdgeInsets.all(10),
      child:   Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[

          Container(
            width: ScreenUtil().setWidth(160),
            height:  ScreenUtil().setHeight(160),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Color.fromRGBO(46,58,124, 1),
            ),
            child: Column(
              children: <Widget>[
                Text(item['time_d'],textAlign: TextAlign.center,style: TextStyle(fontSize: 20,color: Colors.white),),
                Text(item['time_ym'],textAlign: TextAlign.center,style: TextStyle(fontSize: 14,color: Colors.white),),
              ],
            ),
          ),

          Container(
            margin: EdgeInsets.only(left: 10,right: 10),
            width: ScreenUtil().setWidth(450),
            height:  ScreenUtil().setHeight(160),
            child: Column(
              children: <Widget>[
                Container(
                  child: Text(item['name'],
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w300),
                    overflow: TextOverflow.ellipsis,),
                ),
                Container(
                  child: Text(item['description'],
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 16,color: Colors.black),
                    overflow: TextOverflow.ellipsis,
                  ),

                ),
              ],
            ),
          ),

        ],
      ),
    );
  }


  List<Widget> _getProductListWidget(){
    return _productList.map((item){
      return _productItem(item);
    }).toList();
  }

  Widget _productItem(Map item){
    return Container(
      width: ScreenUtil().setWidth(370),
      height: ScreenUtil().setHeight(340),
      decoration: BoxDecoration(
        border: Border(
          left:BorderSide(style: BorderStyle.solid),
          right: BorderSide(style: BorderStyle.solid),
          top: BorderSide(style: BorderStyle.solid),
          bottom: BorderSide(style: BorderStyle.solid),
        ),
      ),
      child: Column(
        children: <Widget>[
          Image.asset(item['image'],
            width: ScreenUtil().setWidth(370),
            height: ScreenUtil().setHeight(290),
            fit: BoxFit.cover,
          ),
          Container(
            width: ScreenUtil().setWidth(370),
            height: ScreenUtil().setHeight(48),
            child: Text(item['name'],
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Color.fromRGBO(95,95,95, 1),
              ),
            ),
          ),
        ],
      ),
    );

  }


  Widget _productListBox(){
    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(750),
      margin: EdgeInsets.only(top:10),
      child: GridView.count(
        children: _getProductListWidget(),
        crossAxisCount: 2,
        padding: EdgeInsets.all(2),
        crossAxisSpacing: 20,
        // 水平距离
        mainAxisSpacing: 20,
        // 垂直距离
        childAspectRatio: 3.5/4, // 宽高比例
      ),
    );
  }


  //公共的头部
  Widget _commonHeader(String _icon,String _title,String _route){
    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(120),
      padding: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          Image.asset(_icon,
            width: ScreenUtil().setWidth(100),
            height: ScreenUtil().setHeight(100),
            fit: BoxFit.cover
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Text(_title,
              style: TextStyle(
                color: Color.fromRGBO(46,58,124, 1),
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),

          InkWell(
            onTap: (){

            },
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(246,180,4, 1),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              margin: EdgeInsets.only(right: 0,left: 100),
              width: ScreenUtil().setWidth(200),
              height: ScreenUtil().setHeight(100),
              child: Text('查看更多>>',
                style: TextStyle(color: Colors.white,fontSize: 18),textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          
        ],
      ),
    );
  }



}


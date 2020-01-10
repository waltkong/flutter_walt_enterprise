import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_walt_enterprise/components/drawer_component.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_walt_enterprise/components/banner_component.dart';
import 'package:flutter_walt_enterprise/components/my_separator.dart';
import 'package:flutter_walt_enterprise/datas/product_data.dart';
import 'package:flutter_walt_enterprise/datas/banner_data.dart';

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

  List _bannerList;
  List _productList;


  @override
  void initState() {
    super.initState();

    this._bannerList = BannerData.list;
    this._productList = ProductData.list;
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
                child: BannerComponent(list:_bannerList),
              ),

              //产品展示
              _commonHeader('assets/images/dog1.jpg','产品展示',''),
              MySeparator(height: 0.2,),
              _productListBox(),


              _commonHeader('assets/images/dog2.jpg','新闻中心',''),
              MySeparator(height: 0.2,),
              _commonHeader('assets/images/dog2.jpg','新闻中心',''),
              MySeparator(height: 0.2,),
              _commonHeader('assets/images/dog2.jpg','新闻中心',''),
              MySeparator(height: 0.2,),
              _commonHeader('assets/images/dog2.jpg','新闻中心',''),
              MySeparator(height: 0.2,),


            ],
          ),
        ),
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
      height: ScreenUtil().setHeight(370),
      child: Column(
        children: <Widget>[
          Image.asset(item['image'],
            width: ScreenUtil().setWidth(370),
            height: ScreenUtil().setHeight(290),
            fit: BoxFit.cover,
          ),
          Container(
            width: ScreenUtil().setWidth(370),
            height: ScreenUtil().setHeight(78),
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
      height: ScreenUtil().setWidth(750),
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


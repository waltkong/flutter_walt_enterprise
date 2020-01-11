import 'package:flutter/material.dart';
import 'package:flutter_walt_enterprise/components/category_memu_component.dart';
import 'package:flutter_walt_enterprise/components/drawer_component.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_walt_enterprise/components/banner_component.dart';
import 'package:flutter_walt_enterprise/components/my_separator.dart';

import 'package:flutter_walt_enterprise/datas/product_data.dart';
import 'package:flutter_walt_enterprise/datas/news_data.dart';
import 'package:flutter_walt_enterprise/datas/about_us_data.dart';

class ProductListPageHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProductListPage();
  }
}

class ProductListPage extends StatefulWidget {

  @override
  _ProductListPageState createState() => _ProductListPageState();

}

class _ProductListPageState extends State<ProductListPage> {
  List _productList;

  @override
  void initState() {

    super.initState();

    this._productList = ProductData.list;
    this._productList.retainWhere((element) => int.parse(element['id']) <15 );

  }

  @override
  Widget build(BuildContext context) {

    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context); //iphone6 必须build里写

    return Container(

      child: Scaffold(

        appBar: AppBar(
          title: Text('产品列表'),
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
                  categoryRow: {'name':'产品展示'},
                  subCategoryList: [{'name':'子分类1'},{'name':'子分类2'}],
                  showOrHide: 'hide',
                ),
              ),

              _productListBox(),

            ],

          ),
        ),
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




}


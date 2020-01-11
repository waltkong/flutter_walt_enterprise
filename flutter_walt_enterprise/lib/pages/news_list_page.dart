import 'package:flutter/material.dart';
import 'package:flutter_walt_enterprise/components/category_memu_component.dart';
import 'package:flutter_walt_enterprise/components/drawer_component.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_walt_enterprise/components/banner_component.dart';
import 'package:flutter_walt_enterprise/components/my_separator.dart';

import 'package:flutter_walt_enterprise/datas/product_data.dart';
import 'package:flutter_walt_enterprise/datas/news_data.dart';
import 'package:flutter_walt_enterprise/datas/about_us_data.dart';
import 'package:flutter_walt_enterprise/pages/news_detail_page.dart';

class NewsListPageHome extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return NewsListPage();

  }

}


class NewsListPage extends StatefulWidget {
  @override
  _NewsListPageState createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {

  List _newsList;

  @override
  void initState() {
    super.initState();

    this._newsList = NewsData.list;
    this._newsList.retainWhere((element) => int.parse(element['id']) <15 );
  }


  @override
  Widget build(BuildContext context) {

    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context); //iphone6 必须build里写


    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('新闻列表'),
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

              _newsListBox(),

            ],

          ),
        ),

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
    return InkWell(
      onTap: (){

        Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
          return new NewsDetailPage(id: item['id']);
        }));

      },
      child: Container(
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
      ),
    );
  }


}


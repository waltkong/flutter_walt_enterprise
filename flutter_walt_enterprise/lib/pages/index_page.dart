import 'package:flutter/material.dart';
import 'package:flutter_walt_enterprise/components/drawer_component.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_walt_enterprise/components/banner_component.dart';


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

  List _bannerList = [
    {'image':'assets/images/dog1.jpg'},
    {'image':'assets/images/dog2.jpg'},
    {'image':'assets/images/dog3.jpg'},
    {'image':'assets/images/dog4.jpg'},
  ];


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context); //iphone6 必须build里写

    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('尼安德特'),
        ),
        drawer: Drawer(
          child: DrawerComponent(),
        ),
        body: Container(
          child: Column(
            children: <Widget>[

              Container(
                child: BannerComponent(list:_bannerList),
              ),

            ],
          ),
        ),
      ),
    );
  }


}


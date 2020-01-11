import 'package:flutter/material.dart';
import 'package:flutter_walt_enterprise/components/category_memu_component.dart';
import 'package:flutter_walt_enterprise/components/drawer_component.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_walt_enterprise/components/banner_component.dart';
import 'package:flutter_walt_enterprise/components/my_separator.dart';

import 'package:flutter_walt_enterprise/datas/product_data.dart';
import 'package:flutter_walt_enterprise/datas/news_data.dart';
import 'package:flutter_walt_enterprise/datas/about_us_data.dart';

class LeaveMessagePageHome extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return LeaveMessagePage();
  }

}

class LeaveMessagePage extends StatefulWidget {
  @override
  _LeaveMessagePageState createState() => _LeaveMessagePageState();
}

class _LeaveMessagePageState extends State<LeaveMessagePage> {

  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _msgController = TextEditingController();

  var submitData = {};


  TextEditingController _getThisController(String str){
    switch(str){
      case 'name':
        return _nameController;
      case 'phone':
        return _phoneController;
      case 'email':
        return _emailController;
      case 'msg':
        return _msgController;
    }
    return null;
  }

  String _getLabelName(String str){
    switch(str){
      case 'name':
        return '姓名name';
      case 'phone':
        return '电话phone';
      case 'email':
        return '邮箱email';
      case 'msg':
        return '您的留言message';
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {

    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context); //iphone6 必须build里写

    return Container(
      child: Scaffold(

        appBar: AppBar(
          title: Text('在线留言'),
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
                  categoryRow: {'name':'在线留言'},
                  subCategoryList: [],
                  showOrHide: 'hide',
                ),
              ),

              _leaveMessageFormBox(),

            ],
          ),
        ),

      ),
    );
  }


  Widget _leaveMessageFormBox(){
    return Container(
      child: Column(
        children: <Widget>[

          _textRow('name'),
          _textRow('phone'),
          _textRow('email'),
          _textRow('msg'),

          RaisedButton(
            onPressed: (){

            },
            child: Text('提交'),
            color: Color.fromRGBO(197,207,210, 1),
            textColor: Colors.white,
          ),

        ],
      ),
    );
  }

  Widget _textRow(String str){

    TextEditingController _controller = _getThisController(str);

    return Container(
      child: TextField(
        controller: _controller,
        decoration: new InputDecoration(
          labelText: _getLabelName(str),
          border: OutlineInputBorder(),
        ),
        autofocus: false,
        maxLines: str=='msg'? 3:1,
        onChanged: (val){
          _controller.text = val;
          submitData[str] = val;
        },
        onSubmitted: (String v){
          print(v);
        },
      ),
    );

  }




}


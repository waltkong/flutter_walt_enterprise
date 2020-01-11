import 'package:flutter/material.dart';

class DrawerComponent extends StatefulWidget {
  @override
  _DrawerComponentState createState() => _DrawerComponentState();
}

class _DrawerComponentState extends State<DrawerComponent> {

  int highLightIndex = 0;
  bool hideOrShow = true;


  @override
  Widget build(BuildContext context) {

    return Container(
      child: ListView(
        children: <Widget>[

          drawerHeaderBox(),

          ListTile(
            title: Text(
              '网站首页', style: TextStyle(fontSize: 20,color: highLightIndex==0? Colors.blue : Colors.black),
            ),
            onTap: (){
              setState(() {
                highLightIndex = 0;
              });

              Navigator.of(context).pushNamed('/');

            },
          ),

          Divider(
            height: 1,
          ),

          ListTile(

            title: Text(
              '关于我们', style: TextStyle(fontSize: 20,color: highLightIndex==1? Colors.blue : Colors.black),
            ),

            onTap: (){
              setState(() {
                highLightIndex = 1;
              });
              Navigator.of(context).pushNamed('about_us');
            },

          ),


          Divider(
            height: 1,
          ),

          ListTile(
            onTap: (){
              setState(() {
                highLightIndex = 2;
              });
              Navigator.of(context).pushNamed('news_list_page');
            },
            title: Text(
              '新闻中心', style: TextStyle(fontSize: 20,color: highLightIndex==2? Colors.blue : Colors.black),
            ),
//            trailing: IconButton(
//              icon: Icon(highLightIndex ==2 ? Icons.remove : Icons.add),
//              onPressed: (){
//                setState(() {
//                  highLightIndex = 2;
//                  hideOrShow = hideOrShow ? false : true;
//                });
//              },
//            ),
          ),

//          FutureBuilder(
//            future: null,
//            builder: (BuildContext context,snapshot){
//              if(highLightIndex == 2 && hideOrShow){
//                return Column(
//                  children: <Widget>[
//                    ListTile(
//                      title: Text('公司资讯', style: TextStyle(fontSize: 20)),
//                      leading: Container(width: 20,),
//                      onTap: (){
//                        setState(() {
//                          highLightIndex = 2;
//                        });
//                      },
//                    ),
//                    ListTile(
//                      title: Text('行业资讯', style: TextStyle(fontSize: 20)),
//                      leading: Container(width: 20,),
//                      onTap: (){
//                        setState(() {
//                          highLightIndex = 2;
//                        });
//                      },
//                    ),
//
//                  ],
//                );
//              }
//              return Container();
//            },
//          ),

          Divider(
            height: 1,
          ),

          ListTile(
            onTap: (){
                setState(() {
                  highLightIndex = 3;
                });
              Navigator.of(context).pushNamed('product_list_page');
            },
            title: Text(
              '产品展示', style: TextStyle(fontSize: 20,color: highLightIndex==3? Colors.blue : Colors.black),
            ),
//            trailing: IconButton(
//              icon: Icon(highLightIndex ==3 ? Icons.remove : Icons.add),
//              onPressed: (){
//                setState(() {
//                  highLightIndex = 3;
//                  hideOrShow = hideOrShow ? false : true;
//                });
//              },
//            ),
          ),

//          FutureBuilder(
//            future: null,
//            builder: (BuildContext context,snapshot){
//              if(highLightIndex == 3 && hideOrShow){
//                return Column(
//                  children: <Widget>[
//                    ListTile(
//                      title: Text('硬件产品', style: TextStyle(fontSize: 20)),
//                      leading: Container(width: 20,),
//                      onTap: (){
//                        setState(() {
//                          highLightIndex = 3;
//                        });
//
//
//                      },
//                    ),
//                    ListTile(
//                      title: Text('软件产品', style: TextStyle(fontSize: 20)),
//                      leading: Container(width: 20,),
//                      onTap: (){
//                        setState(() {
//                          highLightIndex = 3;
//                        });
//                      },
//                    ),
//
//                  ],
//                );
//              }
//              return Container();
//            },
//          ),

          Divider(
            height: 1,
          ),


          ListTile(
            title: Text(
              '在线留言', style: TextStyle(fontSize: 20,color: highLightIndex==4? Colors.blue : Colors.black),
            ),
            onTap: (){
              setState(() {
                highLightIndex = 4;
              });
              Navigator.of(context).pushNamed('leave_message_page');

            },
          ),

          Divider(
            height: 1,
          ),

          ListTile(
            title: Text(
              '联系我们', style: TextStyle(fontSize: 20,color: highLightIndex==5? Colors.blue : Colors.black),
            ),
            onTap: (){
              setState(() {
                highLightIndex = 5;
              });
              Navigator.of(context).pushNamed('contact_us');
            },
          ),

          Divider(
            height: 1,
          ),

        ],
      ),
    );

  }


  Widget drawerHeaderBox(){
    return Container(
      height: 80,
      decoration: BoxDecoration(
          color: Color.fromRGBO(170,170,170, 1.0)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          Image.asset(
            "assets/images/dog3.jpg",
            width: 50.0,
            height: 50.0,
          ),

          Container(
            margin: EdgeInsets.only(left: 10),
            child: Text('400-123-4567',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize:20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

        ],
      ),
    );
  }


}


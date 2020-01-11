import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryMenuComponent extends StatefulWidget {

  final Map categoryRow;
  final List subCategoryList;
  final String showOrHide;

  CategoryMenuComponent({
    this.categoryRow,
    this.subCategoryList,
    this.showOrHide='hide',
});

  @override
  _CategoryMenuComponentState createState() => _CategoryMenuComponentState(
      categoryRow: categoryRow,
      subCategoryList: subCategoryList,
      showOrHide: showOrHide,
  );
}


class _CategoryMenuComponentState extends State<CategoryMenuComponent> {


  Map categoryRow;
  List subCategoryList;
  String showOrHide;

  _CategoryMenuComponentState({
    this.categoryRow,
    this.subCategoryList,
    this.showOrHide
});

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[

          Container(
            padding: EdgeInsets.all(5),
            height: ScreenUtil().setHeight(100),
            decoration: BoxDecoration(
              color: Color.fromRGBO(45,57,123, 1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(categoryRow['name'],
                  style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.w400),
                ),

                Container(
                  child: Row(
                    children: <Widget>[
                      Text('分类',
                        style: TextStyle(color: Colors.white,fontSize: 18),
                      ),
                      IconButton(
                        icon: Icon(showOrHide=='show' ? Icons.arrow_upward : Icons.arrow_downward,color: Colors.white,),
                        onPressed: (){

                          setState(() {
                            showOrHide = showOrHide=='show' ? 'hide': 'show';
                          });

                        },
                      ),
                    ],
                  ),
                ),


              ],
            ),
          ),

          FutureBuilder(
            future: null,
            builder: (BuildContext context, snapshot){
              if(showOrHide == 'show'){
                return subCategoryListBox();
              }
              return Container();
            },
          ),

        ],
      ),
    );
  }


  Widget subCategoryListBox(){
    return Column(
      children: _getProductListWidget(),
    );
  }

  List<Widget> _getProductListWidget(){
    return subCategoryList.map((item){
      return _subCategoryItem(item);
    }).toList();
  }

  Widget _subCategoryItem(Map item){
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey,width: 0.5),
        color: Color.fromRGBO(247,247,247, 0.3),
      ),
      width: ScreenUtil().setWidth(730),
      height: ScreenUtil().setHeight(100),
      child: InkWell(
        child: Text(
          item['name'],
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 20),
        ),
        onTap: (){

          setState(() {
            showOrHide = showOrHide=='show' ? 'hide': 'show';
          });

        },
      ),
    );
  }


}

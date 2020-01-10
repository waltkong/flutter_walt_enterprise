import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannerComponent extends StatelessWidget {

  final List list;

  BannerComponent({this.list});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(333),
      child: Swiper(
        itemCount: list.length,
        itemBuilder: (BuildContext context,int index){
          return Image.asset(
            list[index]['image'],
            width: ScreenUtil().setWidth(750),
            height: ScreenUtil().setHeight(230),
            fit: BoxFit.cover,
          );
        },
        pagination: SwiperPagination(),
        autoplay: true,
      ),
    );
  }



}

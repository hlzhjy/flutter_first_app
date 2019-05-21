import 'package:flutter/material.dart';
//SingleChildScrollView类似于Android中的ScrollView，它只能接收一个子Widget
//SingleChildScrollView({ 属性
//this.scrollDirection = Axis.vertical, //滚动方向，默认是垂直方向
//this.reverse = false,该属性API文档解释是：是否按照阅读方向相反的方向滑动，
// 如：scrollDirection值为Axis.horizontal，如果阅读方向是从左到右(取决于语言环境，阿拉伯语就是从右到左)，
// reverse为true时，那么滑动方向就是从右往左。其实此属性本质上是决定可滚动widget的初始滚动位置是在“头”还是“尾”，
// 取false时，初始滚动位置在“头”，反之则在“尾”，

//this.padding,
//bool primary,指是否使用widget树中默认的PrimaryScrollController；
// 当滑动方向为垂直方向（scrollDirection值为Axis.vertical）并且controller没有指定时，primary默认为true.
//this.physics,
//this.controller,
//this.child,
//})
class SingleChildScrollViewTestRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return Scaffold(
      appBar: AppBar(
        title: Text("SingleChildScrollView"),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              //动态创建一个List<Widget>
              children: str.split("")
              //每一个字母都用一个Text显示,字体为原来的两倍
                  .map((c) => Text(c, textScaleFactor: 2.0,))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }

}
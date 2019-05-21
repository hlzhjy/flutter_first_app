import 'package:flutter/material.dart';
import 'SingleChildScrollViewTestRoute.dart';
import 'package:flutter_first_app/components/scrollers/listviews/ListViewTestRoute.dart';
import 'package:flutter_first_app/components/scrollers/gridviews/GridViewTestRoute.dart';
import 'customscrollViews/CustomScrollViewRoute.dart';
import 'scrollcontroller/ScrollControllerRoute.dart';

//当内容超过显示视口(ViewPort)时，如果没有特殊处理，Flutter则会提示Overflow错误。
// 为此，Flutter提供了多种可滚动widget（Scrollable Widget）用于显示列表和长布局。
//可滚动Widget都直接或间接包含一个Scrollable widget
//Scrollable({
//...
//this.axisDirection = AxisDirection.down,滚动方向。
//this.controller,此属性接受一个ScrollController对象。ScrollController的主要作用是控制滚动位置和监听滚动事件。
//this.physics,此属性接受一个ScrollPhysics对象，它决定可滚动Widget如何响应用户操作，
// 比如用户滑动完抬起手指后，继续执行动画；或者滑动到边界时，如何显示。
//@required this.viewportBuilder, //后面介绍
//})
class ScrollerWidgetsRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => ScrollerWidgetsState();

}

class ScrollerWidgetsState extends State<ScrollerWidgetsRoute>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("可滚动Widgets"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Wrap(
            spacing: 4.0, // 主轴(水平)方向间距
            runSpacing: 4.0, // 纵轴（垂直）方向间距
            alignment: WrapAlignment.center, //沿主轴方向居中
            children: <Widget>[
              RaisedButton(
                  child: Text("SingleChildScrollView",style: TextStyle(color: Colors.white),),
                  color: Colors.red,
                  onPressed: (){
                    Navigator.push(context, new MaterialPageRoute(builder: (context){
                      return new SingleChildScrollViewTestRoute();
                    }));
                  }),
              RaisedButton(
                  child: Text("ListView",style: TextStyle(color: Colors.white),),
                  color: Colors.red,
                  onPressed: (){
                    Navigator.push(context, new MaterialPageRoute(builder: (context){
                      return new ListViewTestRoute();
                    }));
                  }),
              RaisedButton(
                  child: Text("GridView",style: TextStyle(color: Colors.white),),
                  color: Colors.red,
                  onPressed: (){
                    Navigator.push(context, new MaterialPageRoute(builder: (context){
                      return new GridViewTestRoute();
                    }));
                  }),
              RaisedButton(
                  child: Text("CustomScrollView",style: TextStyle(color: Colors.white),),
                  color: Colors.red,
                  onPressed: (){
                    Navigator.push(context, new MaterialPageRoute(builder: (context){
                      return new CustomScrollViewRoute();
                    }));
                  }),
              RaisedButton(
                  child: Text("滚动监听及控制",style: TextStyle(color: Colors.white),),
                  color: Colors.red,
                  onPressed: (){
                    Navigator.push(context, new MaterialPageRoute(builder: (context){
                      return new ScrollControllerRoute();
                    }));
                  }),
            ]
        ),
      ),
    );
  }

}
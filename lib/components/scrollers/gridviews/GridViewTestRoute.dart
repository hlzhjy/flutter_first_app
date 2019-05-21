import 'package:flutter/material.dart';
import 'SliverGridDelegateWithFixedCrossAxisCountRoute.dart';
import 'SliverGridDelegateWithMaxCrossAxisExtentRoute.dart';
import 'GridVIewBuilderRoute.dart';
import 'StaggeredGridViewRoute.dart';
/*
GridView可以构建一个二维网格列表，其默认构造函数定义如下：
GridView({
  Axis scrollDirection = Axis.vertical,
  bool reverse = false,
  ScrollController controller,
  bool primary,
  ScrollPhysics physics,
  bool shrinkWrap = false,
  EdgeInsetsGeometry padding,
  @required SliverGridDelegate gridDelegate, //控制子widget layout的委托
  bool addAutomaticKeepAlives = true,
  bool addRepaintBoundaries = true,
  double cacheExtent,
  List<Widget> children = const <Widget>[],
})
GridView和ListView的大多数参数都是相同的，它们的含义也都相同，如有疑惑读者可以翻阅ListView一节，在此不再赘述。
我们唯一需要关注的是gridDelegate参数，类型是SliverGridDelegate，它的作用是控制GridView子widget如何排列(layout)，
SliverGridDelegate是一个抽象类，定义了GridView Layout相关接口，子类需要通过实现它们来实现具体的布局算法，
Flutter中提供了两个SliverGridDelegate的子类SliverGridDelegateWithFixedCrossAxisCount和
SliverGridDelegateWithMaxCrossAxisExtent
 */
class GridViewTestRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => GridViewTestState();
}

class GridViewTestState extends State<GridViewTestRoute>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("GridView Demo"),
      ),
      body: Padding(padding: EdgeInsets.all(10),
        child: Wrap(
          spacing: 4.0,
          runSpacing: 4.0,
          alignment: WrapAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("SliverGridDelegateWithFixedCrossAxisCount",style: TextStyle(color: Colors.white),),
              color: Colors.cyan,
              onPressed: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context){
                  return new SliverGridDelegateWithFixedCrossAxisCountRoute();
                }));
              }
            ),
            RaisedButton(
                child: Text("SliverGridDelegateWithMaxCrossAxisExtent",style: TextStyle(color: Colors.white),),
                color: Colors.cyan,
                onPressed: (){
                  Navigator.push(context, new MaterialPageRoute(builder: (context){
                    return new SliverGridDelegateWithMaxCrossAxisExtentRoute();
                  }));
                }
            ),
            RaisedButton(
                child: Text("GridView.Builder",style: TextStyle(color: Colors.white),),
                color: Colors.cyan,
                onPressed: (){
                  Navigator.push(context, new MaterialPageRoute(builder: (context){
                    return new GridVIewBuilderRoute();
                  }));
                }
            ),
            RaisedButton(
                child: Text("StaggeredGridView瀑布流",style: TextStyle(color: Colors.white),),
                color: Colors.cyan,
                onPressed: (){
                  Navigator.push(context, new MaterialPageRoute(builder: (context){
                    return new StaggeredGridViewRoute();
                  }));
                }
            )
          ],
        ),
      ),
    );
  }
}
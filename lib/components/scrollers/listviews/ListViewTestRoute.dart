import 'package:flutter/material.dart';
import 'DefaultListViewRoute.dart';
import 'BuilderListViewRoute.dart';
import 'SeparatedListViewRoute.dart';
import 'InfiniteListView.dart';
import 'AddListTitleRoute.dart';
/*
ListView是最常用的可滚动widget，它可以沿一个方向线性排布所有子widget。
ListView({
  ...
  //可滚动widget公共参数
  Axis scrollDirection = Axis.vertical,
  bool reverse = false,
  ScrollController controller,
  bool primary,
  ScrollPhysics physics,
  EdgeInsetsGeometry padding,

  //ListView各个构造函数的共同参数
  double itemExtent,
  bool shrinkWrap = false,
  bool addAutomaticKeepAlives = true,
  bool addRepaintBoundaries = true,
  double cacheExtent,

  //子widget列表
  List<Widget> children = const <Widget>[],
})
上面参数分为两组：第一组是可滚动widget公共参数，前面已经介绍过，不再赘述；
第二组是ListView各个构造函数（ListView有多个构造函数）的共同参数
itemExtent：该参数如果不为null，则会强制children的"长度"为itemExtent的值；这里的"长度"是指滚动方向上子widget的长度，
即如果滚动方向是垂直方向，则itemExtent代表子widget的高度，如果滚动方向为水平方向，则itemExtent代表子widget的长度。
在ListView中，指定itemExtent比让子widget自己决定自身长度会更高效，这是因为指定itemExtent后，滚动系统可以提前知道列表的长度，
而不是总是动态去计算，尤其是在滚动位置频繁变化时（滚动系统需要频繁去计算列表高度）。

shrinkWrap：该属性表示是否根据子widget的总长度来设置ListView的长度，默认值为false 。默认情况下，
ListView的会在滚动方向尽可能多的占用空间。当ListView在一个无边界(滚动方向上)的容器中时，shrinkWrap必须为true。

addAutomaticKeepAlives：该属性表示是否将列表项（子widget）包裹在AutomaticKeepAlive widget中；
典型地，在一个懒加载列表中，如果将列表项包裹在AutomaticKeepAlive中，在该列表项滑出视口时该列表项不会被GC，
它会使用KeepAliveNotification来保存其状态。如果列表项自己维护其KeepAlive状态，那么此参数必须置为false。

addRepaintBoundaries：该属性表示是否将列表项（子widget）包裹在RepaintBoundary中。当可滚动widget滚动时，
将列表项包裹在RepaintBoundary中可以避免列表项重绘，但是当列表项重绘的开销非常小（如一个颜色块，或者一个较短的文本）时，
不添加RepaintBoundary反而会更高效。和addAutomaticKeepAlive一样，如果列表项自己维护其KeepAlive状态，那么此参数必须置为false。
 */

class ListViewTestRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
      ),
      body: Padding(
          padding: EdgeInsets.all(10),
        child: Wrap(
          spacing: 4.0,
          runSpacing: 4.0,
          alignment: WrapAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("默认构造函数",style: TextStyle(color: Colors.white),),
                color: Colors.orange,
                onPressed: (){
                  Navigator.push(context, new MaterialPageRoute(builder: (context){
                    return new DefaultListViewRoute();
                  }));
                }
            ),
            RaisedButton(
                child: Text("ListView.Builder",style: TextStyle(color: Colors.white),),
                color: Colors.orange,
                onPressed: (){
                  Navigator.push(context, new MaterialPageRoute(builder: (context){
                    return new BuilderListViewRoute();
                  }));
                }
            ),
            RaisedButton(
                child: Text("ListView.separated",style: TextStyle(color: Colors.white),),
                color: Colors.orange,
                onPressed: (){
                  Navigator.push(context, new MaterialPageRoute(builder: (context){
                    return new SeparatedListViewRoute();
                  }));
                }
            ),
            RaisedButton(
                child: Text("无限加载列表",style: TextStyle(color: Colors.white),),
                color: Colors.orange,
                onPressed: (){
                  Navigator.push(context, new MaterialPageRoute(builder: (context){
                    return new InfiniteListView();
                  }));
                }
            ),
            RaisedButton(
                child: Text("添加固定表头",style: TextStyle(color: Colors.white),),
                color: Colors.orange,
                onPressed: (){
                  Navigator.push(context, new MaterialPageRoute(builder: (context){
                    return new AddListTitleRoute();
                  }));
                }
            ),
            Text("总结\n本节主要介绍了ListView的一些公共参数以及常用的构造函数。"
                "不同的构造函数对应了不同的列表项生成模型，如果需要自定义列表项生成模型，"
                "可以通过ListView.custom来自定义，它需要实现一个SliverChildDelegate用"
                "来给ListView生成列表项widget，更多详情请参考API文档。")
          ],
        ),
      ),
    );
  }

}
/*


*/
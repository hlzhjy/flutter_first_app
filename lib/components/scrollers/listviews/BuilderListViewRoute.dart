import 'package:flutter/material.dart';

/*
    ListView.builder适合列表项比较多（或者无限）的情况，因为只有当子Widget真正显示的时候才会被创建。
    ListView.builder({
    // ListView公共参数已省略
    ...
    @required IndexedWidgetBuilder itemBuilder,
    int itemCount,
    ...
    })
    itemBuilder：它是列表项的构建器，类型为IndexedWidgetBuilder，返回值为一个widget。
    当列表滚动到具体的index位置时，会调用该构建器构建列表项。
    itemCount：列表项的数量，如果为null，则为无限列表。
 */
class BuilderListViewRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView.builder"),
      ),
      body: ListView.builder(
          itemCount: 100,
          itemExtent: 50.0, //强制高度为50.0
          itemBuilder: (BuildContext context, int index) {
            return ListTile(title: Text("$index"));
          }
      ),
    );
  }
}
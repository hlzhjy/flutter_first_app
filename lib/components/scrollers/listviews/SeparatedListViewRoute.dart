import 'package:flutter/material.dart';
/*
ListView.separated可以生成列表项之间的分割器，它除了比ListView.builder多了一个separatorBuilder参数，
该参数是一个分割器生成器。下面我们看一个例子：奇数行添加一条蓝色下划线，偶数行添加一条绿色下划线。
 */
class SeparatedListViewRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //下划线widget预定义以供复用。
    Widget divider1=Divider(color: Colors.blue,);
    Widget divider2=Divider(color: Colors.green);
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView.separated"),
      ),
      body: ListView.separated(
        itemCount: 100,
        //列表项构造器
        itemBuilder: (BuildContext context, int index) {
          return ListTile(title: Text("$index"));
        },
        //分割器构造器
        separatorBuilder: (BuildContext context, int index) {
          return index%2==0?divider1:divider2;
        },
      ),
    );
  }
}
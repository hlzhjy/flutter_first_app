import 'package:flutter/material.dart';

class AddListTitleRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("添加固定表头"),
      ),
      body: Column(children: <Widget>[
        ListTile(title:Text("商品列表")),
//        SizedBox(
//          //Material设计规范中状态栏、导航栏、ListTile高度分别为24、56、56
//          height: MediaQuery.of(context).size.height-24-56-56,
//          child: ListView.builder(itemBuilder: (BuildContext context, int index) {
//            return ListTile(title: Text("$index"));
//          }),
//        ),
        //自动拉升ListView以填充屏幕剩余空间的方法吗？当然有！答案就是Flex。前面已经介绍过在Flex布局中，
        // 可以使用Expanded自动拉伸组件大小的Widget，我们也说过Column是继承自Flex的，
        // 所以我们可以直接使用Column+Expanded来实现
        Expanded(
          child: ListView.builder(itemBuilder: (BuildContext context, int index) {
            return ListTile(title: Text("$index"));
          }),
        ),
      ]),
    );
  }
}
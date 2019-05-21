import 'package:flutter/material.dart';

//上面我们介绍的GridView都需要一个Widget数组作为其子元素，这些方式都会提前将所有子widget都构建好，
// 所以只适用于子Widget数量比较少时，当子widget比较多时，我们可以通过GridView.builder来动态创建
// 子Widget。GridView.builder 必须指定的参数有两个：
//GridView.builder(
//...
//@required SliverGridDelegate gridDelegate,
//@required IndexedWidgetBuilder itemBuilder,itemBuilder为子widget构建器。
//)
class GridVIewBuilderRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => GridViewBuilderState();
}

class GridViewBuilderState extends State<GridVIewBuilderRoute>{

  List<IconData> _icons = []; //保存Icon数据

  @override
  void initState() {
    // 初始化数据
    _retrieveIcons();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("GridVIewBuilder"),
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, //每行三列
              childAspectRatio: 1.0 //显示区域宽高相等
          ),
          itemCount: _icons.length,
          //在itemBuilder中，如果显示到最后一个时，判断是否需要继续获取数据，然后返回一个Icon。
          itemBuilder: (context, index) {
            //如果显示到最后一个并且Icon总数小于200时继续获取数据
            if (index == _icons.length - 1 && _icons.length < 200) {
              _retrieveIcons();
            }
            return Icon(_icons[index]);
          }
      ),
    );
  }

  //模拟异步获取数据
  //在此方法中我们通过Future.delayed来模拟从异步数据源获取数据，每次获取数据需要200毫秒，
  // 获取成功后将新数据添加到_icons，然后调用setState重新构建。
  void _retrieveIcons() {
    Future.delayed(Duration(milliseconds: 200)).then((e) {
      setState(() {
        _icons.addAll([
          Icons.ac_unit,
          Icons.airport_shuttle,
          Icons.all_inclusive,
          Icons.beach_access, Icons.cake,
          Icons.free_breakfast
        ]);
      });
    });
  }
}
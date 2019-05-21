import 'package:flutter/material.dart';
/*
该子类实现了一个横轴子元素为固定最大长度的layout算法，其构造函数为：
SliverGridDelegateWithMaxCrossAxisExtent({
  double maxCrossAxisExtent,
  double mainAxisSpacing = 0.0,
  double crossAxisSpacing = 0.0,
  double childAspectRatio = 1.0,
})
maxCrossAxisExtent为子元素在横轴上的最大长度，之所以是“最大”长度，是因为横轴方向每个子元素的长度仍然是等分的，
举个例子，如果ViewPort的横轴长度是450，那么当maxCrossAxisExtent的值在区间(450/4，450/3]内的话，
子元素最终实际长度都为150，而childAspectRatio所指的子元素横轴和主轴的长度比为最终的长度比。
其它参数和SliverGridDelegateWithFixedCrossAxisCount相同
 */
class SliverGridDelegateWithMaxCrossAxisExtentRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("SliverGridDelegateWithMaxCrossAxisExtent"),
      ),
      body:
//      GridView(
//        padding: EdgeInsets.zero,
//        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//            maxCrossAxisExtent: 160.0,
//            childAspectRatio: 2.0 //宽高比为2
//        ),
//        children: <Widget>[
//          Icon(Icons.ac_unit,color: Colors.orange,),
//          Icon(Icons.airport_shuttle),
//          Icon(Icons.all_inclusive),
//          Icon(Icons.beach_access),
//          Icon(Icons.cake),
//          Icon(Icons.free_breakfast),
//        ],
//      ),
//      GridView.extent构造函数内部使用了SliverGridDelegateWithMaxCrossAxisExtent，
//      我们通过它可以快速的创建纵轴子元素为固定最大长度的的GridView，上面的示例代码等价于：
        GridView.extent(
          maxCrossAxisExtent: 120.0,
          childAspectRatio: 2.0,
          children: <Widget>[
            Icon(Icons.ac_unit,color: Colors.orange),
            Icon(Icons.airport_shuttle),
            Icon(Icons.all_inclusive),
            Icon(Icons.beach_access),
            Icon(Icons.cake),
            Icon(Icons.free_breakfast),
          ],
        )
    );
  }
}
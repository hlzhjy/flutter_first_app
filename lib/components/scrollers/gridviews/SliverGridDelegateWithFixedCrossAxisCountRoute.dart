import 'package:flutter/material.dart';
/*
该子类实现了一个横轴为固定数量子元素的layout算法，其构造函数为：
SliverGridDelegateWithFixedCrossAxisCount({
  @required double crossAxisCount,
  double mainAxisSpacing = 0.0,
  double crossAxisSpacing = 0.0,
  double childAspectRatio = 1.0,
})
crossAxisCount：横轴子元素的数量。此属性值确定后子元素在横轴的长度就确定了,即ViewPort横轴长度/crossAxisCount。
mainAxisSpacing：主轴方向的间距。
crossAxisSpacing：横轴方向子元素的间距。
childAspectRatio：子元素在横轴长度和主轴长度的比例。由于crossAxisCount指定后子元素横轴长度就确定了，
然后通过此参数值就可以确定子元素在主轴的长度。
可以发现，子元素的大小是通过crossAxisCount和childAspectRatio两个参数共同决定的。
注意，这里的子元素指的是子widget的最大显示空间，注意确保子widget的实际大小不要超出子元素的空间。
 */
class SliverGridDelegateWithFixedCrossAxisCountRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("SliverGridDelegateWithFixedCrossAxisCount"),
      ),
      body:
//      GridView(
//          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//              crossAxisCount: 3, //横轴三个子widget
//              childAspectRatio: 1.0 //宽高比为1时，子widget
//          ),
//          children:<Widget>[
//            Icon(Icons.ac_unit),
//            Icon(Icons.airport_shuttle),
//            Icon(Icons.all_inclusive),
//            Icon(Icons.beach_access),
//            Icon(Icons.cake),
//            Icon(Icons.free_breakfast)
//          ]
//      ),
//      GridView.count构造函数内部使用了SliverGridDelegateWithFixedCrossAxisCount，
//      我们通过它可以快速的创建横轴固定数量子元素的GridView，上面的示例代码等价于：
        GridView.count(
          crossAxisCount: 3,
          childAspectRatio: 1.0,
          children: <Widget>[
            Icon(Icons.ac_unit),
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
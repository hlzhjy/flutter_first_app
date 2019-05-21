import 'package:flutter/material.dart';

//Container是我们要介绍的最后一个容器类widget，它本身不对应具体的RenderObject，
// 它是DecoratedBox、ConstrainedBox、Transform、Padding、Align等widget的一个组合widget。
// 所以我们只需通过一个Container可以实现同时需要装饰、变换、限制的场景。
//Container({
//  this.alignment,
//  this.padding, //容器内补白，属于decoration的装饰范围
//  Color color, // 背景色
//  Decoration decoration, // 背景装饰
//  Decoration foregroundDecoration, //前景装饰
//  double width,//容器的宽度
//  double height, //容器的高度
//  BoxConstraints constraints, //容器大小的限制条件
//  this.margin,//容器外补白，不属于decoration的装饰范围
//  this.transform, //变换
//  this.child,
//})
class ContainerTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Container"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            //可以看到Container通过组合多种widget来实现复杂强大的功能，
            // 在Flutter中，这也正是组合优先于继承的实例。
            margin: EdgeInsets.only(top: 50.0, left: 120.0),
            //容器外补白
            constraints: BoxConstraints.tightFor(width: 200.0, height: 150.0),
            //卡片大小
            decoration: BoxDecoration(
                //背景装饰
                gradient: RadialGradient(
                    //背景径向渐变
                    colors: [Colors.red, Colors.orange],
                    center: Alignment.topLeft,
                    radius: .98),
                boxShadow: [
                  //卡片阴影
                  BoxShadow(
                      color: Colors.black54,
                      offset: Offset(2.0, 2.0),
                      blurRadius: 4.0)
                ]),
            transform: Matrix4.rotationZ(.2),
            //卡片倾斜变换
            alignment: Alignment.center,
            //卡片内文字居中
            child: Text(
              //卡片文字
              "5.20", style: TextStyle(color: Colors.white, fontSize: 40.0),
            ),
          ),
          //margin 与 padding 的区别
          Container(
            margin: EdgeInsets.all(20.0), //容器外补白
            color: Colors.orange,
            child: Text("Hello world!"),
          ),
          Container(
            padding: EdgeInsets.all(20.0), //容器内补白
            color: Colors.orange,
            child: Text("Hello world!"),
          ),
        ],
      ),
    );
  }
}

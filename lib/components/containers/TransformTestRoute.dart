import 'package:flutter/material.dart';
import 'dart:math' as math;

//Transform可以在其子Widget绘制时对其应用一个矩阵变换（transformation），
// Matrix4是一个4D矩阵，通过它我们可以实现各种矩阵操作。
//Transform的变换是应用在绘制阶段，而并不是应用在布局(layout)阶段，
// 所以无论对子widget应用何种变化，其占用空间的大小和在屏幕上的位置都是固定不变的，
// 因为这些是在布局阶段就确定的。
class TransformTestRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("变换Transform"),
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 10.0),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              color: Colors.black,
              child: new Transform(
                alignment: Alignment.topRight, //相对于坐标系原点的对齐方式
                transform: new Matrix4.skewY(0.3), //沿Y轴倾斜0.3弧度
                child: new Container(
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.deepOrange,
                  child: const Text('Apartment for rent!'),
                ),
              ),
            ),
            //平移效果,hello world字体实现了平移
            Container(
              margin: EdgeInsets.all(10),
              child:DecoratedBox(
                decoration:BoxDecoration(color: Colors.red),
                //默认原点为左上角，左移20像素，向上平移5像素
                child: Transform.translate(offset: Offset(-20.0, -5.0),
                  child: Text("Hello world"),
                ),
              )
            ),
            //旋转效果,hello world字体实现了90°旋转
            Container(
                margin: EdgeInsets.all(10),
                child:DecoratedBox(
                  decoration:BoxDecoration(color: Colors.red),
                  //默认原点为左上角，左移20像素，向上平移5像素
                  child: Transform.rotate(
                    angle: math.pi/2,
                    child: Text("Hello world"),
                  ),
                )
            ),
            //缩放效果,hello world字体实现了放大
            Container(
                margin: EdgeInsets.all(20),
                child:DecoratedBox(
                  decoration:BoxDecoration(color: Colors.red),
                  //默认原点为左上角，左移20像素，向上平移5像素
                  child: Transform.scale(
                    scale: 2.0,
                    child: Text("Hello world"),
                  ),
                )
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  DecoratedBox(
                      decoration:BoxDecoration(color: Colors.red),
                      child: Transform.scale(scale: 1.5,
                          child: Text("Hello world")
                      )
                  ),
                  Text("你好", style: TextStyle(color: Colors.green, fontSize: 18.0),)
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  DecoratedBox(
                    decoration: BoxDecoration(color: Colors.red),
                    //将Transform.rotate换成RotatedBox
                    child: RotatedBox(
                      //由于RotatedBox是作用于layout阶段，所以widget会旋转90度（而不只是绘制的内容），
                      // decoration会作用到widget所占用的实际空间上
                      quarterTurns: 1, //旋转90度(1/4圈)
                      child: Text("Hello world"),
                    ),
                  ),
                  Text("你好", style: TextStyle(color: Colors.green, fontSize: 18.0),)
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              color: Colors.blue,
              child: Text("由于矩阵变化只会作用在绘制阶段，所以在某些场景下，在UI需要变化时，"
                  "可以直接通过矩阵变化来达到视觉上的UI改变，而不需要去重新触发build流程，这样会"
                  "节省layout的开销，所以性能会比较好。如之前介绍的Flow widget，它内部就是用矩"
                  "阵变换来更新UI，除此之外，Flutter的动画widget中也大量使用了Transform以提高"
                  "性能。",style: TextStyle(color: Colors.white),),
            )
          ],
        ),
      ),
    );
  }

}
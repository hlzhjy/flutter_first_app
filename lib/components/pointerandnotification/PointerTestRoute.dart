import 'package:flutter/material.dart';
/*
Pointer事件处理
本节先来介绍一下原始指针事件(Pointer Event，在移动设备上通常为触摸事件)，下一节再介绍手势处理。

在移动端，各个平台或UI系统的原始指针事件模型基本都是一致，即：一次完整的事件分为三个阶段：
手指按下、手指移动、和手指抬起，而更高级别的手势（如点击、双击、拖动等）都是基于这些原始事件的。

当指针按下时，Flutter会对应用程序执行命中测试(Hit Test)，以确定指针与屏幕接触的位置存在哪些widget，
指针按下事件（以及该指针的后续事件）然后被分发到由命中测试发现的最内部的widget，然后从那里开始，事件会
在widget树中向上冒泡，这些事件会从最内部的widget被分发到widget根的路径上的所有Widget，这和Web开发
中浏览器的事件冒泡机制相似， 但是Flutter中没有机制取消或停止冒泡过程，而浏览器的冒泡是可以停止的。注意，
只有通过命中测试的Widget才能触发事件。
Flutter中可以使用Listener widget来监听原始触摸事件，它也是一个功能性widget。

Listener({
  Key key,
  this.onPointerDown, //手指按下回调
  this.onPointerMove, //手指移动回调
  this.onPointerUp,//手指抬起回调
  this.onPointerCancel,//触摸事件取消回调
  this.behavior = HitTestBehavior.deferToChild, //在命中测试期间如何表现
  Widget child
})
 */
class PointerTestRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new PointerTestState();
  }
}

class PointerTestState extends State<PointerTestRoute>{
  //定义一个状态，保存当前指针位置
  PointerEvent _event;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Pointer事件处理"),
      ),
      body: Padding(padding: EdgeInsets.all(10),
        child: Listener(
          child: Container(
            alignment: Alignment.center,
            color: Colors.blue,
            width: 300.0,
            height: 150.0,
            child: Text(_event?.toString()??"",style: TextStyle(color: Colors.white)),
          ),
          onPointerDown: (PointerDownEvent event) => setState(()=>_event=event),
          onPointerMove: (PointerMoveEvent event) => setState(()=>_event=event),
          onPointerUp: (PointerUpEvent event) => setState(()=>_event=event),
        ),
      ),
    );
  }

  @override
  void setState(fn) {
    // TODO: implement setState
    print("setState:"+_event.toString());
    super.setState(fn);
  }
}
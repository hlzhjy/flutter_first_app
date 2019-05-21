import 'package:flutter/material.dart';
/*
手势冲突
由于手势竞争最终只有一个胜出者，所以，当有多个手势识别器时，可能会产生冲突。
假设有一个widget，它可以左右拖动，现在我们也想检测在它上面手指按下和抬起的事件，代码如下：

总结：

手势冲突只是手势级别的，而手势是对原始指针的语义化的识别，
所以在遇到复杂的冲突场景时，都可以通过Listener直接识别原始指针事件来解决冲突。
 */
class GestureConflictTestRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new GestureConflictTestRouteState();
  }
}

class GestureConflictTestRouteState extends State<GestureConflictTestRoute> {
  double _left = 0.0;
  double _leftB = 0.0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
//        Positioned(
//          left: _left,
//          child: GestureDetector(
//            child: CircleAvatar(child: Text("A")), //要拖动和点击的widget
//            onHorizontalDragUpdate: (DragUpdateDetails details) {
//              setState(() {
//                _left += details.delta.dx;
//              });
//            },
//            onHorizontalDragEnd: (details){
//              print("onHorizontalDragEnd");
//            },
//            onTapDown: (details){
//              print("down");
//            },
//            onTapUp: (details){
//              print("up");
//            },
//          ),
//        )
        /*
        现在我们按住圆形“A”拖动然后抬起手指，控制台日志如下:

        I/flutter (17539): down
        I/flutter (17539): onHorizontalDragEnd
        我们发现没有打印"up"，这是因为在拖动时，刚开始按下手指时在没有移动时，拖动手势还没有完整的语义，
        此时TapDown手势胜出(win)，此时打印"down"，而拖动时，拖动手势会胜出，当手指抬起时，
        onHorizontalDragEnd 和 onTapUp发生了冲突，但是因为是在拖动的语义中，所以onHorizontalDragEnd
        胜出，所以就会打印 “onHorizontalDragEnd”。如果我们的代码逻辑中，对于手指按下和抬起是强依赖的，
        比如在一个轮播图组件中，我们希望手指按下时，暂停轮播，而抬起时恢复轮播，但是由于轮播图组件中本身可能已
        经处理了拖动手势（支持手动滑动切换），甚至可能也支持了缩放手势，这时我们如果在外部再用onTapDown、
        onTapUp来监听的话是不行的。这时我们应该怎么做？其实很简单，通过Listener监听原始指针事件就行：
         */
        Positioned(
          top:80.0,
          left: _leftB,
          child: Listener(
            onPointerDown: (details) {
              print("down");
            },
            onPointerUp: (details) {
              //会触发
              print("up");
            },
            child: GestureDetector(
              child: CircleAvatar(child: Text("B")),
              onHorizontalDragUpdate: (DragUpdateDetails details) {
                setState(() {
                  _leftB += details.delta.dx;
                });
              },
              onHorizontalDragEnd: (details) {
                print("onHorizontalDragEnd");
              },
            ),
          ),
        )
      ],
    );
  }
}
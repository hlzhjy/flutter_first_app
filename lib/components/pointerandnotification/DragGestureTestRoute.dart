import 'package:flutter/material.dart';
/*
拖动、滑动
一次完整的手势过程是指用户手指按下到抬起的整个过程，期间，用户按下手指后可能会移动，
也可能不会移动。GestureDetector对于拖动和滑动事件是没有区分的，他们本质上是一样的。
GestureDetector会将要监听的widget的原点（左上角）作为本次手势的原点，当用户在监听
的widget上按下手指时，手势识别就会开始。下面我们看一个拖动圆形字母A的示例：

DragDownDetails.globalPosition：当用户按下时，此属性为用户按下的位置相对于屏幕(而非父widget)原点(左上角)的偏移。
DragUpdateDetails.delta：当用户在屏幕上滑动时，会触发多次Update事件，delta指一次Update事件的滑动的偏移量。
DragEndDetails.velocity：该属性代表用户抬起手指时的滑动速度(包含x、y两个轴的），示例中并没有处理手指抬起时的速度，
常见的效果是根据用户抬起手指时的速度做一个减速动画。
 */
class DragGestureTestRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new DragGestureTestState();
  }
}

class DragGestureTestState extends State<DragGestureTestRoute> with SingleTickerProviderStateMixin{
  double _top = 0.0; //距顶部的偏移
  double _left = 0.0;//距左边的偏移
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        Positioned(
          top: _top,
          left: _left,
          child: GestureDetector(
            child: CircleAvatar(child: Text("A")),
            //手指按下时会触发此回调
            onPanDown: (DragDownDetails e) {
              //打印手指按下的位置(相对于屏幕)
              print("用户手指按下：${e.globalPosition}");
            },
            //手指滑动时会触发此回调
            onPanUpdate: (DragUpdateDetails e) {
              //用户手指滑动时，更新偏移，重新构建
              setState(() {
                _left += e.delta.dx;
                _top += e.delta.dy;
              });
            },
            onPanEnd: (DragEndDetails e){
              //打印滑动结束时在x、y轴上的速度
              print(e.velocity);
            },
          ),
        )
      ],
    );
  }
}
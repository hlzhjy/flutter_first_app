import 'package:flutter/material.dart';

class DragVerticalTestRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new DragVerticalTestState();
  }
}

class DragVerticalTestState extends State<DragVerticalTestRoute>{
  double _top = 0.0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        Positioned(
          top: _top,
          child: GestureDetector(
              child: CircleAvatar(child: Text("A")),
              //垂直方向拖动事件
              onVerticalDragUpdate: (DragUpdateDetails details) {
                setState(() {
                  _top += details.delta.dy;
                });
              }
          ),
        )
      ],
    );
  }
}
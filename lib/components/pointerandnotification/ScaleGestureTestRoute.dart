import 'package:flutter/material.dart';

class ScaleGestureTestRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new ScaleGestureTestState();
  }
}

class ScaleGestureTestState extends State<ScaleGestureTestRoute>{
  double _width = 200.0; //通过修改图片宽度来达到缩放效果
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar:AppBar(
        title: Text("缩放"),
      ),
      body: Padding(padding: EdgeInsets.all(10),
        child: Center(
          child: GestureDetector(
            //指定宽度，高度自适应
            child: Image.asset("./images/aquarium-fish.jpg", width: _width),
            onScaleUpdate: (ScaleUpdateDetails details) {
              setState(() {
                //缩放倍数在0.8到10倍之间
                _width=200*details.scale.clamp(.8, 10.0);
              });
            },
          ),
        ),
      ),
    );
  }
}
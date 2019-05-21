import 'package:flutter/material.dart';

/*
GestureDetector是一个用于手势识别的功能性Widget，
我们通过它可以来识别各种手势，它是指针事件的语义化封装，
接下来我们详细介绍一下各种手势识别：
 */

class GestureDetectorTestRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new GestureDetectorTestState();
  }
}

class GestureDetectorTestState extends State<GestureDetectorTestRoute>{
  String _operation = "No Gesture detected!"; //保存事件名
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("手势识别"),
      ),
      body: Padding(padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            //点击、双击、长按
            //我们通过GestureDetector对Container进行手势识别，触发相应事件后，
            // 在Container上显示事件名，为了增大点击区域，将Container设置为200×100，代码如下：
            // 注意：
            // 当同时监听onTap和onDoubleTap事件时，当用户触发tap事件时，会有200毫秒左右的延时，
            // 这是因为当用户点击完之后很可能会再次点击以触发双击事件，所以GestureDetector会等一
            // 断时间来确定是否为双击事件。如果用户只监听了onTap（没有监听onDoubleTap）事件时，则没有延时。
            GestureDetector(
              child: Container(
                alignment: Alignment.center,
                color: Colors.blue,
                width: 200.0,
                height: 100.0,
                child: Text(_operation,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              onTap: () => updateText("Tap"),//点击
              onDoubleTap: () => updateText("DoubleTap"), //双击
              onLongPress: () => updateText("LongPress"), //长按
            ),

          ],
        ),
      ),
    );
  }

  void updateText(String text) {
    //更新显示的事件名
    setState(() {
      _operation = text;
    });
  }
}
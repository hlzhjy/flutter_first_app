import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

/*
GestureRecognizer
GestureDetector内部是使用一个或多个GestureRecognizer来识别各种手势的，
而GestureRecognizer的作用就是通过Listener来将原始指针事件转换为语义手势，
GestureDetector直接可以接收一个子Widget。GestureRecognizer是一个抽象类，
一种手势的识别器对应一个GestureRecognizer的子类，Flutter实现了丰富的手势识别器，我们可以直接使用。

注意：使用GestureRecognizer后一定要调用其dispose()方法来释放资源（主要是取消内部的计时器）。
 */

class GestureRecognizerTestRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new GestureRecognizerTestState();
  }
}

class GestureRecognizerTestState extends State<GestureRecognizerTestRoute>{
  TapGestureRecognizer _tapGestureRecognizer = new TapGestureRecognizer();
  bool _toggle = false; //变色开关

  @override
  void dispose() {
    //用到GestureRecognizer的话一定要调用其dispose方法释放资源
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("GestureRecognizer"),
      ),
      body: Center(
        child: Text.rich(
            TextSpan(
                children: [
                  TextSpan(text: "你好世界"),
                  TextSpan(
                    text: "点我变色",
                    style: TextStyle(
                        fontSize: 30.0,
                        color: _toggle ? Colors.blue : Colors.red
                    ),
                    recognizer: _tapGestureRecognizer
                      ..onTap = () {
                        setState(() {
                          _toggle = !_toggle;
                        });
                      },
                  ),
                  TextSpan(text: "你好世界"),
                ]
            )
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'widgets/GradientButton.dart';

/*
通过组合现有Widget实现自定义Widget
在Flutter中页面UI通常都是由一些低阶别的Widget组合而成，当我们需要封装一些通用Widget时，
应该首先考虑是否可以通过组合其它Widget来实现，如果可以则应优先使用组合，因为直接通过现有
Widget拼装会非常方便、简单、高效。

总结
通过组合的方式定义Widget和我们之前写界面并无差异，不过在抽离出单独的Widget时我们要考虑代码规范性，
如必要参数要用@required 标注，对于可选参数在特定场景需要判空或设置默认值等。这是由于使用者大多时候
可能不了解Widget的内部细节，所以为了保证代码健壮性，我们需要在用户错误地使用Widget时能够兼容或报错
提示（使用assert断言函数）。
 */
class CombineWidgetProductRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new CombineWidgetProductRouteState();
  }
}

class CombineWidgetProductRouteState extends State<CombineWidgetProductRoute>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("组合现有Widget"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            GradientButton(
              colors: [Colors.orange,Colors.red],
              height: 50.0,
              child: Text("Submit"),
              onTap:onTap ,
            ),
            GradientButton(
              height: 50.0,
              colors: [Colors.lightGreen, Colors.green[700]],
              child: Text("Submit"),
              onTap: onTap,
            ),
            GradientButton(
              height: 50.0,
              colors: [Colors.lightBlue[300], Colors.blueAccent],
              child: Text("Submit"),
              onTap: onTap,
            ),
          ],
        ),
      ),
    );
  }

  onTap(){
    print("button click");
  }
}
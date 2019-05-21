import 'package:flutter/material.dart';
import 'ShareDataWidget.dart';
import '_TestWidget.dart';

/*
InheritedWidget
InheritedWidget是Flutter中非常重要的一个功能型Widget，它可以高效的将数据在Widget树中向下传递、共享，
这在一些需要在Widget树中共享数据的场景中非常方便，如Flutter中，正是通过InheritedWidget来共享应用主题
(Theme)和Locale(当前语言环境)信息的。

InheritedWidget和React中的context功能类似，和逐级传递数据相比，它们能实现组件跨级传递数据。
InheritedWidget的在Widget树中数据传递方向是从上到下的，这和Notification的传递方向正好相反。
 */
class InheritedWidgetRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InheritedWidgetState();
}

class InheritedWidgetState extends State<InheritedWidgetRoute> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("InheritedWidget"),
        ),
        body: Center(
          child: ShareDataWidget(
            //使用ShareDataWidget
            data: count,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: TestWidget(), //子widget中依赖ShareDataWidget
                ),
                RaisedButton(
                  child: Text("Increment"),
                  //每点击一次，将count自增，然后重新build,ShareDataWidget的data将被更新
                  onPressed: () => setState(() => ++count),
                )
              ],
            ),
          ),
        ));
  }
}

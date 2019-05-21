import 'package:flutter/material.dart';

/*
导航返回拦截WillPopScope
为了避免用户误触返回按钮而导致APP退出，在很多APP中都拦截了用户点击返回键的按钮，
当用户在某一个时间段内点击两次时，才会认为用户是要退出（而非误触）。Flutter中可
以通过WillPopScope来实现返回按钮拦截，我们看看WillPopScope的默认构造函数：

const WillPopScope({
  ...
  @required WillPopCallback onWillPop,
  @required Widget child
})
onWillPop是一个回调函数，当用户点击返回按钮时调用（包括导航返回按钮及Android物
理返回按钮），该回调需要返回一个Future对象，如果返回的Future最终值为false时，则
当前路由不出栈(不会返回)，最终值为true时，当前路由出栈退出。我们需要提供这个回调来
决定是否退出。
 */
class WillPopScopeRoute extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => WillPopScopeState();

}

class WillPopScopeState extends State<WillPopScopeRoute>{
  DateTime _lastPressedAt; //上次点击时间
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("导航返回拦截WillPopScope"),
      ),
      body: new WillPopScope(
          onWillPop: () async {
            if (_lastPressedAt == null ||
                DateTime.now().difference(_lastPressedAt) > Duration(seconds: 1)) {
              //两次点击间隔超过1秒则重新计时
              _lastPressedAt = DateTime.now();
              return false;
            }
            return true;
          },
          child: Container(
            alignment: Alignment.center,
            child: Text("1秒内连续按两次返回键退出"),
          )
      ),
    );
  }
}
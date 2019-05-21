import 'package:flutter/material.dart';

/*
除了Flutter内部通知，我们也可以自定义通知，下面我们看看如何实现自定义通知：
1、定义一个通知类，要继承自Notification类；

分发通知。

2、Notification有一个dispatch(context)方法，它是用于分发通知的，我们说过
context实际上就是操作Element的一个接口，它与Element树上的节点是对应的，通知
会从context对应的Element节点向上冒泡。
 */
class MyNotification extends Notification {
  MyNotification(this.msg);
  final String msg;
}

class CustomNotificationTestRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new CustomNotificationTestRouteState();
  }
}

class CustomNotificationTestRouteState extends State<CustomNotificationTestRoute>{
  String _msg="";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("自定义通知"),
      ),
      body: NotificationListener<MyNotification>(
        onNotification: (notification) {
          setState(() {
            _msg+=notification.msg+"  ";
          });
        },
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              //注意：代码中注释的部分是不能正常工作的，因为这个context是根Context，
              // 而NotificationListener是监听的子树，所以我们通过Builder来构建
              // RaisedButton，来获得按钮位置的context。
//          RaisedButton(
//           onPressed: () => MyNotification("Hi").dispatch(context),
//           child: Text("Send Notification"),
//          ),
              Builder(
                builder: (context) {
                  return RaisedButton(
                    //按钮点击时分发通知
                    onPressed: () => MyNotification("Hi").dispatch(context),
                    child: Text("Send Notification"),
                  );
                },
              ),
              Text(_msg)
            ],
          ),
        ),
      ),
    );
  }
}

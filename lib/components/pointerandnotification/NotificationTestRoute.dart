import 'package:flutter/material.dart';
/*
Notification
Notification是Flutter中一个重要的机制，在Widget树中，每一个节点都可以分发通知，
通知会沿着当前节点（context）向上传递，所有父节点都可以通过NotificationListener
来监听通知，Flutter中称这种通知由子向父的传递为“通知冒泡”（Notification Bubbling），
这个和用户触摸事件冒泡是相似的，但有一点不同：通知冒泡可以中止，但用户触摸事件不行。

Flutter中很多地方使用了通知，如可滚动(Scrollable) Widget中滑动时就会分发ScrollNotification，
而Scrollbar正是通过监听ScrollNotification来确定滚动条位置的。除了ScrollNotification，
Flutter中还有SizeChangedLayoutNotification、KeepAliveNotification 、LayoutChangedNotification等。
下面是一个监听Scrollable Widget滚动通知的例子：

上例中的滚动通知如ScrollStartNotification、ScrollUpdateNotification等都是继承自ScrollNotification类，
不同类型的通知子类会包含不同的信息，比如ScrollUpdateNotification有一个scrollDelta属性，它记录了移动的位移，
其它通知属性读者可以自己查看SDK文档。
 */
class NotificationTestRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new NotificationTestRouteState();
  }
}

class NotificationTestRouteState extends State<NotificationTestRoute>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("通知"),
      ),
      body: NotificationListener(
        onNotification: (notification){
          //print(notification);
          switch (notification.runtimeType){
            case ScrollStartNotification: print("开始滚动"); break;
            case ScrollUpdateNotification: print("正在滚动"); break;
            case ScrollEndNotification: print("滚动停止"); break;
            case OverscrollNotification: print("滚动到边界"); break;
          }
        },
        child: ListView.builder(
            itemCount: 100,
            itemBuilder: (context, index) {
              return ListTile(title: Text("$index"),);
            }
        ),
      )
    );
  }
}
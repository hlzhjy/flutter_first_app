import 'package:flutter/material.dart';
import 'PointerTestRoute.dart';
import 'BehaviorPointerTestRoute.dart';
import 'IgnorePointerEventTestRoute.dart';
import 'GestureTestRoute.dart';
import 'NotificationTestRoute.dart';
import 'CustomNotificationTestRoute.dart';

class PointerAndNotificationRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("事件处理与通知"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Wrap(
          spacing: 4.0,
          runSpacing: 4.0,
          alignment: WrapAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.push(context, new MaterialPageRoute(builder: (context){
                  return new PointerTestRoute();
                }));
              },
              child: Text("原始指针事件处理",style: TextStyle(color: Colors.white),),
              color: Colors.blue,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(context, new MaterialPageRoute(builder: (context){
                  return new BehaviorPointerTestRoute();
                }));
              },
              child: Text("behavior属性",style: TextStyle(color: Colors.white),),
              color: Colors.blue,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(context, new MaterialPageRoute(builder: (context){
                  return new IgnorePointerEventTestRoute();
                }));
              },
              child: Text("忽略PointerEvent",style: TextStyle(color: Colors.white),),
              color: Colors.blue,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(context, new MaterialPageRoute(builder: (context){
                  return new GestureTestRoute();
                }));
              },
              child: Text("手势识别GestureDetector",style: TextStyle(color: Colors.white),),
              color: Colors.blue,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(context, new MaterialPageRoute(builder: (context){
                  return new NotificationTestRoute();
                }));
              },
              child: Text("通知Notification",style: TextStyle(color: Colors.white),),
              color: Colors.blue,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(context, new MaterialPageRoute(builder: (context){
                  return new CustomNotificationTestRoute();
                }));
              },
              child: Text("自定义通知",style: TextStyle(color: Colors.white),),
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}

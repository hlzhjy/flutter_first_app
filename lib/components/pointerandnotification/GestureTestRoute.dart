import 'package:flutter/material.dart';
import 'GestureDetectorTestRoute.dart';
import 'DragGestureTestRoute.dart';
import 'DragVerticalTestRoute.dart';
import 'ScaleGestureTestRoute.dart';
import 'GestureRecognizerTestRoute.dart';
import 'BothDirectionTestRoute.dart';
import 'GestureConflictTestRoute.dart';

class GestureTestRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("手势识别"),
      ),
      body: Padding(padding: EdgeInsets.all(10),
        child: Wrap(
          spacing: 4.0,
            runSpacing: 4.0,
          alignment: WrapAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.push(context, new MaterialPageRoute(builder: (context){
                  return new GestureDetectorTestRoute();
                }));
              },
              child: Text("单机、双击、长按",style: TextStyle(color: Colors.white),),
              color: Colors.blue,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(context, new MaterialPageRoute(builder: (context){
                  return new DragGestureTestRoute();
                }));
              },
              child: Text("拖动、滑动",style: TextStyle(color: Colors.white),),
              color: Colors.blue,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(context, new MaterialPageRoute(builder: (context){
                  return new DragVerticalTestRoute();
                }));
              },
              child: Text("单一方向拖动",style: TextStyle(color: Colors.white),),
              color: Colors.blue,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(context, new MaterialPageRoute(builder: (context){
                  return new ScaleGestureTestRoute();
                }));
              },
              child: Text("缩放",style: TextStyle(color: Colors.white),),
              color: Colors.blue,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(context, new MaterialPageRoute(builder: (context){
                  return new GestureRecognizerTestRoute();
                }));
              },
              child: Text("GestureRecognizer",style: TextStyle(color: Colors.white),),
              color: Colors.blue,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(context, new MaterialPageRoute(builder: (context){
                  return new BothDirectionTestRoute();
                }));
              },
              child: Text("手势竞争",style: TextStyle(color: Colors.white),),
              color: Colors.blue,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(context, new MaterialPageRoute(builder: (context){
                  return new GestureConflictTestRoute();
                }));
              },
              child: Text("手势冲突",style: TextStyle(color: Colors.white),),
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
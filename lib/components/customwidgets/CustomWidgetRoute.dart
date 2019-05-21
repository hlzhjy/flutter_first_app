import 'package:flutter/material.dart';
import 'CustomWidgetProductRoute.dart';
import 'CombineWidgetProductRoute.dart';
import 'TurnBoxRoute.dart';
import 'CustomPaintCanvasRoute.dart';
import 'GradientCircularProgressRoute.dart';

class CustomWidgetRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("自定义Widget"),
      ),
      body: Padding(padding: EdgeInsets.all(10),
        child: Wrap(
          spacing: 4,
          runSpacing: 4,
          alignment: WrapAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("自定义Widget方法简介",style:TextStyle(color: Colors.white),),
              color: Colors.blue,
              onPressed: (){
                Navigator.push(context,new MaterialPageRoute(builder: (context){
                  return new CustomWidgetProductRoute();
                }));
              },
            ),
            RaisedButton(
              child: Text("组合现有Widget",style:TextStyle(color: Colors.white),),
              color: Colors.blue,
              onPressed: (){
                Navigator.push(context,new MaterialPageRoute(builder: (context){
                  return new CombineWidgetProductRoute();
                }));
              },
            ),
            RaisedButton(
              child: Text("TurnBox",style:TextStyle(color: Colors.white),),
              color: Colors.blue,
              onPressed: (){
                Navigator.push(context,new MaterialPageRoute(builder: (context){
                  return new TurnBoxRoute();
                }));
              },
            ),
            RaisedButton(
              child: Text("CustomPaint与Canvas",style:TextStyle(color: Colors.white),),
              color: Colors.blue,
              onPressed: (){
                Navigator.push(context,new MaterialPageRoute(builder: (context){
                  return new CustomPaintCanvasRoute();
                }));
              },
            ),
            RaisedButton(
              child: Text("圆形渐变进度条(自绘)",style:TextStyle(color: Colors.white),),
              color: Colors.blue,
              onPressed: (){
                Navigator.push(context,new MaterialPageRoute(builder: (context){
                  return new GradientCircularProgressRoute();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
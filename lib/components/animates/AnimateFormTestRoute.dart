import 'package:flutter/material.dart';
import 'ScaleAnimationRoute.dart';
import 'ScaleAnimationRoute2.dart';
import 'ScaleAnimationRoute3.dart';
import 'ScaleAnimationRoute4.dart';

class AnimateFormTestRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("动画结构"),
      ),
      body: Padding(padding: EdgeInsets.all(10),
        child: Wrap(
          spacing: 4.0,
          runSpacing: 4.0,
          alignment: WrapAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("动画基本结构",style:TextStyle(color: Colors.white),),
              color: Colors.blue,
              onPressed: (){
                Navigator.push(context,new MaterialPageRoute(builder: (context){
                  return new ScaleAnimationRoute();
                }));
              },
            ),
            RaisedButton(
              child: Text("使用AnimatedWidget简化",style:TextStyle(color: Colors.white),),
              color: Colors.blue,
              onPressed: (){
                Navigator.push(context,new MaterialPageRoute(builder: (context){
                  return new ScaleAnimationRoute2();
                }));
              },
            ),
            RaisedButton(
              child: Text("用AnimatedBuilder重构",style:TextStyle(color: Colors.white),),
              color: Colors.blue,
              onPressed: (){
                Navigator.push(context,new MaterialPageRoute(builder: (context){
                  return new ScaleAnimationRoute3();
                }));
              },
            ),
            RaisedButton(
              child: Text("动画状态监听",style:TextStyle(color: Colors.white),),
              color: Colors.blue,
              onPressed: (){
                Navigator.push(context,new MaterialPageRoute(builder: (context){
                  return new ScaleAnimationRoute4();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
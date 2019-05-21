import 'package:flutter/material.dart';
import 'AnimateProductRoute.dart';
import 'AnimateFormTestRoute.dart';
import 'routes/AnimatePageRouteTestRoute.dart';
import 'routes/HeroAnimationRoute.dart';
import 'routes/StaggerAnimationRoute.dart';
/*
简介
精心设计的动画会让用户界面感觉更直观、流畅，能改善用户体验。 Flutter可以轻松实现各种动画类型，
对于许多widget，特别是Material Design widgets，都带有在其设计规范中定义的标准动画效果(但也可以自定义这些效果)。
本章将详细介绍Flutter的动画系统，并会通过几个小实例来演示，以帮助开发者迅速理解并掌握动画的开发流程与原理。
 */
class AnimateRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("动画"),
      ),
      body: Padding(padding: EdgeInsets.all(10),
        child: Wrap(
          spacing: 4.0,
          runSpacing: 4.0,
          alignment: WrapAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("Flutter动画简介",style:TextStyle(color: Colors.white),),
              color: Colors.blue,
              onPressed: (){
                Navigator.push(context,new MaterialPageRoute(builder: (context){
                  return new AnimateProductRoute();
                }));
              },
            ),
            RaisedButton(
              child: Text("动画结构",style:TextStyle(color: Colors.white),),
              color: Colors.blue,
              onPressed: (){
                Navigator.push(context,new MaterialPageRoute(builder: (context){
                  return new AnimateFormTestRoute();
                }));
              },
            ),
            RaisedButton(
              child: Text("自定义路由切换动画",style:TextStyle(color: Colors.white),),
              color: Colors.blue,
              onPressed: (){
                Navigator.push(context,new MaterialPageRoute(builder: (context){
                  return new AnimatePageRouteTestRoute();
                }));
              },
            ),
            RaisedButton(
              child: Text("Hero动画",style:TextStyle(color: Colors.white),),
              color: Colors.blue,
              onPressed: (){
                Navigator.push(context,new MaterialPageRoute(builder: (context){
                  return new HeroAnimationRoute();
                }));
              },
            ),
            RaisedButton(
              child: Text("交错动画",style:TextStyle(color: Colors.white),),
              color: Colors.blue,
              onPressed: (){
                Navigator.push(context,new MaterialPageRoute(builder: (context){
                  return new StaggerAnimationRoute();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'WillPopScopeRoute.dart';
import 'InheritedWidgetRoute.dart';
import 'ThemeTestRoute.dart';

class FunctionalTestRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("功能型Widget"),
      ),
      body:Padding(
        padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Text(
            "功能型Widget简介"
                "\n功能型Widget指的是不会影响UI布局及外观的Widget，它们通常具有一定的功能，"
                "如事件监听、数据存储等，我们之前介绍过的FocusScope（焦点控制）、PageStorage（数据存储）"
                "、NotificationListener（事件监听）都属于功能型Widget。由于Widget是Flutter的一等公民，"
                "功能型Widget非常多，我们不会去一一介绍，本章中主要介绍几种常用的功能型Widget。",
            style: TextStyle(color: Colors.blue),
          ),
          RaisedButton(
            onPressed: (){
              Navigator.push(context, new MaterialPageRoute(builder: (context){
                return new WillPopScopeRoute();
              }));
            },
            child: Text("导航返回拦截WillPopScope",style: TextStyle(color: Colors.white),),
            color: Colors.blue,
          ),
          RaisedButton(
            onPressed: (){
              Navigator.push(context, new MaterialPageRoute(builder: (context){
                return new InheritedWidgetRoute();
              }));
            },
            child: Text("数据共享-InheritedWidget",style: TextStyle(color: Colors.white),),
            color: Colors.blue,
          ),
          RaisedButton(
            onPressed: (){
              Navigator.push(context, new MaterialPageRoute(builder: (context){
                return new ThemeTestRoute();
              }));
            },
            child: Text("主题-Theme",style: TextStyle(color: Colors.white),),
            color: Colors.blue,
          )
        ],
      ),
    ));
  }
}
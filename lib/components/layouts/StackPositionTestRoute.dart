import 'package:flutter/material.dart';

class StackPositionTestRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new StackPositionTestState();
  }
  
}

class StackPositionTestState extends State<StackPositionTestRoute>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Stack和绝对定位"),
      ),
      body:
      //通过ConstrainedBox来确保Stack占满屏幕
//      ConstrainedBox(
//        constraints: BoxConstraints.expand(),
//        child: Stack(
//          alignment:Alignment.center , //指定未定位或部分定位widget的对齐方式
//          children: <Widget>[
//            Container(child: Text("Hello world",style: TextStyle(color: Colors.white)),
//              color: Colors.red,
//            ),
//            Positioned(
//              left: 18.0,
//              child: Text("I am Jack"),
//            ),
//            Positioned(
//              top: 18.0,
//              child: Text("Your friend"),
//            )
//          ],
//        ),
//      ),
      Stack(
        alignment:Alignment.center ,
        fit: StackFit.expand, //未定位widget占满Stack整个空间
        children: <Widget>[
          Positioned(
            left: 18.0,
            child: Text("I am Jack"),
          ),
          Container(child: Text("Hello world",style: TextStyle(color: Colors.white)),
            color: Colors.red,
          ),
          Positioned(
            top: 18.0,
            child: Text("Your friend"),
          )
        ],
      ),
    );
  }
  
}
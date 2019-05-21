import 'package:flutter/material.dart';

class FlowTestRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new FlowTestState();
  }
}

class FlowTestState extends State<FlowTestRoute>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Flow Widgets"),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
        child: Flow(
          delegate: TestFlowDelegate(margin: EdgeInsets.all(10.0)),
          children: <Widget>[
            new Container(width: 90.0, height:90.0, color: Colors.red,),
            new Container(width: 90.0, height:90.0, color: Colors.green,),
            new Container(width: 90.0, height:90.0, color: Colors.blue,),
            new Container(width: 90.0, height:90.0,  color: Colors.yellow,),
            new Container(width: 90.0, height:90.0, color: Colors.brown,),
            new Container(width: 90.0, height:90.0,  color: Colors.purple,),
          ],
        ),
      ),
    );
  }

}

class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;
  TestFlowDelegate({this.margin});
  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    //计算每一个子widget的位置
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i,
            transform: new Matrix4.translationValues(
                x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        //绘制子widget(有优化)
        context.paintChild(i,
            transform: new Matrix4.translationValues(
                x, y, 0.0));
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  getSize(BoxConstraints constraints){
    //指定Flow的大小
    return Size(double.infinity,200.0);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}
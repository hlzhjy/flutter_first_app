import 'package:flutter/material.dart';
import 'package:flutter_first_app/components/functionals/FunctionalTestRoute.dart';
import 'package:flutter_first_app/components/paints/BoardRoute.dart';
import 'package:flutter_first_app/components/pointerandnotification/PointerAndNotificationRoute.dart';
import 'package:flutter_first_app/components/animates/AnimateRoute.dart';
import 'package:flutter_first_app/components/customwidgets/CustomWidgetRoute.dart';
import 'package:flutter_first_app/components/filenetworks/FileAndNetRequestRoute.dart';

class LayoutTestRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new LayoutTestState();
  }
  
}

class LayoutTestState extends State<LayoutTestRoute>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("布局类Widgets"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical:15.0,horizontal:10.0),
        child: Wrap(
          spacing: 4.0, // 主轴(水平)方向间距
          runSpacing: 4.0, // 纵轴（垂直）方向间距
          alignment: WrapAlignment.center, //沿主轴方向居中
          children: <Widget>[
            RaisedButton(
              child: Text("Row Widget",style:TextStyle(color: Colors.white),),
              color: Colors.blue,
              onPressed: (){
                Navigator.pushNamed(context,"row_layout_test");
              },
            ),
            RaisedButton(
              child: Text("Flex Widget",style:TextStyle(color: Colors.white),),
              color: Colors.blue,
              onPressed: (){
                Navigator.pushNamed(context,"flex_layout_test");
              },
            ),
            RaisedButton(
              child: Text("Wrap Widget",style:TextStyle(color: Colors.white),),
              color: Colors.blue,
              onPressed: (){
                Navigator.pushNamed(context,"wrap_layout_test");
              },
            ),
            RaisedButton(
              child: Text("Flow Widget",style:TextStyle(color: Colors.white),),
              color: Colors.blue,
              onPressed: (){
                Navigator.pushNamed(context,"flow_layout_test");
              },
            ),
            RaisedButton(
              child: Text("Stack和绝对定位",style:TextStyle(color: Colors.white),),
              color: Colors.blue,
              onPressed: (){
                Navigator.pushNamed(context,"stack_position_layout_test");
              },
            ),
            RaisedButton(
              child: Text("容器类Widgets",style:TextStyle(color: Colors.white),),
              color: Colors.blue,
              onPressed: (){
                Navigator.pushNamed(context,"container_layout_test");
              },
            ),
            RaisedButton(
              child: Text("可滚动Widgets",style:TextStyle(color: Colors.white),),
              color: Colors.blue,
              onPressed: (){
                Navigator.pushNamed(context,"scrollable_widgets_test");
              },
            ),
            RaisedButton(
              child: Text("功能型Widgets",style:TextStyle(color: Colors.white),),
              color: Colors.blue,
              onPressed: (){
                Navigator.push(context,new MaterialPageRoute(builder: (context){
                  return new FunctionalTestRoute();
                }));
              },
            ),
            RaisedButton(
              child: Text("画板",style:TextStyle(color: Colors.white),),
              color: Colors.blue,
              onPressed: (){
                Navigator.push(context,new MaterialPageRoute(builder: (context){
                  return new BoardRoute();
                }));
              },
            ),
            RaisedButton(
              child: Text("事件处理与通知",style:TextStyle(color: Colors.white),),
              color: Colors.blue,
              onPressed: (){
                Navigator.push(context,new MaterialPageRoute(builder: (context){
                  return new PointerAndNotificationRoute();
                }));
              },
            ),
            RaisedButton(
              child: Text("动画",style:TextStyle(color: Colors.white),),
              color: Colors.blue,
              onPressed: (){
                Navigator.push(context,new MaterialPageRoute(builder: (context){
                  return new AnimateRoute();
                }));
              },
            ),
            RaisedButton(
              child: Text("自定义Widget",style:TextStyle(color: Colors.white),),
              color: Colors.blue,
              onPressed: (){
                Navigator.push(context,new MaterialPageRoute(builder: (context){
                  return new CustomWidgetRoute();
                }));
              },
            ),
            RaisedButton(
              child: Text("文件操作与网络请求",style:TextStyle(color: Colors.white),),
              color: Colors.blue,
              onPressed: (){
                Navigator.push(context,new MaterialPageRoute(builder: (context){
                  return new FileAndNetRequestRoute();
                }));
              },
            )
          ],
        ),
      ),
    );
  }
  
}
import 'package:flutter/material.dart';
import 'ConstrainedAndSizedBoxTestRoute.dart';
import 'DecoratedBoxTestRoute.dart';
import 'TransformTestRoute.dart';
import 'ContainerTestRoute.dart';
import 'ScaffoldTestRoute.dart';

/*
容器类Widget和布局类Widget都作用于其子Widget，不同的是：

布局类Widget一般都需要接收一个widget数组（children），他们直接或间接继承自（或包含）MultiChildRenderObjectWidget ；
而容器类Widget一般只需要接受一个子Widget（child），他们直接或间接继承自（或包含）SingleChildRenderObjectWidget。
布局类Widget是按照一定的排列方式来对其子Widget进行排列；而容器类Widget一般只是包装其子Widget，对其添加一些修饰（补白或背景色等）、
变换(旋转或剪裁等)、或限制(大小等)。
 */
class ContainerWidgetTestRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new ContainerWidgetTestState();
  }

}

class ContainerWidgetTestState extends State<ContainerWidgetTestRoute>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("布局类Widgets"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 15.0),
        child: Wrap(
          spacing: 4.0,
          runSpacing: 4.0,
          alignment: WrapAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("PaddingTest"),
              onPressed: (){
              Navigator.pushNamed(context, "padding_container_layout");
            }),
            RaisedButton(
                child: Text("ContainerBox和SizedBox"),
                onPressed: (){
                  Navigator.push(context, new MaterialPageRoute(builder: (context){
                    return new ConstrainedAndSizedBoxTestRoute();
                  }));
                }),
            RaisedButton(
                child: Text("装饰容器DecoratedBox"),
                onPressed: (){
                  Navigator.push(context, new MaterialPageRoute(builder: (context){
                    return new DecoratedBoxTestRoute();
                  }));
                }),
            RaisedButton(
                child: Text("变换Tranform"),
                onPressed: (){
                  Navigator.push(context, new MaterialPageRoute(builder: (context){
                    return new TransformTestRoute();
                  }));
                }),
            RaisedButton(
                child: Text("Container 容器"),
                onPressed: (){
                  Navigator.push(context, new MaterialPageRoute(builder: (context){
                    return new ContainerTestRoute();
                  }));
                }),
            RaisedButton(
                child: Text("Scaffold、TabBar、底部导航"),
                onPressed: (){
                  Navigator.push(context, new MaterialPageRoute(builder: (context){
                    return new ScaffoldTestRoute();
                  }));
                })
          ],
        ),
      ),
    );
  }

}
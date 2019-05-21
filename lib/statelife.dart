/*
这是记录生命周期的dart文件
 */
import 'package:flutter/material.dart'; //导入Material UI组件库

class StateLifeCycle extends StatefulWidget {
  const StateLifeCycle({Key key, this.initValue: 0});

  final int initValue;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new StateLifeCycleState();
  }
}

class StateLifeCycleState extends State<StateLifeCycle> {
  int _counter;

  @override
  void initState() {
    super.initState();
    //初始化状态
    _counter = widget.initValue;
    print("initState");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print("build");
    String icons = "\uE914 \uE000 \uE90D";
    return Scaffold(
      appBar: AppBar(
        title: Text("State生命周期"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text('$_counter'),
              //点击后计数器自增
              onPressed: () => setState(() => ++_counter),
            ),
            Image.network(
              "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
              width: 100.0,
              height: 200.0,
              repeat: ImageRepeat.repeatY,
              color: Colors.blue,
              colorBlendMode: BlendMode.difference,
            ),
            FlatButton(
                child: Text(
              icons,
              style: TextStyle(
                  fontFamily: "MaterialIcons",
                  fontSize: 24.0,
                  color: Colors.green),
            ))
          ],
        ),
      ),
    );
//    return Center(
//      child: FlatButton(
//        child: Text('$_counter'),
//        //点击后计数器自增
//        onPressed:()=>setState(()=> ++_counter) ,
//      ),
//    );
  }

  @override
  void didUpdateWidget(StateLifeCycle oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("deactive");
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }

  @override
  void reassemble() {
    super.reassemble();
    print("reassemble");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }
}

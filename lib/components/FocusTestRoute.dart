import 'package:flutter/material.dart';

/*
焦点可以通过FocusNode和FocusScopeNode来控制，默认情况下，焦点由FocusScope来管理，
它代表焦点控制范围，可以在这个范围内可以通过FocusScopeNode在输入框之间移动焦点、设置
默认焦点等。我们可以通过FocusScope.of(context) 来获取widget树中默认的FocusScopeNode。
 */
class FocusTestRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new FocusTestState();
  }
}

class FocusTestState extends State<FocusTestRoute> {
  FocusNode focusScope1 = new FocusNode();
  FocusNode focusScope2 = new FocusNode();
  FocusScopeNode focusScopeNode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //焦点变化监听事件
    focusScope1.addListener(() {
      print("focusScope1：" + focusScope1.hasFocus.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("焦点控制"),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Theme(
            data: Theme.of(context).copyWith(
                hintColor: Colors.grey[200], //定义下划线颜色
                inputDecorationTheme: InputDecorationTheme(
                    labelStyle: TextStyle(color: Colors.grey), //定义label字体样式
                    hintStyle:
                        TextStyle(color: Colors.grey, fontSize: 14.0) //定义提示文本样式
                    )),
            child: Column(
              children: <Widget>[
                TextField(
                  autofocus: true,
                  focusNode: focusScope1,
                  decoration: InputDecoration(
                      labelText: "input1",
                      hintText: "第一个输入框",
                      //这个属性没有效果,通过Theme设置hintStyle
//                      border: UnderlineInputBorder(
//                          borderSide: BorderSide(
//                              color: Colors.red,
//                              width: 5.0
//                          )
//                      ),
                      prefixIcon: Icon(Icons.person),
                      hintStyle: TextStyle(color: Colors.yellow, fontSize: 20)),
                ),
                TextField(
                    autofocus: false,
                    focusNode: focusScope2,
                    decoration: InputDecoration(
                        labelText: "input2", prefixIcon: Icon(Icons.lock))),
                Builder(builder: (ntx) {
                  return Column(
                    children: <Widget>[
                      RaisedButton(
                          child: Text("移动焦点"),
                          onPressed: () {
                            if (null == focusScopeNode) {
                              focusScopeNode = FocusScope.of(context);
                            }
                            focusScopeNode.requestFocus(focusScope2);
                          }),
                      RaisedButton(
                          child: Text("隐藏键盘"),
                          onPressed: () {
                            focusScope1.unfocus();
                            focusScope2.unfocus();
                          })
                    ],
                  );
                })
              ],
            ),
          ),
        ));
  }
}

import 'package:flutter/material.dart'; //导入Material UI组件库
import 'package:english_words/english_words.dart'; //导入英文词库
import 'package:url_launcher/url_launcher.dart'; //导入第三方唤醒库
import 'package:flutter_first_app/statelife.dart';
import 'package:flutter_first_app/components/SwitchAndCheckBoxText.dart';
import 'package:flutter_first_app/components/TextFieldAndForm.dart';
import 'package:flutter_first_app/components/FocusTestRoute.dart';
import 'package:flutter_first_app/components/FormTestRoute.dart';
import 'package:flutter_first_app/components/layouts/LayoutsTest.dart';
import 'package:flutter_first_app/components/layouts/RowTestRoute.dart';
import 'package:flutter_first_app/components/layouts/FlexTestRoute.dart';
import 'package:flutter_first_app/components/layouts/WrapTestRoute.dart';
import 'package:flutter_first_app/components/layouts/FlowTestRoute.dart';
import 'package:flutter_first_app/components/layouts/StackPositionTestRoute.dart';

import 'package:flutter_first_app/components/containers/ContainerWidgetTestRoute.dart';
import 'package:flutter_first_app/components/containers/PaddingTestRoute.dart';
import 'package:flutter_first_app/components/scrollers/ScrollerWidgetsRoute.dart';

void main() => runApp(MyApp()); //应用入口

class MyApp extends StatelessWidget {  //应用本身是一个widget
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(//Material库中提供的Flutter APP框架，通过它可以设置应用的名称、主题、语言、首页及路由列表等。MaterialApp也是一个widget。
      title: 'Flutter Demo', //应用名称
      debugShowMaterialGrid:false, //给APP全局加网格线条
      showPerformanceOverlay:false, //显示应用程序性能图
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue, //应用主题颜色
      ),
      //注册路由表
      routes: {
        "new_page":(context)=>NewRoute(),
        "state_life":(context)=>StateLifeCycle(),
        "switch_cb_component":(context)=>SwitchAndCheckbox(),
        "textfield_form":(context)=>TextFieldAndForm(),
        "focus_test":(context)=>FocusTestRoute(),
        "form_test":(context)=>FormTestRoute(),
        "layout_test":(context)=>LayoutTestRoute(),
        "row_layout_test":(context)=>RowTestRoute(),
        "flex_layout_test":(context)=>FlexTestRoute(),
        "wrap_layout_test":(context)=>WrapTestRoute(),
        "flow_layout_test":(context)=>FlowTestRoute(),
        "stack_position_layout_test":(context)=>StackPositionTestRoute(),
        "container_layout_test":(context)=>ContainerWidgetTestRoute(),
        "padding_container_layout":(context)=>PaddingTestRoute(),
        "scrollable_widgets_test":(context)=>ScrollerWidgetsRoute(),
      },
      home: MyHomePage(title: 'Flutter Demo Home Page'), //应用首页路由
      //为Flutter应用的首页，它也是一个widget。
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    //先执行_counter++，然后再调用setState方法，去通知Flutter框架，有状态发生了改变，
    // Flutter框架收到通知后，会执行build方法来根据新的状态重新构建界面， Flutter 对此方法做了优化，
    // 使重新执行变的很快，所以你可以重新构建任何需要更新的东西，而无需分别去修改各个widget。
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(//是Material库中提供的页面脚手架，它包含导航栏和Body以及FloatingActionButton（如果需要的话）。
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have clicked the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            RaisedButton(
              child: Text("open new route"),
              textColor: Colors.pink,
              onPressed: (){
                //Navigator是一个路由管理的widget，它通过一个栈来管理一个路由widget集合

                //通过Navigator.push传入一个路由页面跳转
//                Navigator.push(context,//跳转
//                  new MaterialPageRoute(builder: (context){ //路由组件
//                    return new NewRoute();
//                  }));

                //通过路由表中的名称进行跳转
                Navigator.pushNamed(context, "new_page");
              },
            ),
            new RandomWordsWidget(),
            RaisedButton(
              child: Text("open state route"),
              textColor: Colors.indigoAccent,
              onPressed: (){
                Navigator.pushNamed(context, "state_life");
              },
            ),
            RaisedButton(
              child: Text("打开复选框与单选框"),
              textColor: Colors.indigoAccent,
              onPressed: (){
                Navigator.pushNamed(context, "switch_cb_component");
              },
            ),
            RaisedButton(
              child: Text("输入框与表单控件"),
              textColor: Colors.indigoAccent,
              onPressed: (){
                Navigator.pushNamed(context, "textfield_form");
              },
            ),
            RaisedButton(
              child: Text("焦点控制 go to FocusTest"),
              textColor: Colors.indigoAccent,
              onPressed: (){
                Navigator.pushNamed(context, "focus_test");
              },
            ),
            RaisedButton(
              child: Text("布局类Widgets"),
              textColor: Colors.indigoAccent,
              onPressed: (){
                Navigator.pushNamed(context, "layout_test");
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
/*
 * 一个生成随机英文单词的控件
 */
class RandomWordsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 生成随机字符串
    final wordPair = new WordPair.random();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Text(wordPair.toString()),
    );
  }
}
class NewRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("New Route"),
      ),
      body: Center(
        child:Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children:<Widget>[
            Text("This is new Route"),
            RaisedButton(
              child: Text("back to history route"),
              textColor: Colors.red,
              onPressed: (){
                //Navigator.pop 当前的路由出栈 null为返回的数据，此处为空
                Navigator.pop(context,null);
              },
            ),
          ],
        )
      ),
    );
  }
}


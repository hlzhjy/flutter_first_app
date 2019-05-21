import 'package:flutter/material.dart';

/*
 * 输入框与表单验证
 */
class TextFieldAndForm extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new TextFieldAndFormState();
  }

}

class TextFieldAndFormState extends State<TextFieldAndForm>{

  TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    //通过controller设置输入框的默认值以及选中的文案
    _controller.text="hello world!";
    _controller.selection=TextSelection(
        baseOffset: 2,
        extentOffset: _controller.text.length
    );
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("输入框与表单"),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            autofocus: false,
            decoration: InputDecoration(
                labelText: "用户名",
                hintText: "用户名或邮箱",
                prefixIcon: Icon(Icons.person)
            ),
            //TextField有两种文本获取方式，一种是在onChanged中获取并保存值，
            //还有一种是通过controller来获取值，值变化的监听也有两种方式，
            //一种是TextField的onChanged，还有是controller的addListener
            //两种方式相比，onChanged是专门用于监听文本变化，而controller的功能却多一些，除了能监听文本变化外，它还可以设置默认值、选择文本，
            onChanged: (v){
              print("text from onChanged:$v");
            },
            controller: _controller,
          ),
          TextField(
            decoration: InputDecoration(
                labelText: "密码",
                hintText: "您的登录密码",
                prefixIcon: Icon(Icons.lock)
            ),
            obscureText: true,
            autofocus: true,
          ),
          RaisedButton(
              child: Text("焦点控制 go to FocusTest"),
              onPressed: (){
                Navigator.pushNamed(context, "focus_test");
              }
          ),
          RaisedButton(
            child: Text("表单"),
            onPressed: (){
              Navigator.pushNamed(context, "form_test");
            },
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    _controller.addListener((){
      print("text from controller:"+_controller.text);
    });
    super.initState();
  }

}
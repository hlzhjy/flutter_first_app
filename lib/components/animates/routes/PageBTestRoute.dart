import 'package:flutter/material.dart';

class PageBTestRoute extends StatelessWidget{

  final String _msg;

  PageBTestRoute(this._msg);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("路由动画"),
      ),
      body: Center(
        child: Text("我用了"+_msg),
      ),
    );
  }
}
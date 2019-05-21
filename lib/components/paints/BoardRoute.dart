import 'package:flutter/material.dart';
import 'PainterTestRoute.dart';

class BoardRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("画板"),
      ),
      body: new PainterTestRoute(),
    );
  }
}
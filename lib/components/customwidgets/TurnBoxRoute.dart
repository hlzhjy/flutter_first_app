import 'package:flutter/material.dart';
import 'widgets/TurnBox.dart';

class TurnBoxRoute extends StatefulWidget {
  @override
  _TurnBoxRouteState createState() => new _TurnBoxRouteState();
}

class _TurnBoxRouteState extends State<TurnBoxRoute> {
  double _turns = .0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("TurnBox"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            TurnBox(
              turns: _turns,
              speed: 500,
              child: Icon(Icons.refresh, size: 50,),
            ),
            TurnBox(
              turns: _turns,
              speed: 1000,
              child: Icon(Icons.refresh, size: 150.0,),
            ),
            RaisedButton(
              child: Text("顺时针旋转1圈"),
              onPressed: () {
                setState(() {
                  _turns += 1;
                });
              },
            ),
            RaisedButton(
              child: Text("逆时针旋转1圈"),
              onPressed: () {
                setState(() {
                  _turns -= 1;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
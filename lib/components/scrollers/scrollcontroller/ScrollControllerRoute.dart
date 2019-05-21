import 'package:flutter/material.dart';
import 'ScrollControllerTestRoute.dart';

class ScrollControllerRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("滚动控制与监听"),
      ),
      body: Padding(padding: EdgeInsets.all(10),
        child: Wrap(
          spacing: 4.0,
          runSpacing: 4.0,
          alignment: WrapAlignment.center,
          children: <Widget>[
            RaisedButton(
                onPressed: (){
                  Navigator.push(context, new MaterialPageRoute(builder: (context){
                    return new ScrollControllerTestRoute();
                  }));
                },
              child: Text("ScrollController",style: TextStyle(color: Colors.orange),),
              color: Colors.black12,
            )
          ],
        ),
      ),
    );
  }
}
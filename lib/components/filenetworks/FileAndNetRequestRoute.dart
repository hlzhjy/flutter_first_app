import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'FileTestRoute.dart';
import 'HttpClientTestRoute.dart';
import 'DioPackageTestRoute.dart';

class FileAndNetRequestRoute extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("文件操作与网络请求"),
      ),
      body: Padding(padding: EdgeInsets.all(10),
        child: Wrap(
          spacing: 4,
          runSpacing: 4,
          alignment: WrapAlignment.start,
          children: <Widget>[
            RaisedButton(
              onPressed: (){
                Navigator.push(context, new CupertinoPageRoute(builder: (context){
                  return new FileTestRoute();
                }));
              },
              child: Text("文件操作",style: TextStyle(color: Colors.white),),
              color: Colors.blue,
            ),
            RaisedButton(
              onPressed: (){
                Navigator.push(context, new CupertinoPageRoute(builder: (context){
                  return new HttpClientTestRoute();
                }));
              },
              child: Text("Http请求-HttpClient",style: TextStyle(color: Colors.white),),
              color: Colors.blue,
            ),
            RaisedButton(
              onPressed: (){
                Navigator.push(context, new CupertinoPageRoute(builder: (context){
                  return new DioPackageTestRoute();
                }));
              },
              child: Text("Http请求-Dio Package",style: TextStyle(color: Colors.white),),
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
  
}
    
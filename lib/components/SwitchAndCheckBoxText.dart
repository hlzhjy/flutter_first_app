import 'package:flutter/material.dart';

class SwitchAndCheckbox extends StatefulWidget{
  @override
  SwitchAndCheckboxState createState() {
    // TODO: implement createState
    return new SwitchAndCheckboxState();
  }

}

class SwitchAndCheckboxState extends State<SwitchAndCheckbox>{

  bool _switchSelected = false;
  bool _checkboxSelected = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("复选框与多选框"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Switch(
                value: _switchSelected,
                onChanged: (value){
                  setState(() {
                    _switchSelected = value;
                  });
                }),
            Checkbox(
                value: _checkboxSelected,
                onChanged: (value){
                  setState(() {
                    _checkboxSelected = value;
                  });
                })
          ],
        ),
      ),
    );
  }
  
}

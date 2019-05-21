import 'package:flutter/material.dart';

class ConstrainedAndSizedBoxTestRoute extends StatelessWidget{

  final Widget redBox=DecoratedBox(
    decoration: BoxDecoration(color: Colors.red),
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("ConstrainedBox和SizedBox"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
              child: Container(
                constraints: BoxConstraints(
                  //BoxConstraints用于设置限制条件
                    minHeight: 50.0,
                    minWidth: double.infinity
                ),
                child: Container(
                  height: 5.0, //虽然设置了5，但是因为最小高度是50.0，所以5设置不成功
                  child: redBox,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
              child:SizedBox(//SizedBox用于给子widget指定固定的宽高
                width: 80.0,
                height: 80.0,
                child: redBox,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
              child:ConstrainedBox(
                //多重限制的情况：对于minWidth和minHeight来说，是取父子中相应数值较大的。
                  constraints: BoxConstraints(minWidth: 90.0, minHeight: 20.0),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minWidth: 60.0, minHeight: 60.0),
                    child: redBox,
                  )
              )
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              //UnconstrainedBox不会对子Widget产生任何限制，它允许其子Widget按照其本身大小绘制。
              // 一般情况下，我们会很少直接使用此widget，但在"去除"多重限制的时候也许会有帮助
              child: ConstrainedBox(
                  constraints: BoxConstraints(minWidth: 60.0, minHeight: 100.0),  //父
                  child: UnconstrainedBox( //“去除”父级限制
                    //UnconstrainedBox对父限制的“去除”并非是真正的去除，上面例子中虽然红色区域大小是90×20，
                    // 但上方仍然有80的空白空间。也就是说父限制的minHeight(100.0)仍然是生效的，只不过它不影
                    // 响最终子元素的大小，但仍然还是占有相应的空间，可以认为此时的父ConstrainedBox是作用于子
                    // ConstrainedBox上，而redBox只受子ConstrainedBox限制
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minWidth: 90.0, minHeight: 20.0),//子
                      child: redBox,
                    ),
                  )
              ),
            )
          ],
        ),
      ),

    );
  }

}
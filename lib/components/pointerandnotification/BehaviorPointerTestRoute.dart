import 'package:flutter/material.dart';

/*
现在，我们重点来介绍一下behavior属性，它决定子Widget如何响应命中测试，
它的值类型为HitTestBehavior，这是一个枚举类，有三个枚举值：

deferToChild：子widget会一个接一个的进行命中测试，如果子Widget中有测试通过的，
              则当前Widget通过，这就意味着，如果指针事件作用于子Widget上时，
              其父(祖先)Widget也肯定可以收到该事件。

opaque：在命中测试时，将当前Widget当成不透明处理(即使本身是透明的)，
        最终的效果相当于当前Widget的整个区域都是点击区域。举个例子：

          Listener(
              child: ConstrainedBox(
                  constraints: BoxConstraints.tight(Size(300.0, 150.0)),
                  child: Center(child: Text("Box A")),
              ),
              //behavior: HitTestBehavior.opaque,
              onPointerDown: (event) => print("down A")
          ),
上例中，只有点击文本内容区域才会触发点击事件，因为 deferToChild 会去子widget判断是否命中测试，
而该例中子widget就是 Text("Box A") 。 如果我们想让整个300×150的矩形区域都能点击我们可以将
behavior设为HitTestBehavior.opaque。注意，该属性并不能用于在Widget树中拦截（忽略）事件，
它只是决定命中测试时的Widget大小。

translucent：当点击Widget透明区域时，可以对自身边界内及底部可视区域都进行命中测试，
这意味着点击顶部widget透明区域时，顶部widget和底部widget都可以接收到事件
 */
class BehaviorPointerTestRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new BehaviorPointerTestState();
  }
}

class BehaviorPointerTestState extends State<BehaviorPointerTestRoute> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Behavior属性"),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child:
//          Listener(
//              child: ConstrainedBox(
//                constraints: BoxConstraints.tight(Size(300.0, 150.0)),
//                child: Center(child: Text("Box A")),
//              ),
////              behavior: HitTestBehavior.opaque,
//              onPointerDown: (event) => print("down A")),
//          )
                /*
    translucent：当点击Widget透明区域时，可以对自身边界内及底部可视区域都进行命中测试，
    这意味着点击顶部widget透明区域时，顶部widget和底部widget都可以接收到事件，例如：
     */
            Stack(
              children: <Widget>[
                Listener(
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tight(Size(300.0, 200.0)),
                    child: DecoratedBox(
                        decoration: BoxDecoration(color: Colors.blue)),
                  ),
                  onPointerDown: (event) => print("down0"),
                ),
                Listener(
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tight(Size(200.0, 100.0)),
                    child: DecoratedBox(
                      decoration: BoxDecoration(color: Colors.red),
                      child: Text("左上角200*100范围内非文本区域点击"),
                    ),
                  ),
                  onPointerDown: (event) => print("down1"),
//                  behavior: HitTestBehavior.translucent, //放开此行注释后可以"点透"
                )
              ],
            )
            //上例中，当注释掉最后一行代码后，在左上角200*100范围内非文本区域点击时（顶部Widget透明区域），
          // 控制台只会打印“down0”，也就是说顶部widget没有接收到事件，而只有底部接收到了。当放开注释后，
          // 再点击时顶部和底部都会接收到事件，此时会打印：
          // I/flutter ( 3039): down1
          // I/flutter ( 3039): down0
        )
    );
  }
}

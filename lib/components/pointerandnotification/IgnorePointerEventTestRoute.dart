import 'package:flutter/material.dart';

/*
忽略PointerEvent
假如我们不想让某个子树响应PointerEvent的话，我们可以使用IgnorePointer和AbsorbPointer，
这两个Widget都能阻止子树接收指针事件，不同之处在于AbsorbPointer本身会参与命中测试，而
IgnorePointer本身不会参与，这就意味着AbsorbPointer本身是可以接收指针事件的(但其子树不行)，
而IgnorePointer不可以。一个简单的例子如下：

点击Container时，由于它在AbsorbPointer的子树上，所以不会响应指针事件，所以日志不会输出"in"，
但AbsorbPointer本身是可以接收指针事件的，所以会输出"up"。如果将AbsorbPointer换成IgnorePointer，
那么两个都不会输出。
 */

class IgnorePointerEventTestRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("忽略PointerEvent"),
      ),
      body: Listener(
        child: AbsorbPointer(
          child: Listener(
            child: Container(
              color: Colors.red,
              width: 200.0,
              height: 100.0,
            ),
            onPointerDown: (event)=>print("in"),
          ),
        ),
        onPointerDown: (event)=>print("up"),
      ),
    );
  }
}
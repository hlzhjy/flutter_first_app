import 'package:flutter/material.dart';
/*
动画状态监听
上面说过，我们可以通过Animation的addStatusListener()方法来添加动画状态改变监听器。
Flutter中，有四种动画状态，在AnimationStatus枚举类中定义，下面我们逐个说明：

枚举值	含义
dismissed	动画在起始点停止
forward	动画正在正向执行
reverse	动画正在反向执行
completed	动画在终点停止
示例
我们将上面图片放大的示例改为先放大再缩小再放大……这样的循环动画。要实现这种效果，我们只需
要监听动画状态的改变即可，即：在动画正向执行结束时反转动画，在动画反向执行结束时再正向执
行动画。代码如下：
animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //动画执行结束时反向执行动画
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        //动画恢复到初始状态时执行动画（正向）
        controller.forward();
      }
    });
 */
class ScaleAnimationRoute4 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new ScaleAnimationRouteState4();
  }
}

class ScaleAnimationRouteState4 extends State<ScaleAnimationRoute4> with SingleTickerProviderStateMixin {

  Animation<double> animation;
  AnimationController controller;

  initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(seconds: 3), vsync: this);
    //图片宽高从0变到300
    animation = new Tween(begin: 0.0, end: 300.0).animate(controller);
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //动画执行结束时反向执行动画
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        //动画恢复到初始状态时执行动画（正向）
        controller.forward();
      }
    });
    //启动动画
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedBuilder重构"),
      ),
      body: GrowTransition(
        child: Image.asset("images/aquarium-fish.jpg"),
        animation: animation,
      ),
    );
  }
}

class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});

  final Widget child;
  final Animation<double> animation;

  Widget build(BuildContext context) {
    return new Center(
      child: new AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget child) {
            return new Container(
                height: animation.value,
                width: animation.value,
                child: child
            );
          },
          child: child
      ),
    );
  }
}
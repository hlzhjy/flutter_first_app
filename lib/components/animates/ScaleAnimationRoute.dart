import 'package:flutter/material.dart';
/*
上面代码中addListener()函数调用了setState()，所以每次动画生成一个新的数字时，
当前帧被标记为脏(dirty)，这会导致widget的build()方法再次被调用，而在build()中，
改变Image的宽高，因为它的高度和宽度现在使用的是animation.value ，所以就会逐渐放大。
值得注意的是动画完成时要释放控制器(调用dispose()方法)以防止内存泄漏。
 */
class ScaleAnimationRoute extends StatefulWidget {
  @override
  _ScaleAnimationRouteState createState() => new _ScaleAnimationRouteState();
}

//需要继承TickerProvider，如果有多个AnimationController，则应该使用TickerProviderStateMixin。
class _ScaleAnimationRouteState extends State<ScaleAnimationRoute>  with SingleTickerProviderStateMixin{

  Animation<double> animation;
  AnimationController controller;

  initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(seconds: 2), vsync: this);
    //上面的例子中并没有指定Curve，所以放大的过程是线性的（匀速），下面我们指定一个Curve，
    // 来实现一个类似于弹簧效果的动画过程，我们只需要将initState中的代码改为下面这样即可：
    //使用弹性曲线
    animation=CurvedAnimation(parent: controller, curve: Curves.slowMiddle);
    //图片宽高从0变到300
    animation = new Tween(begin: 0.0, end: 300.0).animate(animation)
      ..addListener(() {
        setState(()=>{});
      });
    //启动动画(正向执行)
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("动画结构"),
      ),
      body: Center(
        child: Image.asset("images/aquarium-fish.jpg",
            width: animation.value,
            height: animation.value
        ),
      ),
    );
  }

  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }
}
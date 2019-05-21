import 'package:flutter/material.dart';
/*
细心的读者可能已经发现上面示例(ScaleAnimationRoute)中通过addListener()和setState()
来更新UI这一步其实是通用的，如果每个动画中都加这么一句是比较繁琐的。AnimatedWidget类封装了
调用setState()的细节，并允许我们将Widget分离出来，重构后的代码如下
 */
class AnimatedImage extends AnimatedWidget {
  AnimatedImage({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return new Center(
      child: Image.asset("images/aquarium-fish.jpg",
          width: animation.value,
          height: animation.value
      ),
    );
  }
}


class ScaleAnimationRoute2 extends StatefulWidget {
  @override
  _ScaleAnimationRouteState2 createState() => new _ScaleAnimationRouteState2();
}

class _ScaleAnimationRouteState2 extends State<ScaleAnimationRoute2>
    with SingleTickerProviderStateMixin {

  Animation<double> animation;
  AnimationController controller;

  initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(seconds: 3), vsync: this);
    //图片宽高从0变到300
    animation = new Tween(begin: 0.0, end: 300.0).animate(controller);
    //启动动画
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedWidget"),
      ),
      body: AnimatedImage(animation: animation,),
    );
  }

  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }
}
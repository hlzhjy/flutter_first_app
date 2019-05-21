import 'package:flutter/material.dart';
/*
用AnimatedBuilder重构
用AnimatedWidget可以从动画中分离出widget，而动画的渲染过程（即设置宽高）
仍然在AnimatedWidget中，假设如果我们再添加一个widget透明度变化的动画，
那么我们需要再实现一个AnimatedWidget，这样不是很优雅，如果我们能把渲染过
程也抽象出来，那就会好很多，而AnimatedBuilder正是将渲染逻辑分离出来, 上
面的build方法中的代码可以改为：

上面的代码中有一个迷惑的问题是，child看起来像被指定了两次。但实际发生的事情是：
将外部引用child传递给AnimatedBuilder后AnimatedBuilder再将其传递给匿名构造器，
 然后将该对象用作其子对象。最终的结果是AnimatedBuilder返回的对象插入到Widget树中。

也许你会说这和我们刚开始的示例差不了多少，其实它会带来三个好处：

不用显式的去添加帧监听器，然后再调用setState() 了，这个好处和AnimatedWidget是一样的。

动画构建的范围缩小了，如果没有builder，setState()将会在父widget上下文调用，这将会
导致父widget的build方法重新调用，而有了builder之后，只会导致动画widget的build重
新调用，这在复杂布局下性能会提高。

通过AnimatedBuilder可以封装常见的过渡效果来复用动画。下面我们通过封装一个GrowTransition
来说明，它可以对子widget实现放大动画：
 */
class ScaleAnimationRoute3 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new ScaleAnimationRouteState3();
  }
}

class ScaleAnimationRouteState3 extends State<ScaleAnimationRoute3> with SingleTickerProviderStateMixin {

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
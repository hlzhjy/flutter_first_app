import 'package:flutter/material.dart';
import 'StaggerAnimation.dart';

/*
交错动画
有些时候我们可能会需要一些复杂的动画，这些动画可能由一个动画序列或重叠的动画组成，
比如：有一个柱状图，需要在高度增长的同时改变颜色，等到增长到最大高度后，我们需要
在X轴上平移一段距离。这时我们就需要使用交错动画（Stagger Animation）。交错动
画需要注意以下几点：

*要创建交错动画，需要使用多个动画对象
*一个AnimationController控制所有动画
*给每一个动画对象指定间隔（Interval）
所有动画都由同一个AnimationController驱动，无论动画实时持续多长时间，控制器的
值必须介于0.0和1.0之间，而每个动画的间隔（Interval）介于0.0和1.0之间。对于在
间隔中设置动画的每个属性，请创建一个Tween。 Tween指定该属性的开始值和结束值。也
就是说0.0到1.0代表整个动画过程，我们可以给不同动画指定起始点和终止点来决定它们的
开始时间和终止时间。

示例
下面我们看一个例子，实现一个柱状图增长的动画：

开始时高度从0增长到300像素，同时颜色由绿色渐变为红色；这个过程占据整个动画时间的60%。
高度增长到300后，开始沿X轴向右平移100像素；这个过程占用整个动画时间的40%。
我们将执行动画的Widget分离出来：


 */

class StaggerAnimationRoute extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => StaggerAnimationRouteState();

}

class StaggerAnimationRouteState extends State<StaggerAnimationRoute> with TickerProviderStateMixin{

  AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this
    );
  }

  Future<Null> _playAnimation() async{
    try{
      //正向执行
      await _controller.forward().orCancel;
      //反向执行
      await _controller.reverse().orCancel;
    }on TickerCanceled{
      // the animation got canceled, probably because we were disposed
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("交错动画"),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          _playAnimation();
        },
        child: Center(
          child: Container(
            width: 300.0,
            height: 300.0,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              border: Border.all(
                color:  Colors.black.withOpacity(0.5),
              ),
            ),
            //调用我们定义的交错动画Widget
            child: StaggerAnimation(
                controller: _controller
            ),
          ),
        ),
      ),
    );
  }
}
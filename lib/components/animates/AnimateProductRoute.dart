import 'package:flutter/material.dart';

class AnimateProductRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter动画简介"),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              //动态创建一个List<Widget>
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "动画",
                  style: TextStyle(color: Colors.black,fontSize: 20,),),
                Text(
                  "在任何系统的UI框架中，动画实现的原理都是相同的，即：在一段时间内，快速地多次改变UI外观，"
                      "由于人眼会产生视觉暂留，最终看到的就是一个“连续”的动画，这和电影的原理是一样的，而UI"
                      "的一次改变称为一个动画帧，对应一次屏幕刷新，而决定动画流畅度的一个重要指标就是帧率FPS"
                      "（Frame Per Second），指每秒的动画帧数。很明显，帧率越高则动画就会越流畅。一般情况下，"
                      "对于人眼来说，动画帧率超过16FPS，就比较流畅了，超过32FPS就会非常的细腻平滑，而超过32FPS"
                      "基本就感受不到差别了。由于动画的每一帧都是要改变UI输出，所以在一个时间段内连续的改变UI输出是"
                      "比较耗资源的，对设备的软硬件系统要求都较高，所以在UI系统中，动画的平均帧率是重要的性能指标，"
                      "而在Flutter中，理想情况下是可以实现60FPS的，这和原生应用动画基本是持平的。\n",
                  style: TextStyle(color: Colors.black,fontSize: 12,),),

                Text(
                  "Flutter中动画抽象",
                  style: TextStyle(color: Colors.black,fontSize: 20,),),
                Text(
                  "为了方便开发者创建动画，不同的UI系统对动画都进行了一些抽象，比如在Android中可以通过XML来描述"
                      "一个动画然后设置给View。Flutter中也对动画进行了抽象，主要涉及Tween、Animation、Curve、"
                      "Controller这些角色。\n",
                  style: TextStyle(color: Colors.black,fontSize: 12,),),

                Text(
                  "Animation",
                  style: TextStyle(color: Colors.black,fontSize: 20,),),
                Text(
                  "Animation对象本身和UI渲染没有任何关系。Animation是一个抽象类，它用于保存动画的插值和状态；"
                      "其中一个比较常用的Animation类是Animation。Animation对象是一个在一段时间内依次生成一个"
                      "区间(Tween)之间值的类。Animation对象的输出值可以是线性的、曲线的、一个步进函数或者任何其"
                      "他曲线函数。 根据Animation对象的控制方式，动画可以反向运行，甚至可以在中间切换方向。Animation"
                      "还可以生成除double之外的其他类型值，如：Animation\ 或 Animation\。可以通过Animation对象的"
                      "value属性获取动画的当前值。\n",
                  style: TextStyle(color: Colors.black,fontSize: 12,),),

                Text(
                  "动画通知",
                  style: TextStyle(color: Colors.black,fontSize: 20,),),
                Text(
                  "我们可以通过Animation来监听动画的帧和状态变化：\n"

                    "addListener()可以给Animation添加帧监听器，在每一帧都会被调用。"
                                  "帧监听器中最常见的行为是改变状态后调用setState()来触发UI重建。\n"
                    "addStatusListener()可以给Animation添加“动画状态改变”监听器；动画开始、结束、正向或反向"
                              "（见AnimationStatus定义）时会调用StatusListener。\n"
                  "在后面的章节中我们将会举例说明\n",
                  style: TextStyle(color: Colors.black,fontSize: 12,),),

                Text(
                  "Curve",
                  style: TextStyle(color: Colors.black,fontSize: 20,),),
                Text(
                  "动画过程可以是匀速的、加速的或者先加速后减速等。Flutter中通过Curve（曲线）"
                      "来描述动画过程，Curve可以是线性的(Curves.linear)，也可以是非线性的。\n"
                      "CurvedAnimation 将动画过程定义为一个非线性曲线.\n"
                      "final CurvedAnimation curve =\n"
                    "new CurvedAnimation(parent: controller, curve: Curves.easeIn);\n"
                      "注: Curves 类类定义了许多常用的曲线，也可以创建自己的，例如：\n"
                      "class ShakeCurve extends Curve {\n"
                      "\ \ \ @override\n"
                      "\ \ \ double transform(double t) {\n"
                      "\ \ \ \ \ \ return math.sin(t * math.PI * 2);\n"
                      "\ \ \ }\n"
                      "}\n",
                  style: TextStyle(color: Colors.black,fontSize: 12,),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
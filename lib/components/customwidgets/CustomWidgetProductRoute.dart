import 'package:flutter/material.dart';

class CustomWidgetProductRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("自定义Widget方法简介"),
      ),
      body: Scrollbar(child: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Padding(
            padding: EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text.rich(
                TextSpan(
                  text: "自定义Widget方法简介\n",
                  style: TextStyle(color: Colors.black,fontSize: 20)
                ),
              ),
              Text.rich(
                TextSpan(
                    text: "当Flutter提供的现有Widget无法满足我们的需求，或者我们"
                        "为了共享代码需要封装一些通用Widget，这时我们就需要自定义Widget。"
                        "在Flutter中自定义Widget有三种方式：通过组合其它Widget、自绘和实"
                        "现RenderObject，本节我们先分别介绍一下这三种方式的特点，后面章节中"
                        "则详细介绍它们的细节。\n",
                    style: TextStyle(color: Colors.black,fontSize: 12)
                ),
              ),
              Text.rich(
                TextSpan(
                    text: "组合其它Widget\n",
                    style: TextStyle(color: Colors.black,fontSize: 20)
                ),
              ),
              Text.rich(
                TextSpan(
                    text: "这种方式是通过拼装其它低级别的Widget来组合成一个高级别的Widget，"
                        "例如我们之前介绍的Container就是一个组合Widget，它是由DecoratedBox、"
                        "ConstrainedBox、Transform、Padding、Align等组成。\n\n"

                    "在Flutter中，组合的思想非常重要，Flutter提供了非常多的基础Widget，"
                        "而我们的界面开发都是按照需要组合这些Widget来实现各种不同的布局。\n",
                    style: TextStyle(color: Colors.black,fontSize: 12)
                ),
              ),
              Text.rich(
                TextSpan(
                    text: "自绘\n",
                    style: TextStyle(color: Colors.black,fontSize: 20)
                ),
              ),
              Text.rich(
                TextSpan(
                    text: "如果遇到无法通过系统提供的现有Widget实现的UI时，如我们需要一个"
                        "渐变圆形进度条，而Flutter提供的CircularProgressIndicator并不"
                        "支持在显示精确进度时对进度条应用渐变色（其valueColor 属性只支持执"
                        "行旋转动画时变化Indicator的颜色），这时最好的方法就是通过自定义Widget"
                        "绘制逻辑来画出我们期望的外观。Flutter中提供了CustomPaint和Canvas供我们自绘UI外观。\n",
                    style: TextStyle(color: Colors.black,fontSize: 12)
                ),
              ),
              Text.rich(
                TextSpan(
                    text: "实现RenderObject\n",
                    style: TextStyle(color: Colors.black,fontSize: 20)
                ),
              ),
              Text.rich(
                TextSpan(
                    text: "Flutter提供的任何具有UI外观的Widget，如文本Text、Image都是"
                        "通过相应的RenderObject渲染出来的，如Text是由RenderParagraph渲染，"
                        "而Image是由RenderImage渲染。RenderObject是一个抽象类，它定义了一个抽象方法paint(...):\n\n"
                        "void paint(PaintingContext context, Offset offset)\n\n"
                        "PaintingContext代表Widget的绘制上下文，通过PaintingContext.canvas可以获得Canvas，"
                        "绘制逻辑主要是通过Canvas API来实现。子类需要实现此方法以实现自身的绘制逻辑，如RenderParagraph"
                        "需要实现文本绘制逻辑，而RenderImage需要实现图片绘制逻辑。\n\n"
                        "可以发现，RenderObject中最终也是通过Canvas来绘制的，那么通过实现RenderObject的方式和上面介绍"
                        "的通过CustomPaint和Canvas自绘的方式有什么区别？其实答案很简单，CustomPaint只是为了方便开发者"
                        "封装的一个代理类，它直接继承自SingleChildRenderObjectWidget，通过RenderCustomPaint的paint"
                        "方法将Canvas和画笔Painter(需要开发者实现，后面章节介绍)连接起来实现了最终的绘制（绘制逻辑在Painter中）。\n",
                    style: TextStyle(color: Colors.black,fontSize: 12)
                ),
              ),
              Text.rich(
                TextSpan(
                    text: "总结\n",
                    style: TextStyle(color: Colors.black,fontSize: 20)
                ),
              ),
              Text.rich(
                TextSpan(
                    text: "组合是自定义组件最简单的方法，在任何需要自定义的场景下，都应该优先考虑是否能够通过组合来实现。"
                        "而自绘和通过实现RenderObject的方法本质上是一样的，都需要开发者调用Canvas API手动去绘制UI，"
                        "缺点是必须了解Canvas API，并且得自己去实现绘制逻辑，而优点是强大灵活，理论上可以实现任何外观的UI。\n\n"
                        "在本章接下来的小节中，我们将通过一些实例来详细介绍自定义UI的过程，由于后两种方法本质是相同的，后续"
                        "我们只介绍CustomPaint和Canvas的方式，读者如果对自定义RenderObject的方法好奇，可以查看"
                        "RenderParagraph或RenderImage源码。\n"
                    ,
                    style: TextStyle(color: Colors.black,fontSize: 12)
                ),
              ),
            ],
          ),

        ),
      )),
    );
  }
}
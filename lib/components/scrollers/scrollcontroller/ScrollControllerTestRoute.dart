import 'package:flutter/material.dart';

/*
ScrollController
构造函数：

ScrollController({
  double initialScrollOffset = 0.0, //初始滚动位置
  this.keepScrollOffset = true,//是否保存滚动位置
  ...
})
我们介绍一下ScrollController常用的属性和方法：

offset：可滚动Widget当前滚动的位置。
jumpTo(double offset)、animateTo(double offset,...)：这两个方法用于跳转到指定的位置，
它们不同之处在于，后者在跳转时会执行一个动画，而前者不会。

滚动监听
ScrollController间接继承自Listenable，我们可以根据ScrollController来监听滚动事件。如：

controller.addListener(()=>print(controller.offset))
 */

class ScrollControllerTestRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=>ScrollControllerTestState();
}

class ScrollControllerTestState extends State<ScrollControllerTestRoute>{

  ScrollController _controller = new ScrollController();
  bool showToTopBtn = false; //是否显示“返回到顶部”按钮

  @override
  void initState() {
    //监听滚动事件，打印滚动位置
    _controller.addListener(() {
      print(_controller.offset); //打印滚动位置
      if (_controller.offset < 1000 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (_controller.offset >= 1000 && showToTopBtn == false) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  @override
  void dispose() {
    //为了避免内存泄露，需要调用_controller.dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("滚动控制")),
      body: Scrollbar(
        child: ListView.builder(
            itemCount: 100,
            itemExtent: 50.0, //列表项高度固定时，显式指定高度是一个好习惯(性能消耗小)
            controller: _controller,
            itemBuilder: (context, index) {
              return ListTile(title: Text("$index"),);
            }
        ),
      ),
      floatingActionButton: !showToTopBtn ? null : FloatingActionButton(
          child: Icon(Icons.arrow_upward),
          onPressed: () {
            //返回到顶部时执行动画
            _controller.animateTo(.0,
                duration: Duration(milliseconds: 1000),
                curve: Curves.bounceIn
            );
          }
      ),
    );
  }
}
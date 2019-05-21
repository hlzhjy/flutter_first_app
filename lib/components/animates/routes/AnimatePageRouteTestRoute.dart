import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'PageBTestRoute.dart';

class AnimatePageRouteTestRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("自定义路由动画"),
      ),
      body: Padding(padding: EdgeInsets.all(10),
        child: Wrap(
          spacing: 4.0,
          runSpacing: 4.0,
          alignment: WrapAlignment.center,
          children: <Widget>[
            RaisedButton(
              //Material库中提供了一个MaterialPageRoute，它可以使用和平台风格一致的路由切换动画，
              // 如在iOS上会左右滑动切换，而在Android上会上下滑动切换。
              child: Text("MaterialPageRoute",style:TextStyle(color: Colors.white),),
              color: Colors.blue,
              onPressed: (){
                Navigator.push(context,new MaterialPageRoute(builder: (context){
                  return new PageBTestRoute("MaterialPageRoute");
                }));
              },
            ),
            RaisedButton(
              //如果在Android上也想使用左右切换风格，可以直接使用CupertinoPageRoute,
              child: Text("CupertinoPageRoute",style:TextStyle(color: Colors.white),),
              color: Colors.blue,
              onPressed: (){
                Navigator.push(context,new CupertinoPageRoute(builder: (context){
                  return new PageBTestRoute("CupertinoPageRoute");
                }));
              },
            ),
            RaisedButton(
              //如果想自定义路由切换动画，可以使用PageRouteBuilder，例如我们想以渐隐渐入动画来实现路由过渡
              //我们可以看到pageBuilder 有一个animation参数，这是Flutter路由管理器提供的，在路由切换时
              // pageBuilder在每个动画帧都会被回调，因此我们可以通过animation对象来自定义过渡动画。
              child: Text("PageRouteBuilder实现-渐隐渐入动画",style:TextStyle(color: Colors.white),),
              color: Colors.blue,
              onPressed: (){
                Navigator.push(context,PageRouteBuilder(
                    transitionDuration: Duration(milliseconds: 500), //动画时间为500毫秒
                    pageBuilder: (BuildContext context, Animation animation,
                        Animation secondaryAnimation) {
                      return new FadeTransition( //使用渐隐渐入过渡,
                          opacity: animation,
                          child: PageBTestRoute("FadeTransition") //路由B
                      );
                    }));
              },
            ),
            RaisedButton(
              //如果想自定义路由切换动画，可以使用PageRouteBuilder，例如我们想以渐隐渐入动画来实现路由过渡
              child: Text("自定义FadeRoute实现-渐隐渐入动画",style:TextStyle(color: Colors.white),),
              color: Colors.blue,
              onPressed: (){
                Navigator.push(context,FadeRoute(builder: (context) {
                  return PageBTestRoute("自定义FadeRoute");
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}

/*
无论是MaterialPageRoute、CupertinoPageRoute，还是PageRouteBuilder，
它们都继承自PageRoute类，而PageRouteBuilder其实只是PageRoute的一个包装，
我们可以直接继承PageRoute类来实现自定义路由，上面的例子可以通过如下方式实现：

定义一个路由类FadeRoute
 */
class FadeRoute extends PageRoute {
  FadeRoute({
    @required this.builder,
    this.transitionDuration = const Duration(milliseconds: 300),
    this.opaque = true,
    this.barrierDismissible = false,
    this.barrierColor,
    this.barrierLabel,
    this.maintainState = true,
  });

  final WidgetBuilder builder;

  @override
  final Duration transitionDuration;

  @override
  final bool opaque;

  @override
  final bool barrierDismissible;

  @override
  final Color barrierColor;

  @override
  final String barrierLabel;

  @override
  final bool maintainState;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) => builder(context);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
      opacity: animation,
      child: builder(context),
    );
  }
}
import 'package:flutter/material.dart';

//Scaffold Widget，它是一个路由页的骨架，可以非常容易的拼装出一个完整的页面
//我们实现一个页面，它包含：

//一个导航栏
//导航栏右边有一个分享按钮
//有一个抽屉菜单
//有一个底部导航
//右下角有一个悬浮的动作按钮

class ScaffoldTestRoute extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => ScaffoldTestState();

}

class ScaffoldTestState extends State<ScaffoldTestRoute>
    with SingleTickerProviderStateMixin{

  TabController _tabController;//需要定义一个Controller
  List tabs = ["新闻","历史","图片"];

//  int _selectedIndex = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 创建Controller
    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController.addListener(() {
      switch(_tabController.index) {
        case 1: print("_tabController:1");break;
        case 2: print("_tabController:2");break;
        case 3: print("_tabController:3");break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
//        AppBar({
//        Key key,
//        this.leading, //导航栏最左侧Widget，常见为抽屉菜单按钮或返回按钮。
//        this.automaticallyImplyLeading = true, //如果leading为null，是否自动实现默认的leading按钮
//        this.title,// 页面标题
//        this.actions, // 导航栏右侧菜单
//        this.bottom, // 导航栏底部菜单，通常为Tab按钮组
//        this.elevation = 4.0, // 导航栏阴影
//        this.centerTitle, //标题是否居中
//        this.backgroundColor,
//        ...   //其它属性见源码注释
//        })
      appBar: AppBar(
        title: Text("App Name"),
        actions: <Widget>[ //导航栏右侧菜单
          IconButton(icon: Icon(Icons.share), onPressed:(){}),
        ],
        leading: Builder(builder: (context) {
                    return IconButton(
                            icon: Icon(Icons.dashboard),
                            color: Colors.white,
                            onPressed: () {
                              Scaffold.of(context).openDrawer();
                            }
                    );
                }),
        bottom: TabBar(//生成Tab菜单
            controller: _tabController,
            tabs: tabs.map((e) => Tab(text:e)).toList()
        ),
        backgroundColor: Colors.red,
      ),
      drawer: new MyDrawer(),//抽屉
      bottomNavigationBar:
//      BottomNavigationBar( //底部导航栏
//          items: <BottomNavigationBarItem>[
//            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
//            BottomNavigationBarItem(icon: Icon(Icons.business), title: Text('Business')),
//            BottomNavigationBarItem(icon: Icon(Icons.school), title: Text('School')),
//          ],
//        currentIndex: _selectedIndex,
//        fixedColor: Colors.blue,
//        onTap: _onItemTapped,
//      ),
        BottomAppBar(
          //BottomAppBar Widget，可以和FloatingActionButton配合实现这种"打洞"效果
          color: Colors.white,
          shape: CircularNotchedRectangle(), // 底部导航栏打一个圆形的洞
          child: Row(
            children: [
              IconButton(icon: Icon(Icons.school),
                onPressed: (){

                },
              ),
              IconButton(icon: Icon(Icons.home),
                  onPressed: (){

                  }),
              SizedBox(), //中间位置空出
              IconButton(icon: Icon(Icons.business),
                  onPressed: (){

                  }),
              IconButton(icon: Icon(Icons.local_hospital),
                  onPressed: (){

                  }),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceAround, //均分底部导航栏横向空间
          ),
        ),
      //打洞的位置取决于FloatingActionButton的位置，
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
          onPressed: _onAdd,
      ),
      body: TabBarView(//TabBarView组件，它可以很轻松的配合TabBar来实现同步切换和滑动状态同步
        controller: _tabController,
        children: tabs.map((e) { //创建3个Tab页
          return Container(
            alignment: Alignment.center,
            child: Text(e, textScaleFactor: 5),
          );
        }).toList(),
      ),
    );
  }

//  void _onItemTapped(int index){
//    setState(() {
//      _selectedIndex = index;
//    });
//  }

  void _onAdd(){

  }

}

class MyDrawer extends StatelessWidget{
  const MyDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        // DrawerHeader consumes top MediaQuery padding.
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ClipOval(
                      child: Image.asset(
                        "imgs/avatar.png",
                        width: 80,
                      ),
                    ),
                  ),
                  Text(
                    "Wendux",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.add),
                    title: const Text('Add account'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Manage accounts'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}

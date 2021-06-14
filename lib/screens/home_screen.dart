import 'package:flutter/material.dart';
import 'package:social_ui/data/data.dart';
import 'package:social_ui/widgets/custom_drawer.dart';
import 'package:social_ui/widgets/following_users.dart';
import 'package:social_ui/widgets/posts_carousel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        brightness: Brightness.light,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        title: Text(
          "FRENZY",
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              letterSpacing: 10.0,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        bottom: TabBar(
          controller: _tabController,
          indicatorWeight: 3.0,
          labelColor: Theme.of(context).primaryColor,
          labelStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0),
          unselectedLabelStyle: TextStyle(fontSize: 18.0),
          tabs: <Widget>[
            Tab(text: "Trending"),
            Tab(text: "Latest"),
          ],
        ),
      ),
      drawer: CustomDrawer(),
      body: ListView(
        children: <Widget>[
          FollowingUsers(),
          PostsCarousel(
              pageController: _pageController, title: "Posts", posts: posts),
        ],
      ),
    );
  }
}

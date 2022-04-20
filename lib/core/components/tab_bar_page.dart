import 'package:flutter/material.dart';
import 'package:kfcapp/core/constants/color_const.dart';
import 'package:kfcapp/screens/bag_page.dart';
import 'package:kfcapp/screens/history_page.dart';
import 'package:kfcapp/screens/home_page.dart';
import 'package:kfcapp/screens/profile_page.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({Key? key}) : super(key: key);

  @override
  State<TabBarPage> createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: [
          const HomePage(),
          const BagPage(),
          const HistoryPage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: tabBarim,
    );
  }

  TabBar get tabBarim => TabBar(
        controller: _tabController,
        labelColor: ColorConst.kPrimaryColor,
        unselectedLabelColor: Colors.grey,
        tabs: const [
          Tab(
            icon: Icon(Icons.home),
            text: "Home",
          ),
          Tab(
            icon: Icon(Icons.shopping_bag_outlined),
            text: "Bag",
          ),
          Tab(
            icon: Icon(Icons.receipt_long_outlined),
            text: "History",
          ),
          Tab(
            icon: Icon(Icons.person_outline_outlined),
            text: "Profile",
          ),
        ],
      );
}

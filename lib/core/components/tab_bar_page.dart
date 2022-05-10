import 'package:flutter/material.dart';
import 'package:kfcapp/core/constants/color_const.dart';
import 'package:kfcapp/screens/user/bag/bag_page.dart';
import 'package:kfcapp/screens/user/history/history_page.dart';
import 'package:kfcapp/screens/user/home/home_page.dart';
import 'package:kfcapp/screens/user/profile/profile_page.dart';
import 'package:kfcapp/service/user_bag_service.dart';

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
    UserBagService.writeToList();
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

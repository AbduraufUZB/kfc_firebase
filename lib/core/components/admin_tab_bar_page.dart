import 'package:flutter/material.dart';
import 'package:kfcapp/core/constants/color_const.dart';
import 'package:kfcapp/screens/admin/admin_home_page.dart';
import 'package:kfcapp/screens/admin/admin_order_page.dart';
import 'package:kfcapp/screens/admin/admin_update_page.dart';

class AdminTabBarPage extends StatefulWidget {
  const AdminTabBarPage({Key? key}) : super(key: key);

  @override
  State<AdminTabBarPage> createState() => _AdminTabBarPageState();
}

class _AdminTabBarPageState extends State<AdminTabBarPage>
    with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: const [
          AdminHomePage(),
          AdminOrderPage(),
          AdminUpdatePage()
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
            icon: Icon(Icons.local_shipping_outlined),
            text: "Order",
          ),
          Tab(
            icon: Icon(Icons.system_update_alt_outlined),
            text: "Update",
          ),
        ],
      );
}

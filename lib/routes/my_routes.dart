import 'package:flutter/material.dart';
import 'package:kfcapp/core/components/admin_tab_bar_page.dart';
import 'package:kfcapp/core/components/tab_bar_page.dart';
import 'package:kfcapp/screens/admin/update/add_food/add_food_page.dart';
import 'package:kfcapp/screens/admin/update/add_category/admin_add_category_page.dart';
import 'package:kfcapp/screens/admin/update/add_food/add_food_second_page.dart';
import 'package:kfcapp/screens/admin/update/delete_category/delete_category_page.dart';
import 'package:kfcapp/screens/admin/update/delete_food/delete_food_page.dart';
import 'package:kfcapp/screens/admin/update/delete_food/delete_food_second_page.dart';
import 'package:kfcapp/screens/page_not_found.dart';
import 'package:kfcapp/screens/user/home/category_info_page.dart';
import 'package:kfcapp/screens/user/home/category_page.dart';
import 'package:kfcapp/screens/user/home/home_page.dart';
import 'package:kfcapp/screens/sign_up/sign_up_sms_page.dart';
import 'package:kfcapp/screens/sign_up/signup_page.dart';
import 'package:kfcapp/screens/splash_page.dart';

class MyRoute {
  static final MyRoute _instance = MyRoute._init();
  static MyRoute get instance => _instance;
  MyRoute._init();

  Route? onGenerateRoute(RouteSettings s) {
    var args = s.arguments;

    switch (s.name) {
      case "/home":
        return MaterialPageRoute(builder: (ctx) => const HomePage());
      case "/tabbar":
        return MaterialPageRoute(builder: (ctx) => const TabBarPage());
      case "/signup":
        return MaterialPageRoute(builder: (ctx) => SignUpPage());
      case "/admin":
        return MaterialPageRoute(builder: (ctx) => const AdminTabBarPage());
      case "/splash":
        return MaterialPageRoute(builder: (ctx) => const SplashPage());
      case "/category":
        return MaterialPageRoute(builder: (ctx) => CategoryPage(index: args as int,));
      case "/sms":
        return MaterialPageRoute(
            builder: (ctx) => SignUpSmsPage(name: args as String));
      case "/add_category":
        return MaterialPageRoute(
            builder: ((context) => AdminAddCategoryPage()));
      case "/delete_category":
        return MaterialPageRoute(
            builder: ((context) => const DeleteCategoryPage()));
      case "/add_food":
        return MaterialPageRoute(builder: ((context) => const AddFoodPage()));
      case "/delete_food":
        return MaterialPageRoute(
            builder: ((context) => const DeleteFoodPage()));
      case "/add_food_sc":
        return MaterialPageRoute(
            builder: ((context) => AddFoodScPage(index_current: args as int,)));
      case "/info":
        return MaterialPageRoute(builder: (context) => CategoryInfoPage(son: args as List,));
      case "/delete_food_sc":
        return MaterialPageRoute(builder: (context) => DeleteFoodSecondPage(index: args as int));
      default:
        return MaterialPageRoute(
            builder: (context) => const PageNotFoundPage());
    }
  }
}

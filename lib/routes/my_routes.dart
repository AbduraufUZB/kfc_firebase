import 'package:flutter/material.dart';
import 'package:kfcapp/core/components/admin_tab_bar_page.dart';
import 'package:kfcapp/core/components/tab_bar_page.dart';
import 'package:kfcapp/screens/admin/admin_add_category_page.dart';
import 'package:kfcapp/screens/home_page.dart';
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
      // case "/info":
      case "/splash":
        return MaterialPageRoute(builder: (ctx) => const SplashPage());
      case "/sms":
        return MaterialPageRoute(
            builder: (ctx) => SignUpSmsPage(name: args as String));
      case "/add_category":
        return MaterialPageRoute(builder: ((context) => AdminAddCategoryPage()));
    }
  }
}

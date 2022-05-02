import 'package:flutter/material.dart';
import 'package:kfcapp/widgets/my_container.dart';

class AdminUpdatePage extends StatelessWidget {
  const AdminUpdatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: MyContainer(text: "Add category", routeName: "/add_category",),
            ),
            const SizedBox(height: 30),
            Center(
              child: MyContainer(text: "Delete category", routeName: "/delete_category"),
            ),
            const SizedBox(height: 30),
            Center(
              child: MyContainer(text: "Add food", routeName: "/add_food"),
            ),
            const SizedBox(height: 30),
            Center(
              child: MyContainer(text: "Delete food", routeName: "/delete_food"),
            ),
          ],
        ),
      ),
    );
  }
}

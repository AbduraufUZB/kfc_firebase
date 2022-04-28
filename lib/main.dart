import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kfcapp/provider/set_state_provider.dart';
import 'package:kfcapp/provider/sign_up_page_provider.dart';
import 'package:kfcapp/routes/my_routes.dart';
import 'package:provider/provider.dart';
void main() async{
  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => SetStateProvider())),
        ChangeNotifierProvider(create: ((context) => SignUpPageProvider())),
      ],
      child: MyApp()),);
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KFC SHOP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: MyRoute.instance.onGenerateRoute,
      initialRoute: "/splash",
    );
  }
}

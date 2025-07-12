import 'package:flutter/material.dart';
import 'package:learn_machine/src/ui/view/create/create_page.dart';
import 'package:learn_machine/src/ui/view/home/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Api Crud',
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.homeRoute,
      theme: ThemeData(
        appBarTheme: AppBarTheme(elevation: 0, backgroundColor: Colors.white),
        scaffoldBackgroundColor: Colors.white,
      ),
      routes: {
        HomePage.homeRoute: (context) => HomePage(),
        CreatePage.createRoute: (context) => CreatePage(),
      },
    );
  }
}

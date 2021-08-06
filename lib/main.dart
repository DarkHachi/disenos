import 'package:flutter/material.dart';


import 'src/pages/sliver_list_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => SliverListPage(),
      },
    );
  }
}

import 'package:disenos/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/pages/launcher_page.dart';

void main() => runApp(
    ChangeNotifierProvider(create: (_) => ThemeChanger(3), child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return MaterialApp(
      theme: currentTheme,
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => LauncherPage(),
      },
    );
  }
}

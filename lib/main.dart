import 'package:flutter/material.dart';

import 'package:disenos/src/pages/emergency_page.dart';
// import 'package:disenos/src/pages/pinterest_page.dart';
// import 'package:disenos/src/labs/circular_progress_page.dart';
// import 'src/retos/cuadrado_animado_page.dart';
// import 'src/labs/circular_progress_page.dart';
// import 'package:disenos/src/pages/slideshow_page.dart';
// import 'package:disenos/src/pages/graficas_circulares_page.dart';
// import 'package:disenos/src/pages/animaciones_page.dart';
// import 'src/pages/animaciones_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => EmergencyPage(),
        // 'graficas': (BuildContext context) => GraficasCircularesPage(),
        // 'animacion': (BuildContext context) => AnimacionesPage(),
        // 'slideshow': (BuildContext context) => SlideshowPage(),
      },
    );
  }
}

import 'package:disenos/src/widgets/radial_progress_gradient.dart';
import 'package:flutter/material.dart';

class GraficasCircularesPage extends StatefulWidget {
  @override
  _GraficasCircularesPageState createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {
  double porcentaje = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: () {
            setState(() {
              porcentaje += 10;
              if (porcentaje > 100) {
                porcentaje = 0;
              }
            });
          }),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgress(
                porcentaje: porcentaje,
                colorPrimario: Colors.teal,
                colorSecundario: Colors.pink,
                colorFondo: Colors.purple,
              ),
              CustomRadialProgress(
                porcentaje: porcentaje,
                colorPrimario: Colors.purple,
                colorSecundario: Colors.teal,
                colorFondo: Colors.pink,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgress(
                porcentaje: porcentaje,
                colorPrimario: Colors.pink,
                colorSecundario: Colors.blue,
                colorFondo: Colors.teal,
              ),
              CustomRadialProgress(
                  porcentaje: porcentaje,
                  colorPrimario: Colors.purple,
                  colorSecundario: Colors.pink,
                  colorFondo: Colors.blue)
            ],
          ),
        ],
      ),
    );
  }
}

class CustomRadialProgress extends StatelessWidget {
  final Color colorPrimario;
  final Color colorSecundario;
  final Color colorFondo;
  const CustomRadialProgress({
    required this.porcentaje,
    required this.colorPrimario,
    required this.colorSecundario,
    required this.colorFondo,
  });

  final double porcentaje;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      child: RadialProgress(
        porcentaje: porcentaje,
        colorPrimario: this.colorPrimario,
        colorSecundario: this.colorSecundario,
        colorFondo: this.colorFondo,
        grosorPrimario: 10,
        grosorSecundario: 4,
      ),
    );
  }
}

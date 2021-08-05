import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final Color colorFondo;
  final double grosorPrimario;
  final double grosorSecundario;

  const RadialProgress(
      {@required this.porcentaje,
      this.colorPrimario = Colors.blue,
      this.colorSecundario = Colors.purple,
      this.colorFondo = Colors.grey,
      this.grosorPrimario = 10.0,
      this.grosorSecundario = 4.0});

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  late double porcentajeAnterior;

  @override
  void initState() {
    porcentajeAnterior = widget.porcentaje;
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 200));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0.0);
    final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;

    return AnimatedBuilder(
      animation: controller,
      // child: child,
      builder: (BuildContext context, Widget? child) {
        return Container(
          padding: EdgeInsets.all(10),
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _MiRadialProgressGradient(
                (widget.porcentaje - diferenciaAnimar) +
                    (diferenciaAnimar * controller.value),
                widget.colorPrimario,
                widget.colorSecundario,
                widget.colorFondo,
                widget.grosorPrimario,
                widget.grosorSecundario),
          ),
          // child: Text('${widget.porcentaje}'),
        );
      },
    );
  }
}

class _MiRadialProgressGradient extends CustomPainter {
  final porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final Color colorFondo;
  final double grosorPrimario;
  final double grosorSecundario;

  _MiRadialProgressGradient(
      this.porcentaje,
      this.colorPrimario,
      this.colorSecundario,
      this.colorFondo,
      this.grosorPrimario,
      this.grosorSecundario);

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = new Rect.fromCircle(center: Offset(0, 0), radius: 180);
    final Gradient gradiente =
        new RadialGradient(colors: <Color>[colorPrimario, colorSecundario]);

    //Circulo Completado
    final paint = new Paint()
      ..strokeWidth = grosorSecundario
      ..color = colorFondo
      ..style = PaintingStyle.stroke;

    final Offset center = new Offset(size.width * 0.5, size.height * 0.5);
    final double radio = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radio, paint);

    //Arco
    final paintArco = new Paint()
      ..strokeWidth = grosorPrimario
      ..strokeCap = StrokeCap.round
      // ..color = colorPrimario
      ..shader = gradiente.createShader(rect)
      ..style = PaintingStyle.stroke;
    //Parte que se llenara
    double arcAngle = 2 * pi * (porcentaje / 100);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radio), -pi / 2,
        arcAngle, false, paintArco);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

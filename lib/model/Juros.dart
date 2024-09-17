import 'dart:math';

class Juros {
  double _juros = 0.0;
  String _tipo = '';

  Juros.jurosSimples({double c = 0.0, double i = 0.0, double t = 0.0}) {
    _juros = c * i * t;
    _tipo = 'Juros Simples';
  }

  Juros.jurosCompostos() {
  }
}
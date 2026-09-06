import 'package:calculadora/data/models/calculadora.dart';
import 'package:calculadora/data/services/calculadora_service.dart';
import 'package:flutter/foundation.dart';

class CalculadoraViewmodel extends ChangeNotifier {
  final CalculadoraService _calculadoraService = CalculadoraService();
  final Calculadora _calculadora = Calculadora();

  Calculadora get data => _calculadora;

  set setNumero1(double n1) => {
    _calculadora.setNumero1 = n1,
    _calculadora.setResultado = "",
    notifyListeners(),
  };

  set setNumero2(double n2) => {
    _calculadora.setNumero2 = n2,
    _calculadora.setResultado = "",
    notifyListeners(),
  };

  set setOperacion(String operador) => {
    _calculadora.setOperacion = operador,
    _calculadora.setResultado = "",
    notifyListeners(),
  };

  set setResultado(String resultado) => {
    _calculadora.setResultado = resultado,
    notifyListeners(),
  };

  void calcular() {
    try {
      _calculadora.setResultado = _calculadoraService.calcular(_calculadora);

      _calculadora.setErrorMenssage = "";
    } on Exception catch (e) {
      _calculadora.setErrorMenssage = e.toString().replaceFirst(
        "Exception: ",
        "",
      );
    }
    notifyListeners();
  }

  void limpiar() {
    _calculadora.setNumero1 = 0;
    _calculadora.setNumero2 = 0;
    _calculadora.setResultado = "";
    _calculadora.setOperacion = "";
    _calculadora.setErrorMenssage = "";
    notifyListeners();
  }
}

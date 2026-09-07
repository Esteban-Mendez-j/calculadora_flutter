import 'dart:math';

import 'package:calculadora/data/models/calculadora.dart';

class CalculadoraService {
  String suma(double numero1, double numero2) {
    return (numero1 + numero2).toString();
  }

  String resta(double numero1, double numero2) {
    return (numero1 - numero2).toString();
  }

  String multiplicacion(double numero1, double numero2) {
    return (numero1 * numero2).toString();
  }

  String division(double numero1, double numero2) {
    if (numero2 == 0) throw Exception("No se puede dividir entre 0");
    return (numero1 / numero2).toString();
  }

  String modulo(double numero1, double numero2) {
    if (numero2 == 0) throw Exception("No se puede dividir entre 0");
    return (numero1 % numero2).toString();
  }

  String raiz(double numero1) {
    if (numero1 < 0) {
      throw Exception("No se puede sacarle raiz a numero negativos");
    }
    return sqrt(numero1).toString();
  }

  String potenciacion(double numero1, double numero2) {
    return pow(numero1, numero2).toString();
  }

  String logaritmo(double numero1) {
    return log(numero1).toString();
  }
  
  double _aRadianes(double grados) {
    return grados * (pi / 180);
  }

  String validarPrimos(double numero) {
    bool esPrimo = true;

    if (numero < 2) esPrimo = false;

    if (numero != 2 && (numero % 2 == 0)) esPrimo = false;

    for (int i = 3; i <= sqrt(numero); i += 2) {
      if (numero % i == 0) {
        esPrimo = false;
        break;
      }
    }

    return esPrimo
        ? "El numero $numero es Primo"
        : "El numero $numero NO es Primo";
  }

  String calcular(Calculadora calculadora) {
    if (calculadora.numero1.isNaN || calculadora.numero2.isNaN) {
      throw Exception("Complete los campos");
    }

    if (calculadora.operacion.isEmpty) {
      throw Exception("Seleccione el operador");
    }

    double n1 = calculadora.numero1;
    double n2 = calculadora.numero2;
    String resultado = "";

    switch (calculadora.operacion) {
      case "+":
        resultado = suma(n1, n2);
        break;
      case "-":
        resultado = resta(n1, n2);
        break;
      case "x":
        resultado = multiplicacion(n1, n2);
        break;
      case "÷":
        resultado = division(n1, n2);
        break;
      case "%":
        resultado = modulo(n1, n2);
        break;
      case "sqrt":
        resultado = raiz(n2);
        break;
      case "^":
        resultado = potenciacion(n1, n2);
        break;
      case "log":
        resultado = logaritmo(n2);
        break;
      case "primo":
        resultado = "${validarPrimos(n1)} y ${validarPrimos(n2)}";
        break;
      case "cos":
        double vCos = cos(_aRadianes(n2));
        if (vCos.abs() < 1e-10) vCos = 0;
        resultado = vCos.toString();
        break;

      case "sin":
        double vSin = sin(_aRadianes(n2));
        if (vSin.abs() < 1e-10) vSin = 0;
        resultado = vSin.toString();
        break;

      case "tan":
        if ((n2 % 180).abs() == 90) {
          throw Exception("La tangente de $n2° no está definida");
        }
        double vTan = tan(_aRadianes(n2));
        if (vTan.abs() < 1e-10) vTan = 0;
        resultado = vTan.toString();
        break;

      default:
        throw Exception("El operador ingresado no es valido");
          }

    return resultado;
  }
}

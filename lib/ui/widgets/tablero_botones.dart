import 'package:calculadora/ui/widgets/botones.dart';
import 'package:flutter/material.dart';

class TableroBotones extends StatelessWidget {
  final Function sendOperacion;
  final VoidCallback limpiar;
  final GlobalKey<FormState> formkey;

  const TableroBotones({
    super.key,
    required this.sendOperacion,
    required this.formkey,
    required this.limpiar,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8.0,
      children: [
        Row(
          spacing: 8.0,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Botones(operador: "C", onPressed: limpiar),
            Botones(
              operador: "%",
              onPressed: () => sendOperacion("%", formkey),
            ),
            Botones(
              operador: "÷",
              onPressed: () => sendOperacion("÷", formkey),
            ),
            Botones(
              operador: "x",
              onPressed: () => sendOperacion("x", formkey),
            ),
          ],
        ),

        Row(
          spacing: 8.0,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Botones(
              operador: "+",
              onPressed: () => sendOperacion("+", formkey),
            ),
            Botones(
              operador: "-",
              onPressed: () => sendOperacion("-", formkey),
            ),
            Botones(
              operador: "^",
              onPressed: () => sendOperacion("^", formkey),
            ),
            Botones(
              operador: "log",
              onPressed: () => sendOperacion("log", formkey),
            ),
          ],
        ),

        Row(
          spacing: 8.0,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Botones(
              operador: "primos",
              onPressed: () => sendOperacion("primo", formkey),
            ),
            Botones(
              operador: "sqrt",
              onPressed: () => sendOperacion("sqrt", formkey),
            ),
          ],
        ),
        Row(
          spacing: 8.0,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Botones(
              operador: "sin",
              onPressed: () => sendOperacion("sin", formkey),
            ),
            Botones(
              operador: "cos",
              onPressed: () => sendOperacion("cos", formkey),
            ),
            Botones(
              operador: "tan",
              onPressed: () => sendOperacion("tan", formkey),
            ),
          ],
        ),
      ],
    );
  }
}

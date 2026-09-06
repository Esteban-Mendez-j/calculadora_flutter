import 'package:calculadora/ui/views_models/calculadora_viewmodel.dart';
import 'package:calculadora/ui/widgets/calculadora_form.dart';
import 'package:calculadora/ui/widgets/tablero_botones.dart';
import 'package:calculadora/ui/widgets/tarjeta_resultado.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalculadoraView extends StatefulWidget {
  const CalculadoraView({super.key});

  @override
  State<CalculadoraView> createState() => _CalculadoraView();
}

class _CalculadoraView extends State<CalculadoraView> {
  final TextEditingController _controllerN1 = TextEditingController();
  final TextEditingController _controllerN2 = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final colorPrimario = Colors.white;
  final colorSecundario = Colors.blue;

  @override
  Widget build(BuildContext context) {
    final CalculadoraViewmodel calculadoraViewmodel = context
        .read<CalculadoraViewmodel>();

    void limpiar() {
      calculadoraViewmodel.limpiar();
      _controllerN1.text = "";
      _controllerN2.text = "";
    }

    void sendOperacion(String operador, GlobalKey<FormState> formkey) {
      if (formkey.currentState!.validate()) {
        calculadoraViewmodel.setOperacion = operador;
        calculadoraViewmodel.calcular();
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorSecundario,
        title: Row(
          children: [
            Icon(Icons.calculate, color: colorPrimario),
            SizedBox(width: 10),
            Text("Calculadora", style: TextStyle(color: colorPrimario)),
          ],
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Column(
              spacing: 10.0,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CalculadoraForm(
                  formKey: formKey,
                  controllerN1: _controllerN1,
                  controllerN2: _controllerN2,
                ),
                TarjetaResultado(
                  colorPrimario: colorPrimario,
                  colorsecundario: colorSecundario,
                ),
                TableroBotones(
                  sendOperacion: sendOperacion,
                  formkey: formKey,
                  limpiar: limpiar,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

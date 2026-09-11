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

  @override
  void dispose() {
    _controllerN1.dispose();
    _controllerN2.dispose();
    super.dispose();
  }

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
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 16,
            ),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 480),
              child: Column(
                children: [
                  CalculadoraForm(
                    formKey: formKey,
                    controllerN1: _controllerN1,
                    controllerN2: _controllerN2,
                  ),
                  const SizedBox(height: 14),
                  const TarjetaResultado(),
                  const SizedBox(height: 16),
                  TableroBotones(
                    sendOperacion: sendOperacion,
                    formkey: formKey,
                    limpiar: limpiar,
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

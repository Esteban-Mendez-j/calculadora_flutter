import 'package:calculadora/ui/views_models/calculadora_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class CalculadoraForm extends StatelessWidget {
  final GlobalKey<FormState> _formKey;
  final TextEditingController _controllerN1;
  final TextEditingController _controllerN2;

  const CalculadoraForm({
    super.key,
    required this._formKey,
    required this._controllerN1,
    required this._controllerN2,
  });

  @override
  Widget build(BuildContext context) {
    final CalculadoraViewmodel operacionWatch = context
        .watch<CalculadoraViewmodel>();

    final CalculadoraViewmodel calculadoraViewmodel = context
        .read<CalculadoraViewmodel>();

    final esOperacionUnitaria = [
      "sqrt",
      "log",
      "cos",
      "sin",  
      "tan"
    ].contains(operacionWatch.data.operacion);

    return Form(
      key: _formKey,
      child: Column(
        children: [
          if (!esOperacionUnitaria)
            TextFormField(
              controller: _controllerN1,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^-?\d*\.?\d*')),
              ],
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Debes ingresar un numero";
                }
                return null;
              },
              onChanged: (value) => {
                calculadoraViewmodel.setNumero1 = value.isEmpty
                    ? 0
                    : double.parse(value),
                if (_formKey.currentState!.validate())
                  calculadoraViewmodel.calcular(),
              },
              decoration: InputDecoration(
                labelText: "Primer Numero",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
          SizedBox(height: 10),
          TextFormField(
            controller: _controllerN2,
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return "Debes ingresar un numero";
              }
              if (value.trim() == "0" &&
                  ["%", "÷"].contains(operacionWatch.data.operacion)) {
                return "No se puede dividir entre 0";
              }
              return null;
            },
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^-?\d*\.?\d*')),
            ],
            onChanged: (value) => {
              calculadoraViewmodel.setNumero2 = value.isEmpty
                  ? 0
                  : double.parse(value),
              if (_formKey.currentState!.validate())
                calculadoraViewmodel.calcular(),
            },
            decoration: InputDecoration(
              labelText: esOperacionUnitaria ? "Numero" : "Segundo Numero",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

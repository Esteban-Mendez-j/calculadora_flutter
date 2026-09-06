import 'package:calculadora/ui/views_models/calculadora_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TarjetaResultado extends StatelessWidget {
  final Color colorPrimario;
  final Color colorsecundario;

  const TarjetaResultado({
    super.key,
    required this.colorPrimario,
    required this.colorsecundario,
  });

  @override
  Widget build(BuildContext context) {
    final CalculadoraViewmodel calculadoraViewmodelWatch = context
        .watch<CalculadoraViewmodel>();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border(bottom: BorderSide(color: colorPrimario, width: 4)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 10,
            spreadRadius: 1,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Text(
            'Operacion',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            calculadoraViewmodelWatch.data.errorMenssage.isNotEmpty
                ? calculadoraViewmodelWatch.data.errorMenssage
                : calculadoraViewmodelWatch.data.toString(),
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: colorsecundario,
            ),
          ),
        ],
      ),
    );
  }
}

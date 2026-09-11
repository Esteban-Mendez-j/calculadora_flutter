import 'package:calculadora/ui/views_models/calculadora_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class CalculadoraForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController controllerN1;
  final TextEditingController controllerN2;

  const CalculadoraForm({
    super.key,
    required this.formKey,
    required this.controllerN1,
    required this.controllerN2,
  });

  @override
  Widget build(BuildContext context) {
    final CalculadoraViewmodel operacionWatch =
        context.watch<CalculadoraViewmodel>();
    final CalculadoraViewmodel calculadoraViewmodel =
        context.read<CalculadoraViewmodel>();

    final esOperacionUnitaria = [
      "sqrt",
      "log",
      "fib",
      "parimpar",
      "cos",
      "sin",
      "tan",
    ].contains(operacionWatch.data.operacion);

    return Form(
      key: formKey,
      child: Column(
        children: [
          if (!esOperacionUnitaria) ...[
            _buildInputCard(
              label: "PRIMER NÚMERO",
              badge: "Valor A",
              cardBgColor: const Color(0xFFFAF5FF),
              cardBorderColor: const Color(0xFFDDD6FE),
              labelColor: const Color(0xFF6D28D9),
              badgeBgColor: const Color(0xFFEDE9FE),
              badgeTextColor: const Color(0xFF7C3AED),
              child: TextFormField(
                controller: controllerN1,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                  signed: true,
                ),
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF3B0764),
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^-?\d*\.?\d*')),
                ],
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Debes ingresar un número";
                  }
                  return null;
                },
                onChanged: (value) {
                  calculadoraViewmodel.setNumero1 = value.isEmpty
                      ? 0
                      : double.tryParse(value) ?? 0;
                  if (formKey.currentState!.validate()) {
                    calculadoraViewmodel.calcular();
                  }
                },
                decoration: const InputDecoration(
                  hintText: "0",
                  hintStyle: TextStyle(
                    color: Color(0xFFA78BFA),
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.only(top: 8),
                ),
              ),
            ),
            const SizedBox(height: 12),
          ],
          _buildInputCard(
            label: esOperacionUnitaria ? "NÚMERO" : "SEGUNDO NÚMERO",
            badge: esOperacionUnitaria ? "Valor" : "Valor B",
            cardBgColor: const Color(0xFFF0FDF4),
            cardBorderColor: const Color(0xFFA7F3D0),
            labelColor: const Color(0xFF047857),
            badgeBgColor: const Color(0xFFD1FAE5),
            badgeTextColor: const Color(0xFF059669),
            child: TextFormField(
              controller: controllerN2,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
                signed: true,
              ),
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Color(0xFF064E3B),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Debes ingresar un número";
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
              onChanged: (value) {
                calculadoraViewmodel.setNumero2 = value.isEmpty
                    ? 0
                    : double.tryParse(value) ?? 0;
                if (formKey.currentState!.validate()) {
                  calculadoraViewmodel.calcular();
                }
              },
              decoration: const InputDecoration(
                hintText: "0",
                hintStyle: TextStyle(
                  color: Color(0xFF6EE7B7),
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.only(top: 8),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputCard({
    required String label,
    required String badge,
    required Color cardBgColor,
    required Color cardBorderColor,
    required Color labelColor,
    required Color badgeBgColor,
    required Color badgeTextColor,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: cardBgColor,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: cardBorderColor, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: labelColor.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: labelColor,
                  letterSpacing: 0.8,
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                decoration: BoxDecoration(
                  color: badgeBgColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  badge,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: badgeTextColor,
                  ),
                ),
              ),
            ],
          ),
          child,
        ],
      ),
    );
  }
}


import 'package:calculadora/ui/views_models/calculadora_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class TarjetaResultado extends StatelessWidget {
  final Color? colorPrimario;
  final Color? colorsecundario;

  const TarjetaResultado({super.key, this.colorPrimario, this.colorsecundario});

  String _formatNumber(double num) {
    if (num % 1 == 0) {
      return num.toInt().toString();
    }
    return num.toString();
  }

  @override
  Widget build(BuildContext context) {
    final CalculadoraViewmodel calculadoraViewmodelWatch = context
        .watch<CalculadoraViewmodel>();
    final data = calculadoraViewmodelWatch.data;

    String expresion = "";
    if (data.operacion.isEmpty) {
      expresion = "0 + 0";
    } else if ([
      "sqrt",
      "log",
      "fib",
      "parimpar",
      "cos",
      "sin",
      "tan",
    ].contains(data.operacion)) {
      final opName = data.operacion == "parimpar"
          ? "par/impar"
          : data.operacion;
      expresion = "$opName(${_formatNumber(data.numero2)})";
    } else {
      expresion =
          "${_formatNumber(data.numero1)} ${data.operacion} ${_formatNumber(data.numero2)}";
    }

    final bool hasError = data.errorMenssage.isNotEmpty;
    final String displayResult = hasError
        ? data.errorMenssage
        : data.resultado.isNotEmpty
        ? data.resultado
        : "0";

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFDF5),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFFDE68A), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFD97706).withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Color(0xFFD97706),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'OPERACIÓN',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFB45309),
                      letterSpacing: 0.8,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEA580C),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFEA580C)
                              .withValues(alpha: 0.25),
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Text(
                      expresion,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: () {
                      Clipboard.setData(ClipboardData(text: displayResult));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Resultado "$displayResult" copiado al portapapeles',
                          ),
                          duration: const Duration(seconds: 2),
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      );
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: const Color(0xFFFCD34D),
                          width: 1.2,
                        ),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.copy_rounded,
                            size: 14,
                            color: Color(0xFFD97706),
                          ),
                          SizedBox(width: 4),
                          Text(
                            'Copiar',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFD97706),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(color: Color(0xFFFEF3C7), height: 1),
          const SizedBox(height: 14),

          Align(
            alignment: Alignment.centerRight,
            child: Text(
              hasError ? displayResult : "= $displayResult",
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: hasError ? 16 : 20,
                fontWeight: FontWeight.w800,
                color: hasError
                    ? const Color(0xFFDC2626)
                    : const Color(0xFF0F172A),
                letterSpacing: -0.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

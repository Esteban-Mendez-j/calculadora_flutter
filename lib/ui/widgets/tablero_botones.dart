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
    const double gap = 10.0;
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Botones(
                operador: "C",
                isAlert: true,
                bgColor: const Color(0xFFFFE4E6),
                textColor: const Color(0xFFE11D48),
                borderColor: const Color(0xFFFDA4AF),
                onPressed: limpiar,
              ),
            ),
            const SizedBox(width: gap),
            Expanded(
              child: Botones(
                operador: "%",
                bgColor: const Color(0xFFDCFCE7),
                textColor: const Color(0xFF15803D),
                borderColor: const Color(0xFF86EFAC),
                onPressed: () => sendOperacion("%", formkey),
              ),
            ),
            const SizedBox(width: gap),
            Expanded(
              child: Botones(
                operador: "÷",
                bgColor: const Color(0xFFE0F2FE),
                textColor: const Color(0xFF0284C7),
                borderColor: const Color(0xFF7DD3FC),
                onPressed: () => sendOperacion("÷", formkey),
              ),
            ),
            const SizedBox(width: gap),
            Expanded(
              child: Botones(
                operador: "X",
                bgColor: const Color(0xFFFEF3C7),
                textColor: const Color(0xFFD97706),
                borderColor: const Color(0xFFFCD34D),
                onPressed: () => sendOperacion("x", formkey),
              ),
            ),
          ],
        ),
        const SizedBox(height: gap),

        Row(
          children: [
            Expanded(
              child: Botones(
                operador: "+",
                bgColor: const Color(0xFFEDE9FE),
                textColor: const Color(0xFF7C3AED),
                borderColor: const Color(0xFFC4B5FD),
                onPressed: () => sendOperacion("+", formkey),
              ),
            ),
            const SizedBox(width: gap),
            Expanded(
              child: Botones(
                operador: "-",
                bgColor: const Color(0xFFFCE7F3),
                textColor: const Color(0xFFDB2777),
                borderColor: const Color(0xFFF9A8D4),
                onPressed: () => sendOperacion("-", formkey),
              ),
            ),
            const SizedBox(width: gap),
            Expanded(
              child: Botones(
                operador: "^",
                bgColor: const Color(0xFFE0E7FF),
                textColor: const Color(0xFF4F46E5),
                borderColor: const Color(0xFFA5B4FC),
                onPressed: () => sendOperacion("^", formkey),
              ),
            ),
            const SizedBox(width: gap),
            Expanded(
              child: Botones(
                operador: "log",
                bgColor: const Color(0xFFCCFBF1),
                textColor: const Color(0xFF0D9488),
                borderColor: const Color(0xFF5EEAD4),
                onPressed: () => sendOperacion("log", formkey),
              ),
            ),
          ],
        ),
        const SizedBox(height: gap),

        Row(
          children: [
            Expanded(
              child: Botones(
                operador: "primos",
                bgColor: const Color(0xFFFEF9C3),
                textColor: const Color(0xFFCA8A04),
                borderColor: const Color(0xFFFDE047),
                onPressed: () => sendOperacion("primo", formkey),
              ),
            ),
            const SizedBox(width: gap),
            Expanded(
              child: Botones(
                operador: "sqrt",
                isMonospace: true,
                bgColor: const Color(0xFFDBEAFE),
                textColor: const Color(0xFF2563EB),
                borderColor: const Color(0xFF93C5FD),
                onPressed: () => sendOperacion("sqrt", formkey),
              ),
            ),
            const SizedBox(width: gap),
            Expanded(
              child: Botones(
                operador: "fib",
                bgColor: const Color(0xFFECFCCB),
                textColor: const Color(0xFF65A30D),
                borderColor: const Color(0xFFBEF264),
                onPressed: () => sendOperacion("fib", formkey),
              ),
            ),
          ],
        ),
        const SizedBox(height: gap),

        // Fila 4: sin (Naranja melocotón), cos (Lavanda / Púrpura), tan (Fresa / Rojo cereza)
        Row(
          children: [
            Expanded(
              child: Botones(
                operador: "sin",
                bgColor: const Color(0xFFFFEDD5),
                textColor: const Color(0xFFEA580C),
                borderColor: const Color(0xFFFDBA74),
                onPressed: () => sendOperacion("sin", formkey),
              ),
            ),
            const SizedBox(width: gap),
            Expanded(
              child: Botones(
                operador: "cos",
                bgColor: const Color(0xFFF3E8FF),
                textColor: const Color(0xFF9333EA),
                borderColor: const Color(0xFFD8B4FE),
                onPressed: () => sendOperacion("cos", formkey),
              ),
            ),
            const SizedBox(width: gap),
            Expanded(
              child: Botones(
                operador: "tan",
                bgColor: const Color(0xFFFFE4E6),
                textColor: const Color(0xFFBE123C),
                borderColor: const Color(0xFFFDA4AF),
                onPressed: () => sendOperacion("tan", formkey),
              ),
            ),
          ],
        ),
        const SizedBox(height: gap),

        // Fila 5: par / impar (Índigo vibrante con icono)
        SizedBox(
          width: double.infinity,
          child: Botones(
            operador: "par / impar",
            isPrimary: true,
            bgColor: const Color(0xFF6366F1),
            textColor: Colors.white,
            icon: Icons.swap_vert,
            onPressed: () => sendOperacion("parimpar", formkey),
          ),
        ),
      ],
    );
  }
}

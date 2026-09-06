import 'package:flutter/material.dart';

class Botones extends StatelessWidget {
  final String operador;
  final VoidCallback onPressed;

  const Botones({super.key, required this.operador, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFE0E7FF),
        foregroundColor: const Color(0xFF0047CC),
        elevation: 2,
        shadowColor: Colors.black26,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: Text(
        operador,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
      ),
    );
  }
}

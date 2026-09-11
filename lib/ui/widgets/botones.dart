import 'package:flutter/material.dart';

class Botones extends StatelessWidget {
  final String operador;
  final VoidCallback onPressed;
  final bool isAlert;
  final bool isPrimary;
  final bool isMonospace;
  final IconData? icon;
  final double height;
  final Color? bgColor;
  final Color? textColor;
  final Color? borderColor;

  const Botones({
    super.key,
    required this.operador,
    required this.onPressed,
    this.isAlert = false,
    this.isPrimary = false,
    this.isMonospace = false,
    this.icon,
    this.height = 54,
    this.bgColor,
    this.textColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color foregroundColor;
    BorderSide borderSide;

    if (bgColor != null && textColor != null) {
      backgroundColor = bgColor!;
      foregroundColor = textColor!;
      borderSide = borderColor != null
          ? BorderSide(color: borderColor!, width: 1.3)
          : BorderSide.none;
    } else if (isAlert) {
      backgroundColor = const Color(0xFFFFE4E6);
      foregroundColor = const Color(0xFFE11D48);
      borderSide = const BorderSide(color: Color(0xFFFDA4AF), width: 1.3);
    } else if (isPrimary) {
      backgroundColor = const Color(0xFF6366F1);
      foregroundColor = Colors.white;
      borderSide = BorderSide.none;
    } else {
      backgroundColor = const Color(0xFFF0F6FF);
      foregroundColor = const Color(0xFF0052CC);
      borderSide = const BorderSide(color: Color(0xFFD6E4FF), width: 1.3);
    }

    return SizedBox(
      height: height,
      child: Material(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(16),
          splashColor: foregroundColor.withValues(alpha: 0.18),
          highlightColor: foregroundColor.withValues(alpha: 0.08),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.fromBorderSide(borderSide),
              boxShadow: isPrimary
                  ? [
                      BoxShadow(
                        color: const Color(0xFF6366F1).withValues(alpha: 0.35),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ]
                  : [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.02),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (icon != null) ...[
                    Icon(icon, color: foregroundColor, size: 20),
                    const SizedBox(width: 8),
                  ],
                  Text(
                    operador,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: isMonospace ? 19 : 18,
                      fontWeight: (isAlert || isPrimary || isMonospace)
                          ? FontWeight.w700
                          : FontWeight.w600,
                      fontFamily: isMonospace ? 'monospace' : null,
                      color: foregroundColor,
                      letterSpacing: isMonospace ? 1.0 : 0.2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


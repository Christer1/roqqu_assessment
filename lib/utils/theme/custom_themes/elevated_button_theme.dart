import 'package:flutter/material.dart';

class RElevatedButtonTheme {
  RElevatedButtonTheme._(); // to avoid creating instances

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ButtonStyle(
      elevation: WidgetStateProperty.all(0),
      padding: WidgetStateProperty.all(
        const EdgeInsets.symmetric(vertical: 18),
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      backgroundColor: WidgetStateProperty.resolveWith<Color?>(
        (states) {
          return Colors.transparent;
        },
      ),
      foregroundColor: WidgetStateProperty.all(Colors.white),
      textStyle: WidgetStateProperty.all(
        const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      // Add gradient overlay
      overlayColor: WidgetStateProperty.all(Colors.transparent),

    ),
  );

  static Widget gradientButton({
    required VoidCallback? onPressed,
    required String text,
  }) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF483BEB),
            Color(0xFF7847E1),
            Color(0xFFDD568D),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: darkElevatedButtonTheme.style,
        child: Center(child: Text(text)),
      ),
    );
  }
}

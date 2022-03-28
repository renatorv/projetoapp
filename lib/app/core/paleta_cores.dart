import 'package:flutter/material.dart';

class PaletaCores {
  static const Color azulFacebook = Color(0xFF1777F2);
  static const Color scaffold = Color(0xFFF0F2F5);
  static const Color principal = Color(0xFFF5591F);
  static const Color principalSecundaria = Color(0xFFF59314);
  static const LinearGradient degradeEstoria = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Colors.transparent,
      Colors.black54,
    ],
  );
  static const LinearGradient degradePerfil = LinearGradient(
    colors: [
      Colors.white24,
      PaletaCores.principalSecundaria,
      PaletaCores.principal,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}

import 'package:flutter/material.dart';

class InstapetAppbar extends AppBar {
  InstapetAppbar({
    Key? key,
    double elevation = 4,
  }) : super(
          key: key,
          backgroundColor: Colors.white,
          elevation: elevation,
          centerTitle: true,
          title: const Text(
            'InstaPet',
            style: TextStyle(
              fontFamily: 'IndieFlower',
              letterSpacing: 2.5,
              fontWeight: FontWeight.bold,
              fontSize: 62,
            ),
          ),
          iconTheme: const IconThemeData(color: Colors.black),
        );
}

// configuração da imagem, dia 1 1 hora e 07 minutos
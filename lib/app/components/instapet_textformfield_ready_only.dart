import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:projetoapp/app/core/core.dart';

class InstapetTextformfieldReadyOnly extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChange;
  final bool readyOnly;

  const InstapetTextformfieldReadyOnly({
    Key? key,
    required this.label,
    this.controller,
    this.validator,
    this.onChange,
    this.obscureText = false,
    this.readyOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      onChanged: onChange,
      cursorColor: context.theme.primaryColor,
      decoration: InputDecoration(
        isDense: true,
        labelStyle: const TextStyle(color: Colors.black),
        errorStyle: const TextStyle(color: Colors.redAccent),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(23),

          /// (!) quando é feita essa chamada ele "pode"
          /// não existir, pois existe uma lista padrão das e pode ocorrer de ser passado um valor fora dessa lista.
          borderSide: BorderSide(color: Colors.grey[400]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(23),
          borderSide: BorderSide(color: Colors.grey[400]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(23),
          borderSide: BorderSide(color: Colors.grey[400]!),
        ),
        filled: true,
        fillColor: PaletaCores.scaffold,
      ),
    );
  }
}

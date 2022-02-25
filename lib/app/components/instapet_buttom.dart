import 'package:flutter/material.dart';

class InstapetButtom extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final double? width;
  final double? height;
  final Color? color;
  final Color? fontColor;

  const InstapetButtom({
    Key? key,
    required this.label,
    required this.onPressed,
    this.width,
    this.height = 50,
    this.color,
    this.fontColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: fontColor,
          ),
        ),
        style: ElevatedButton.styleFrom(
          shape: StadiumBorder(),
          primary: color,
        ),
      ),
    );
  }
}

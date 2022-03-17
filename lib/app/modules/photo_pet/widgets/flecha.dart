import 'package:flutter/material.dart';
import 'package:progress_stepper/progress_stepper.dart';

import '../../../core/core.dart';

class Flecha extends StatelessWidget {
  const Flecha({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    final Responsive _responsive = Responsive(context);
    return ProgressStepWithArrow(
      width: _responsive.dp(14.2),
      defaultColor: PaletaCores.scaffold,
      progressColor: PaletaCores.scaffold,
      wasCompleted: true,
      child: Center(
        child: Container(
          margin: EdgeInsets.only(top: 4.5, bottom: 4.5),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.bold,
              fontSize: _responsive.dp(1.6),
            ),
          ),
        ),
      ),
    );
  }
}

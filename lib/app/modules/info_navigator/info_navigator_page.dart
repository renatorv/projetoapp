import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/core.dart';
import './info_navigator_controller.dart';

class InfoNavigatorPage extends StatefulWidget {
  const InfoNavigatorPage({Key? key}) : super(key: key);

  @override
  State<InfoNavigatorPage> createState() => _InfoNavigatorPageState();
}

class _InfoNavigatorPageState
    extends InstaState<InfoNavigatorPage, InfoNavigatorController> {
  @override
  Widget build(BuildContext context) {
    final Responsive _responsive = Responsive(context);
    return GetBuilder<InfoNavigatorController>(
      builder: (_) => Stack(
        children: [
          Positioned(
            left: _responsive.dp(4.2),
            child: controller.imagem != null
                ? CircleAvatar(
                    radius: 80,
                    backgroundColor: PaletaCores.principal,
                    child: CircleAvatar(
                      backgroundImage: FileImage(
                        File(controller.imagem!),
                      ),
                      radius: 70,
                    ),
                  )
                : CircularProgressIndicator(
                    color: PaletaCores.principal,
                  ),
          ),
          Positioned(
            top: _responsive.dp(8),
            right: _responsive.dp(4.2),
            child: controller.imagem != null
                ? CircleAvatar(
                    radius: 80,
                    backgroundColor: PaletaCores.principal,
                    child: CircleAvatar(
                      backgroundImage: FileImage(
                        File(controller.imagem!),
                      ),
                      radius: 70,
                    ),
                  )
                : CircularProgressIndicator(
                    color: PaletaCores.principal,
                  ),
          ),
          Positioned(
            top: _responsive.dp(36),
            right: _responsive.dp(5),
            left: _responsive.dp(5),
            child: Container(
              padding: EdgeInsets.all(_responsive.dp(1)),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 5,
                  color: Colors.grey, // red as border color
                ),
              ),
              child:
                  Text("Sou um cãozinho tímido, mas que conquista corações!"),
            ),
          )
        ],
      ),
      // builder: (_) => Column(
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: [
      //     Container(
      //       padding: EdgeInsets.only(right: _responsive.dp(8)),
      //       child: controller.imagem != null
      //           ? CircleAvatar(
      //               radius: 60,
      //               backgroundColor: PaletaCores.principal,
      //               child: CircleAvatar(
      //                 backgroundImage: FileImage(
      //                   File(controller.imagem!),
      //                 ),
      //                 radius: 50,
      //               ),
      //             )
      //           : CircularProgressIndicator(
      //               color: PaletaCores.principal,
      //             ),
      //     ),
      //     Container(
      //       padding: EdgeInsets.only(left: _responsive.dp(8)),
      //       child: controller.imagem != null
      //           ? CircleAvatar(
      //               radius: 60,
      //               backgroundColor: PaletaCores.principal,
      //               child: CircleAvatar(
      //                 backgroundImage: FileImage(
      //                   File(controller.imagem!),
      //                 ),
      //                 radius: 50,
      //               ),
      //             )
      //           : CircularProgressIndicator(
      //               color: PaletaCores.principal,
      //             ),
      //     ),
      //   ],
      // ),
    );
  }
}

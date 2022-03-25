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
            top: _responsive.dp(32),
            right: _responsive.dp(5),
            left: _responsive.dp(5),
            child: Container(
              padding: EdgeInsets.all(_responsive.dp(1)),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 6,
                  color: PaletaCores.scaffold,
                ),
              ),
              child: Text(
                "Sou um cãozinho tímido, mas que conquista corações!",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            top: _responsive.dp(43),
            right: _responsive.dp(5),
            left: _responsive.dp(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Container(
                //   height: _responsive.dp(6),
                //   width: _responsive.dp(26),
                //   decoration: BoxDecoration(
                //     border: Border.all(
                //       color: Colors.grey.shade300,
                //     ),
                //     borderRadius: BorderRadius.circular(10.0),
                //   ),
                //   child: Center(
                //     child: Text(
                //       'Beagle',
                //       style: TextStyle(
                //         fontSize: _responsive.dp(2.8),
                //       ),
                //     ),
                //   ),
                // ),
                // SizedBox(height: _responsive.dp(1)),
                // Container(
                //   height: _responsive.dp(6),
                //   width: _responsive.dp(26),
                //   decoration: BoxDecoration(
                //     border: Border.all(
                //       color: Colors.grey.shade300,
                //     ),
                //     borderRadius: BorderRadius.circular(10.0),
                //   ),
                //   child: Center(
                //     child: Text(
                //       'Masculino',
                //       style: TextStyle(
                //         fontSize: _responsive.dp(2.8),
                //       ),
                //     ),
                //   ),
                // ),
                // ClipRRect(
                //   borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                //   child: Container(
                //     height: _responsive.dp(7),
                //     width: _responsive.dp(30),
                //     padding: const EdgeInsets.all(16.0),
                //     decoration: BoxDecoration(
                //       border: Border(
                //         left: BorderSide(
                //           width: 8.0,
                //           color: PaletaCores.principal,
                //         ),
                //         right: BorderSide(
                //           width: 8.0,
                //           color: PaletaCores.principal,
                //         ),
                //       ),
                //     ),
                //     child: Center(child: Text('Beagle')),
                //   ),
                // ),
                // ClipRRect(
                //   borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                //   child: Container(
                //     height: _responsive.dp(7),
                //     width: _responsive.dp(30),
                //     padding: const EdgeInsets.all(16.0),
                //     decoration: BoxDecoration(
                //       border: Border(
                //         left: BorderSide(
                //           width: 8.0,
                //           color: PaletaCores.principal,
                //         ),
                //         right: BorderSide(
                //           width: 8.0,
                //           color: PaletaCores.principal,
                //         ),
                //       ),
                //     ),
                //     child: Center(child: Text('Masculino')),
                //   ),
                // ),
                Container(
                  child: const Center(
                    child: Text(
                      'Beagle',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(color: PaletaCores.principal, spreadRadius: 8),
                      BoxShadow(color: PaletaCores.scaffold, spreadRadius: 10),
                    ],
                  ),
                  height: _responsive.dp(6),
                  width: _responsive.dp(28),
                ),
                SizedBox(height: 8),
                Container(
                  child: const Center(
                    child: Text(
                      'Masculino',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(color: PaletaCores.principal, spreadRadius: 8),
                      BoxShadow(color: PaletaCores.scaffold, spreadRadius: 10),
                    ],
                  ),
                  height: _responsive.dp(6),
                  width: _responsive.dp(28),
                ),
              ],
            ),
          ),
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

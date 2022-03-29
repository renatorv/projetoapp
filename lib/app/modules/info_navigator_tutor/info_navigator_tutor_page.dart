import 'package:get/get.dart';
import '../../components/instapet_textformfield_ready_only.dart';
import '../../core/core.dart';
import './info_navigator_tutor_controller.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class InfoNavigatorTutorPage extends StatefulWidget {
  const InfoNavigatorTutorPage({Key? key}) : super(key: key);

  @override
  State<InfoNavigatorTutorPage> createState() => _InfoNavigatorTutorPageState();
}

class _InfoNavigatorTutorPageState
    extends InstaState<InfoNavigatorTutorPage, InfoNavigatorTutorController> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    final Responsive _responsive = Responsive(context);

    const backGroundColor = PaletaCores.principal;
    Offset distance = isPressed ? Offset(18, 18) : Offset(-5, -5);
    double blur = isPressed ? 2 : 12;

    return GetBuilder<InfoNavigatorTutorController>(
      builder: (_) => Column(
        children: [
          Container(
            height: _responsive.dp(26),
            decoration: BoxDecoration(
              gradient: PaletaCores.degradePerfil,
              borderRadius: BorderRadius.only(
                  // bottomLeft: Radius.circular(
                  //   _responsive.dp(8),
                  // ),
                  // bottomRight: Radius.circular(
                  //   _responsive.dp(8),
                  // ),
                  ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      minRadius: _responsive.dp(4.6),
                      child: ImageIcon(
                        AssetImage("assets/icons/gallery.png"),
                        color: Colors.red,
                        size: _responsive.dp(4),
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      minRadius: _responsive.dp(7.6),
                      child: CircleAvatar(
                        radius: _responsive.dp(6),
                        backgroundImage: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqD-3VCBCz4BWpYBjnvwyQs34Mlpl3ihKIubn-IndMiUgb10QpPsurc8rEzr-BMbXo0cs&usqp=CAU',
                        ),
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      minRadius: _responsive.dp(4.6),
                      child: ImageIcon(
                        AssetImage("assets/icons/camera.png"),
                        color: Colors.red,
                        size: _responsive.dp(4),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.all(
                    _responsive.dp(3.6),
                  ),
                  child: InstapetTextformfieldReadyOnly(
                    readyOnly: false,
                    controller: controller.nameEC,
                    label: 'Nome',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: _responsive.dp(3.6),
                    left: _responsive.dp(3.6),
                  ),
                  child: InstapetTextformfieldReadyOnly(
                    readyOnly: false,
                    controller: controller.emailEC,
                    label: 'E-mail',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    // bottom: _responsive.dp(1),
                    right: _responsive.dp(3),
                    left: _responsive.dp(3),
                    top: _responsive.dp(3),
                  ),
                  child: Listener(
                    onPointerUp: (_) => setState(() => isPressed = false),
                    onPointerDown: (_) => setState(() => isPressed = true),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 100),
                      child: Container(
                        height: _responsive.dp(8),
                        width: _responsive.dp(45),
                        child: Center(
                            child: Text(
                          'ATUALIZAR',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                        padding: EdgeInsets.only(
                          right: _responsive.dp(1),
                          left: _responsive.dp(1),
                          bottom: _responsive.dp(1),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: backGroundColor,
                          boxShadow: isPressed
                              ? []
                              : [
                                  BoxShadow(
                                    color: PaletaCores.principalSecundaria,
                                    offset: -distance,
                                    blurRadius: blur,
                                    inset: isPressed,
                                  ),
                                  BoxShadow(
                                    color: PaletaCores.principalSecundaria,
                                    offset: -distance,
                                    blurRadius: blur,
                                    inset: isPressed,
                                  ),
                                ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),

          // Padding(padding: EdgeInsets.only(bottom: 30))
        ],
      ),
    );
  }
}

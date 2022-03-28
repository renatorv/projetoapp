import 'package:get/get.dart';
import 'package:projetoapp/app/components/instapet_textformfield_ready_only.dart';
import '../../components/instapet_buttom.dart';
import '../../core/core.dart';
import './info_navigator_controller.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class InfoNavigatorPage extends StatefulWidget {
  const InfoNavigatorPage({Key? key}) : super(key: key);

  @override
  State<InfoNavigatorPage> createState() => _InfoNavigatorPageState();
}

class _InfoNavigatorPageState
    extends InstaState<InfoNavigatorPage, InfoNavigatorController> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    final Responsive _responsive = Responsive(context);

    const backGroundColor = PaletaCores.principal;
    Offset distance = isPressed ? Offset(18, 18) : Offset(-5, -5);
    double blur = isPressed ? 2 : 12;

    return GetBuilder<InfoNavigatorController>(
      builder: (_) => Column(
        children: [
          Container(
            height: _responsive.dp(26),
            decoration: BoxDecoration(
              gradient: PaletaCores.degradePerfil,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(
                  _responsive.dp(5),
                ),
                bottomRight: Radius.circular(
                  _responsive.dp(5),
                ),
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
                          'https://post.medicalnewstoday.com/wp-content/uploads/sites/3/2020/02/322868_1100-800x825.jpg',
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
                ListTile(
                  subtitle: Text(
                    'Sou um cãozinho tímido, mas que conquista corações!',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: _responsive.dp(3.6),
                    left: _responsive.dp(3.6),
                    bottom: _responsive.dp(1.8),
                  ),
                  child: InstapetTextformfieldReadyOnly(
                    label: 'Nome',
                    controller: controller.nameEC,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: _responsive.dp(3.6),
                    left: _responsive.dp(3.6),
                    bottom: _responsive.dp(1.8),
                  ),
                  child: InstapetTextformfieldReadyOnly(
                    label: 'Feminino',
                    controller: controller.nameEC,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: _responsive.dp(3.6),
                    left: _responsive.dp(3.6),
                  ),
                  child: InstapetTextformfieldReadyOnly(
                    readyOnly: false,
                    label: '2 aninhos',
                    controller: controller.nameEC,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: _responsive.dp(3),
                    right: _responsive.dp(4.5),
                    left: _responsive.dp(4.5),
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
                          'CADASTRAR',
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
                ),
                // Padding(
                //   padding: EdgeInsets.only(
                //     right: _responsive.dp(3.6),
                //     left: _responsive.dp(3.6),
                //     bottom: _responsive.dp(3.6),
                //     top: _responsive.dp(3),
                //   ),
                //   child: Center(
                //     child: InstapetButtom(
                //       label: 'ATUALIZAR',
                //       onPressed: () {},
                //       width: context.width,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:projetoapp/app/components/instapet_buttom.dart';
import '../../core/core.dart';
import './info_navigator_tutor_controller.dart';

class InfoNavigatorTutorPage extends StatefulWidget {
  const InfoNavigatorTutorPage({Key? key}) : super(key: key);

  @override
  State<InfoNavigatorTutorPage> createState() => _InfoNavigatorTutorPageState();
}

class _InfoNavigatorTutorPageState
    extends InstaState<InfoNavigatorTutorPage, InfoNavigatorTutorController> {
  @override
  Widget build(BuildContext context) {
    final Responsive _responsive = Responsive(context);

    return GetBuilder<InfoNavigatorTutorController>(
      builder: (_) => Column(
        children: [
          Container(
            height: _responsive.dp(26),
            decoration: BoxDecoration(
              gradient: PaletaCores.degradePerfil,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(
                  _responsive.dp(8),
                ),
                bottomRight: Radius.circular(
                  _responsive.dp(8),
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
                ListTile(
                  title: Text(
                    'Nome',
                    style: TextStyle(
                      color: PaletaCores.principal,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'Renato Alves Pereira',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                Divider(),
                ListTile(
                  title: Text(
                    'E-mail',
                    style: TextStyle(
                      color: PaletaCores.principal,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'renatorv@gmail.com',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                Divider(),
                Padding(
                  padding: EdgeInsets.only(
                    right: _responsive.dp(3.6),
                    left: _responsive.dp(3.6),
                    bottom: _responsive.dp(3.6),
                  ),
                  child: Center(
                    child: InstapetButtom(
                      label: 'ATUALIZAR',
                      onPressed: () {},
                      width: context.width,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

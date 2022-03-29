import 'package:get/get.dart';
import 'package:projetoapp/app/components/instapet_textformfield_ready_only.dart';
import '../../components/instapet_buttom.dart';
import '../../core/core.dart';
import './info_navigator_controller.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../components/instapet_textformfield_ready_only.dart';
import 'package:path/path.dart' as caminho;
import 'package:path_provider/path_provider.dart';

class InfoNavigatorPage extends StatefulWidget {
  const InfoNavigatorPage({Key? key}) : super(key: key);

  @override
  State<InfoNavigatorPage> createState() => _InfoNavigatorPageState();
}

class _InfoNavigatorPageState
    extends InstaState<InfoNavigatorPage, InfoNavigatorController> {
  File? image;
  Future pickImage(ImageSource source) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporary = File(image.path);

      setState(() => this.image = imageTemporary);

      // TESTAR SE GRAVOU NO SP, SEGUINDO AQUI
      // https://stackoverflow.com/questions/51338041/how-to-save-image-file-in-flutter-file-selected-using-image-picker-plugin

      File imageFile = File(image.path);

      Directory appDocDir = await getApplicationDocumentsDirectory();

      String appDocPath = appDocDir.path;

      final fileName = caminho.basename(imageFile.path);

      final File localImage = await imageFile.copy('$appDocPath/$fileName');

      prefs.setString('pet', localImage.path);
    } on Exception catch (e) {
      print('Não foi possível capturar imagem: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final Responsive _responsive = Responsive(context);

    return GetBuilder<InfoNavigatorController>(
      builder: (_) => Column(
        children: [
          Container(
            height: _responsive.dp(26),
            decoration: BoxDecoration(
              gradient: PaletaCores.degradePerfil,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () => pickImage(ImageSource.camera),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        minRadius: _responsive.dp(4.6),
                        child: ImageIcon(
                          AssetImage("assets/icons/camera.png"),
                          color: Colors.red,
                          size: _responsive.dp(4),
                        ),
                      ),
                    ),
                    controller.imagem != null
                        ? CircleAvatar(
                            backgroundImage:
                                FileImage(File(controller.imagem!)),
                            radius: 72,
                            backgroundColor: Colors.white,
                          )
                        : CircleAvatar(
                            backgroundColor: Colors.white,
                            minRadius: _responsive.dp(12),
                            child: CircleAvatar(
                              radius: _responsive.dp(11),
                              child: image != null
                                  ? ClipOval(
                                      child: Image.file(
                                        image!,
                                        fit: BoxFit.cover,
                                        height: _responsive.dp(34),
                                        width: _responsive.dp(34),
                                      ),
                                    )
                                  : Icon(
                                      Icons.question_mark,
                                      size: _responsive.dp(10),
                                      color: Colors.black26,
                                    ),
                            ),
                          ),
                    GestureDetector(
                      onTap: () => pickImage(ImageSource.gallery),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        minRadius: _responsive.dp(4.6),
                        child: ImageIcon(
                          AssetImage("assets/icons/gallery.png"),
                          color: Colors.red,
                          size: _responsive.dp(4),
                        ),
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
                Divider(thickness: 1.0),
                ListTile(
                  subtitle: Text(
                    'Sou um cãozinho tímido, mas que conquista corações!',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                Divider(thickness: 1.0),
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
                SizedBox(height: _responsive.dp(5)),
                Center(
                  child: InstapetButtom(
                    label: 'ATUALIZAR',
                    onPressed: () {},
                    width: context.width * .86,
                  ),
                ),
                SizedBox(height: _responsive.dp(3)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

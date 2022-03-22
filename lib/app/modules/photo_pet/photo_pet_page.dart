import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projetoapp/app/modules/photo_pet/widgets/flecha.dart';
import 'package:projetoapp/app/modules/principal/principal_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../components/instapet_appbar.dart';
import '../../components/instapet_buttom.dart';
import '../../core/core.dart';
import './photo_pet_controller.dart';
import 'package:path/path.dart' as caminho;
import 'package:path_provider/path_provider.dart';

class PhotoPetPage extends StatefulWidget {
  static const String ROUTE_PAGE = '/photo-pet';

  const PhotoPetPage({Key? key}) : super(key: key);

  @override
  State<PhotoPetPage> createState() => _PhotoPetPageState();
}

class _PhotoPetPageState extends InstaState<PhotoPetPage, PhotoPetController> {
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

      prefs.setString('IMG_PET_LOCAL', localImage.path);

      print('$localImage.path');
    } on Exception catch (e) {
      print('Não foi possível capturar imagem: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final Responsive _responsive = Responsive(context);
    return Scaffold(
      appBar: InstapetAppbar(elevation: 0),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: IntrinsicHeight(
          child: Padding(
            padding: EdgeInsets.only(
              top: _responsive.dp(3.6),
              right: _responsive.dp(3.6),
              left: _responsive.dp(3.6),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Flecha(title: controller.especie!),
                      SizedBox(width: _responsive.dp(.8)),
                      Flecha(title: controller.raca!),
                      SizedBox(width: _responsive.dp(.8)),
                      Flecha(title: controller.nome!),
                    ],
                  ),
                ),
                SizedBox(height: _responsive.dp(2)),
                Text(
                  'Insira uma foto de seu amiguinho.',
                  style: context.textTheme.headline6?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFF5591F),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: _responsive.dp(1.8)),
                image != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(600),
                        child: Image.file(
                          image!,
                          fit: BoxFit.cover,
                          height: _responsive.dp(34),
                          width: _responsive.dp(34),
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(600),
                        child: SizedBox(
                          child: Icon(
                            Icons.question_mark,
                            size: _responsive.dp(24),
                            color: Colors.black26,
                          ),
                          height: _responsive.dp(34),
                          width: _responsive.dp(34),
                        ),
                      ),
                SizedBox(height: _responsive.dp(1.8)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: _responsive.dp(5),
                      width: _responsive.dp(5),
                      child: InkWell(
                        hoverColor: Colors.grey[400],
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          height: _responsive.dp(5.5),
                          width: _responsive.dp(5.5),
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          child: ImageIcon(
                            AssetImage("assets/icons/camera.png"),
                            color: Colors.red,
                            size: _responsive.dp(4),
                          ),
                        ),
                        onTap: () => pickImage(ImageSource.camera),
                      ),
                    ),
                    SizedBox(
                      height: _responsive.dp(5),
                      width: _responsive.dp(5),
                      child: InkWell(
                        hoverColor: Colors.grey[400],
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          height: _responsive.dp(5.5),
                          width: _responsive.dp(5.5),
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          child: ImageIcon(
                            AssetImage("assets/icons/gallery.png"),
                            color: Colors.red,
                            size: _responsive.dp(4),
                          ),
                        ),
                        onTap: () => pickImage(ImageSource.gallery),
                      ),
                    )
                  ],
                ),
                SizedBox(height: _responsive.dp(8)),
                InstapetButtom(
                  label: 'CADASTRAR',
                  onPressed: () {
                    if (image != null) {
                      Get.toNamed(PrincipalPage.ROUTE_PAGE);
                    }
                  },
                  width: context.width,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projetoapp/app/modules/photo_pet/widgets/flecha.dart';
import '../../components/instapet_appbar.dart';
import '../../components/instapet_buttom.dart';
import '../../core/core.dart';
import './photo_pet_controller.dart';

class PhotoPetPage extends StatefulWidget {
  static const String ROUTE_PAGE = '/photo-pet';

  const PhotoPetPage({Key? key}) : super(key: key);

  @override
  State<PhotoPetPage> createState() => _PhotoPetPageState();
}

class _PhotoPetPageState extends InstaState<PhotoPetPage, PhotoPetController> {
  File? image;
  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporary = File(image.path);

      setState(() => this.image = imageTemporary);
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
                        // child: Image.asset(
                        //   'assets/images/cropped-akps_header.png',
                        //   fit: BoxFit.cover,
                        //   height: _responsive.dp(36),
                        //   width: _responsive.dp(36),
                        // ),
                      ),
                SizedBox(height: _responsive.dp(1.8)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Ink(
                    //   decoration: const ShapeDecoration(
                    //     color: Color(0xFFF5591F),
                    //     shape: CircleBorder(),
                    //   ),
                    //   child: IconButton(
                    //     iconSize: _responsive.dp(5.4),
                    //     color: Colors.white,
                    //     onPressed: () => pickImage(ImageSource.camera),
                    //     icon: Icon(Icons.camera_alt_outlined),
                    //   ),
                    // ),
                    Material(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      // color: PaletaCores.principal,
                      child: InkWell(
                        onTap: () => pickImage(ImageSource.camera),
                        child: ImageIcon(
                          AssetImage("assets/icons/camera.png"),
                          color: Colors.red,
                          size: _responsive.dp(5.4),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => pickImage(ImageSource.gallery),
                      child: ImageIcon(
                        AssetImage("assets/icons/gallery.png"),
                        color: Colors.red,
                        size: _responsive.dp(5.4),
                      ),
                    ),
                    // Ink(
                    //   decoration: const ShapeDecoration(
                    //     color: Color(0xFFF5591F),
                    //     shape: CircleBorder(),
                    //   ),
                    //   child: IconButton(
                    //     iconSize: _responsive.dp(5.4),
                    //     color: Colors.white,
                    //     onPressed: () => pickImage(ImageSource.gallery),
                    //     icon: Icon(Icons.collections),
                    //   ),
                    // ),
                    // Image.asset('assets/images/icons/gallery.png'),
                    // ImageIcon(
                    //   AssetImage("assets/images/icons/gallery.png"),
                    //   color: Colors.red,
                    //   size: 10,
                    // ),
                  ],
                ),
                SizedBox(height: _responsive.dp(6)),
                InstapetButtom(
                  label: 'CADASTRAR',
                  onPressed: () {},
                  width: context.width,
                ),
                SizedBox(height: _responsive.dp(2)),
                Center(
                  child: SizedBox(
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
                      onTap: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
//https://www.youtube.com/watch?v=MSv38jO4EJk&t=82s

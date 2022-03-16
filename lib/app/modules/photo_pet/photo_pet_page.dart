import 'dart:io';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../components/instapet_appbar.dart';
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
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // SizedBox(height: _responsive.dp(2)),
            Spacer(),
            image != null
                ? ClipOval(
                    child: Image.file(
                      image!,
                      width: 100,
                      height: 120,
                    ),
                  )
                : ClipOval(
                    child: SizedBox(
                      width: 160,
                      height: 160,
                      child:
                          Image.asset('assets/images/cropped-akps_header.png'),
                      // child: Icon(
                      //   Icons.image,
                      //   size: 60,
                      // ),
                    ),
                  ),
            // FlutterLogo(size: 160),
            SizedBox(height: _responsive.dp(2)),
            Center(
              child: Text(
                'Insira uma foto de seu amiguinho.',
                style: context.textTheme.headline6?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.theme.primaryColorDark,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: _responsive.dp(3.8)),
            buidButton(
              title: 'Galeria',
              icon: Icons.camera_alt_outlined,
              onClicked: () => pickImage(ImageSource.gallery),
            ),
            SizedBox(height: _responsive.dp(3.8)),
            buidButton(
              title: 'Camera',
              icon: Icons.camera_alt_outlined,
              onClicked: () => pickImage(ImageSource.camera),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

//https://www.youtube.com/watch?v=MSv38jO4EJk&t=82s

Widget buidButton({
  required String title,
  required IconData icon,
  required VoidCallback onClicked,
}) =>
    ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(56),
        primary: Colors.white,
        onPrimary: Colors.black,
        textStyle: TextStyle(fontSize: 20),
      ),
      onPressed: onClicked,
      child: Row(
        children: [
          Icon(
            icon,
            size: 28,
            color: Colors.black,
          ),
          const SizedBox(width: 16),
        ],
      ),
    );

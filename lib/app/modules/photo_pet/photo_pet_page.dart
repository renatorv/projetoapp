import 'package:get/get.dart';
import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    final Responsive _responsive = Responsive(context);
    return Scaffold(
      appBar: InstapetAppbar(elevation: 0),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: _responsive.dp(2)),
          Center(
            child: Text(
              'Agora, precisamos de uma foto de seu amiguinho.',
              style: context.textTheme.headline6?.copyWith(
                fontWeight: FontWeight.bold,
                color: context.theme.primaryColorDark,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: _responsive.dp(3.8)),
        ],
      ),
    );
  }
}


//https://www.youtube.com/watch?v=MSv38jO4EJk&t=82s
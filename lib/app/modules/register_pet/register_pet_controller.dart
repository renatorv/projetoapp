// import 'package:get/get.dart';
// import 'package:projetoapp/app/models/pet_model.dart';
// import 'package:projetoapp/app/repositories/pet_repository.dart';

// class RegisterPetController extends GetxController {
//   final PetRepository _repository;
//   RegisterPetController(this._repository);
//   // final _name = ''.obs;
//   List<Pet> _pets = [];
//   @override
//   void onInit() async {
//     super.onInit();
//     PetModel petModel = await _repository.listPets();

//     _pets = petModel.result;

//     ///
//     // print(pets.result.length);

//     for (var p in petModel.result) {
//       print(p.name);
//     }
//   }

//   List<Pet> get listPets => _pets;
// }
// segundo teste
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:projetoapp/app/models/raca_model.dart';
// import '../../core/mixins/loader_mixin.dart';
// import '../../core/mixins/message_mixin.dart';
// import '../../models/animal_model.dart';
// import '../../repositories/pet_repository.dart';

// class RegisterPetController extends GetxController
//     with LoaderMixin, MessageMixin {
//   final PetRepository _repository;

//   RegisterPetController(this._repository);

//   List<Animal> _animal = [];

//   final _loading = false.obs;
//   final _message = Rxn<MessageModel>();

//   List<Raca> _racas = [];

//   @override
//   void onInit() async {
//     super.onInit();

//     loaderListener(_loading);
//     messageListener(_message);

//     AnimalModel _animalModel = Get.arguments;

//     _animal = _animalModel.result;

//     for (var p in _animalModel.result) {
//       print(p.name);
//     }
//     update();
//   }

//   List<Animal> get listAnimals => _animal;
//   List<Raca> get racas => _racas;

//   Future<void> buscaRacasPet(String pet) async {
//     try {
//       _loading.toggle();
//       _message(null);

//       RacaModel _racaModel = await _repository.pegaRacas(pet);

//       _racas = _racaModel.result;

//       for (var p in _racaModel.result) {
//         print(p.name);
//       }

//       _loading.toggle();

//       update();
//     } catch (e) {
//       _loading.toggle();
//       _message(
//         MessageModel(
//           title: 'Erro',
//           message: 'Erro ao validar dados.....',
//           type: MessageType.error,
//         ),
//       );
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projetoapp/app/models/raca_model.dart';
import '../../core/mixins/loader_mixin.dart';
import '../../core/mixins/message_mixin.dart';
import '../../models/animal_model.dart';
import '../../repositories/pet_repository.dart';

class RegisterPetController extends GetxController
    with LoaderMixin, MessageMixin {
  final PetRepository _repository;

  RegisterPetController(this._repository);

  List<Animal> _animal = [];

  final _loading = false.obs;
  final _message = Rxn<MessageModel>();

  List<Raca> _racas = [];

  @override
  void onInit() async {
    super.onInit();

    loaderListener(_loading);
    messageListener(_message);

    AnimalModel _animalModel = Get.arguments;

    _animal = _animalModel.result;

    for (var p in _animalModel.result) {
      print(p.name);
    }
    update();
  }

  List<Animal> get listAnimals => _animal;
  List<Raca> get racas => _racas;

  Future<void> buscaRacasPet(String pet) async {
    try {
      _loading.toggle();
      _message(null);

      RacaModel _racaModel = await _repository.pegaRacas(pet);

      _racas = _racaModel.result;

      for (var p in _racaModel.result) {
        print(p.name);
      }

      _loading.toggle();

      update();
    } catch (e) {
      _loading.toggle();
      _message(
        MessageModel(
          title: 'Erro',
          message: 'Erro ao validar dados.....',
          type: MessageType.error,
        ),
      );
    }
  }
}

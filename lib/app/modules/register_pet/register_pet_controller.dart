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

import 'package:get/get.dart';
import '../../models/animal_model.dart';

class RegisterPetController extends GetxController {
  List<Animal> _animal = [];
  @override
  void onInit() async {
    super.onInit();

    AnimalModel _animalModel = Get.arguments;

    _animal = _animalModel.result;

    for (var p in _animalModel.result) {
      print(p.name);
    }
    update();
  }

  List<Animal> get listAnimals => _animal;
}

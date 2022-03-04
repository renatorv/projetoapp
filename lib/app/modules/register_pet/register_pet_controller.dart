import 'package:get/get.dart';
import 'package:projetoapp/app/models/pet_model.dart';
import 'package:projetoapp/app/repositories/pet_repository.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../../models/user_model.dart';

class RegisterPetController extends GetxController {
  final PetRepository _repository;
  RegisterPetController(this._repository);
  // final _name = ''.obs;
  @override
  void onInit() async {
    super.onInit();
    // pegaDadosLogin();
    PetModel pets = await _repository.listPets();

    ///
    print(pets.result.length);

    for (var p in pets.result) {
      print(p.name);
    }
  }

  // RxString get name => _name;

  // Future<void> pegaDadosLogin() async {
  //   final sp = await SharedPreferences.getInstance();

  //   final usu = sp.getString('user');

  //   final _user = UserModel.fromJson(usu!);

  //   List<String> _completeName = _user.name.split(' ');

  //   _name.value = _completeName[0];

  //   update();
  // }
}

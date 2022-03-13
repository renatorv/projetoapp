import 'package:get/get.dart';
import '../../core/mixins/mixins.dart';
import '../../models/animal_model.dart';
import '../../models/raca_model.dart';
import '../../repositories/pet_repository.dart';

class RegisterPetController extends GetxController
    with LoaderMixin, MessageMixin {
  final PetRepository _repository;
  RegisterPetController(this._repository);
  List<Animal> _animal = [];

  final _loading = false.obs;
  final _message = Rxn<MessageModel>();

  List<Raca> _racas = <Raca>[].obs;

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
    _racas = [];
    try {
      _loading.toggle();
      _message(null);

      RacaModel _racaModel = await _repository.pegaRacas(pet);

      _racas = _racaModel.result;

      // for (var r in _racas) {
      //   print('Raça => ${r.name}');
      // }

      _loading.toggle();
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
    update();
  }
}

import 'package:get/get.dart';
import 'package:projetoapp/app/core/constants/constants.dart';
import 'package:projetoapp/app/models/user_logged.dart';
import 'package:projetoapp/app/modules/home/home.dart';
import 'package:projetoapp/app/modules/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/mixins/mixins.dart';
import '../../models/animal_model.dart';
import '../../repositories/pet_repository.dart';
import '../register_pet/register_pet_page.dart';

class SplashController extends GetxController with LoaderMixin, MessageMixin {
  final PetRepository _repository;
  final _logged = UserLogged.empty.obs;

  SplashController(this._repository);

  final _loading = false.obs;
  final _message = Rxn<MessageModel>();

  @override
  void onInit() {
    super.onInit();
    loaderListener(_loading);
    messageListener(_message);
    ever<UserLogged>(_logged, checkIsLogged);
    checkLogin();
  }

  UserLogged get logged => _logged.value;

  Future<void> checkLogin() async {
    final sp = await SharedPreferences.getInstance();
    // Controla o tempo do splash
    await 4.seconds.delay();
    if (sp.containsKey('user')) {
      /// Vai para home
      _logged(UserLogged.authententicate);
    } else {
      /// Vai para login
      _logged(UserLogged.unauthenticate);
    }
  }

  void checkIsLogged(UserLogged userLogged) async {
    final sp = await SharedPreferences.getInstance();
    switch (userLogged) {
      case UserLogged.authententicate:

        /// Se tiver essa chave já configurada, significa que o usuário
        /// já cadastrou o pet, caso contrário é necessário realizar o cadastro
        if (sp.containsKey(Constants.PHOTO_PET)) {
          Get.offAllNamed(HomePage.ROUTE_PAGE);
        } else {
          try {
            _loading.toggle();
            _message(null);

            AnimalModel animalModel = await _repository.listPets();

            Get.offAllNamed(RegisterPetPage.ROUTE_PAGE, arguments: animalModel);

            _loading.toggle();
          } catch (e) {
            _loading.toggle();
            _message(
              MessageModel(
                title: 'Erro',
                message: 'Erro ao validar dados.',
                type: MessageType.error,
              ),
            );
          }
        }

        break;
      case UserLogged.unauthenticate:
        Get.offAllNamed(LoginPage.ROUTE_PAGE);
        break;
      case UserLogged.empty:
      default:
        break;
    }
  }
}

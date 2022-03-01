import 'package:get/get.dart';
import 'package:projetoapp/app/core/mixins/mixins.dart';
import 'package:projetoapp/app/core/rest_client.dart';
import 'package:projetoapp/app/modules/splash/splash.dart';
import 'package:projetoapp/app/repositories/user_repository.dart';
import 'package:projetoapp/app/view_models/register_user_input_mode.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterController extends GetxController with LoaderMixin, MessageMixin {
  final UserRepository _repository;
  RegisterController(this._repository);

  final _loading = false.obs;
  final _message = Rxn<MessageModel>();

  @override
  void onInit() {
    super.onInit();
    loaderListener(_loading);
    messageListener(_message);
  }

  void register(String name, String email, String password) async {
    final inputModel = RegisterUserInputModel(
      name: name,
      email: email,
      password: password,
    );

    try {
      _loading.toggle();
      _message(null);
      final _user = await _repository.register(inputModel);

      final sp = await SharedPreferences.getInstance();
      await sp.setString('user', _user.toJson());

      _loading.toggle();
      _message(
        MessageModel(
          title: 'Sucesso',
          message: 'Usuário cadastado com sucesso.',
          type: MessageType.info,
        ),
      );
      Get.offAllNamed(SplashPage.ROUTE_PAGE);
    } on RestClientException catch (e) {
      _loading.toggle();
      _message(
        MessageModel(
          title: 'Erro',
          message: e.message,
          type: MessageType.error,
        ),
      );
    } catch (e) {
      _loading.toggle();
      _message(
        MessageModel(
          title: 'Erro',
          message: 'Erro ao registrar usuário.',
          type: MessageType.error,
        ),
      );
    }
  }
}

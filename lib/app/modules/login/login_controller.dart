import 'package:get/get.dart';
import 'package:projetoapp/app/core/mixins/mixins.dart';
import 'package:projetoapp/app/core/rest_client.dart';
import 'package:projetoapp/app/modules/splash/splash_page.dart';
import 'package:projetoapp/app/repositories/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController with LoaderMixin, MessageMixin {
  final UserRepository _repository;
  LoginController(this._repository);

  final _loading = false.obs;
  final _message = Rxn<MessageModel>();

  @override
  void onInit() {
    super.onInit();
    loaderListener(_loading);
    messageListener(_message);
  }

  void login(String email, String password) async {
    try {
      _loading.toggle();
      _message(null);
      final _user = await _repository.login(email, password);

      final sp = await SharedPreferences.getInstance();
      await sp.setString('user', _user.toJson());
      _loading.toggle();
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
          message: 'Erro ao autenticar usuário.',
          type: MessageType.error,
        ),
      );
    }
  }

  /// Tratamento obscure - aula 3 => 44 minutos
  // final _obscureText = true.obs;
  // get obscureText => _obscureText.value;
  // void showHidePassword() => _obscureText.toggle();
}

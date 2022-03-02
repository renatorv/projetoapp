import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:projetoapp/app/core/mixins/mixins.dart';
import 'package:projetoapp/app/core/rest_client.dart';
import 'package:projetoapp/app/modules/login/login.dart';
import 'package:projetoapp/app/modules/splash/splash_page.dart';
import 'package:projetoapp/app/repositories/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../view_models/social_net_inpu_model.dart';

class LoginController extends GetxController with LoaderMixin, MessageMixin {
  final UserRepository _repository;
  LoginController(this._repository);

  final _loading = false.obs;
  final _message = Rxn<MessageModel>();

  /// Google
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;

  //Facebook
  Map? _userDataFacebook;

  @override
  void onInit() {
    super.onInit();
    loaderListener(_loading);
    messageListener(_message);
  }

  GoogleSignInAccount get user => _user!;
  Map? get loginFace => _userDataFacebook;

  Future loginFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();

    if (result.status == LoginStatus.success) {
      // you are logged
      final AccessToken accessToken = result.accessToken!;

      print(accessToken.applicationId);

      final requestData = await FacebookAuth.i.getUserData(
        fields: "email, name, picture",
      );

      print(requestData);
      print(requestData['picture']);
    } else {
      print(result.status);
      print(result.message);
    }
  }

  Future logoutFacebook() async {
    await FacebookAuth.i.logOut();
  }

  Future googleLogin() async {
    try {
      final googleUser = await googleSignIn.signIn();

      if (googleUser == null) return;

      _user = googleUser;

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      acessoGoogle(_user!);
    } on Exception catch (e) {
      print(e.toString());
    }

    update();
  }

  Future googleLogout() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();

    Get.offAllNamed(LoginPage.ROUTE_PAGE);
  }

  //***************************************************************************/
  // Verificar se o usuário que esta acessando com Google já possui cadastro na
  // na base da aplicação, caso não tenha realizar o cadastro.
  //***************************************************************************/
  void acessoGoogle(GoogleSignInAccount _user) async {
    final inputModel = SocialNetInpuModel(
      name: _user.displayName ?? "",
      email: _user.email,
      photoUrl: _user.photoUrl ?? "",
    );

    try {
      _loading.toggle();
      _message(null);
      final _user = await _repository.acessoGoogle(inputModel);

      ///
      /// id == 0, significa que o login está sendo pelo Google e o usuário
      /// já possui cadastro na base do App
      if (_user.id == '0') {
        login(_user.email, '123456');
      } else {
        final sp = await SharedPreferences.getInstance();
        await sp.setString('user', _user.toJson());

        _loading.toggle();
        Get.offAllNamed(SplashPage.ROUTE_PAGE);
      }
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
          message: 'Erro ao registrar usuário (Google).',
          type: MessageType.error,
        ),
      );
    }
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

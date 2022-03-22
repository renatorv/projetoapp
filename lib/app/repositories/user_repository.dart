import 'package:projetoapp/app/core/rest_client.dart';
import 'package:projetoapp/app/models/user_model.dart';
import 'package:projetoapp/app/view_models/register_user_input_mode.dart';

import '../view_models/social_net_inpu_model.dart';

class UserRepository {
  final RestClient _restClient;
  UserRepository(this._restClient);

  Future<UserModel> login(String email, String password) async {
    final response = await _restClient.post('/login', {
      'email': email,
      'password': password,
    }, decoder: (resp) {
      return UserModel.fromMap(resp['result']);
    });

    if (response.hasError) {
      String message = 'Erro ao autenticar usuário...';

      if (response.statusCode == 403) {
        message = 'Usuário ou senha inválidos.';
      }
      throw RestClientException(message);
    }

    return response.body!;
  }

  Future<UserModel> register(RegisterUserInputModel model) async {
    final response = await _restClient.post('/sign-up', {
      'name': model.name,
      'email': model.email,
      'password': model.password,
    }, decoder: (resp) {
      return UserModel.fromMap(resp['result']);
    });

    if (response.hasError) {
      String message = 'Erro ao cadastrar usuário..';

      throw RestClientException(message);
    }

    return response.body!;
  }

  Future<UserModel> acessoRedeSocial(SocialNetInpuModel model) async {
    int code = 0;
    final response = await _restClient.post('/sign-up-google', {
      'name': model.name,
      'email': model.email,
      'password': '123456',
      'photoUrl': model.photoUrl,
    }, decoder: (resp) {
      if (resp['result'] != null) {
        return UserModel.fromMap(resp['result']);
      } else {
        if (resp['code'] == 202) {
          code = resp['code'];
        }
      }
    });

    ///************************************************************************/
    /// Se o código for 202 o usuário já é cadastrado, crio um UserModel para
    /// fazer o login.
    ///************************************************************************/
    if (code == 202) {
      final _user = UserModel(
        id: '0',
        name: model.name,
        email: model.email,
        sessionToken: '0',
      );

      return _user;
    }

    if (response.hasError) {
      String message = 'Erro ao cadastrar usuário através de Rede Social.';

      throw RestClientException(message);
    }

    return response.body!;
  }
}

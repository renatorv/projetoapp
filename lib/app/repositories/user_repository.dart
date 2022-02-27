import 'package:projetoapp/app/core/rest_client.dart';
import 'package:projetoapp/app/models/user_model.dart';
import 'package:projetoapp/app/view_models/register_user_input_mode.dart';

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
}

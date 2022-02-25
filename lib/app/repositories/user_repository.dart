import 'package:projetoapp/app/core/rest_client.dart';
import 'package:projetoapp/app/models/user_model.dart';

class UserRepository {
  final RestClient _restClient;
  UserRepository(this._restClient);

  Future<UserModel> login(String email, String password) async {
    final response = await _restClient.post('/login', {
      'email': email,
      'password': password,
    }, decoder: (resp) {
      print(resp['result']);
      return UserModel.fromMap(resp['result']);
    });

    if (response.hasError) {
      String message = 'Erro ao autenticar usuário.';

      if (response.statusCode == 403) {
        message = 'Usuário ou senha inválidos.';
      }
      throw RestClientException(message);
    }

    return response.body!;
  }
}

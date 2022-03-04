import '../core/core.dart';
import '../models/pet_model.dart';

class PetRepository {
  final RestClient _restClient;
  PetRepository(this._restClient);

  Future<PetModel> listPets() async {
    final response = await _restClient.post('/list-pets', {}, decoder: (resp) {
      return PetModel.fromMap(resp);
    });

    if (response.hasError) {
      String message = 'Erro ao buscar lista de Pets';

      if (response.statusCode == 403) {
        message = 'Não foi possível listar Pets.';
      }
      throw RestClientException(message);
    }

    return response.body!;
  }
}

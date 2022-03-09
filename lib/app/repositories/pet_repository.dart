import '../core/core.dart';
import '../models/animal_model.dart';

class PetRepository {
  final RestClient _restClient;
  PetRepository(this._restClient);

  Future<AnimalModel> listPets() async {
    final response = await _restClient.post('/lista-pets', {}, decoder: (resp) {
      return AnimalModel.fromMap(resp);
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

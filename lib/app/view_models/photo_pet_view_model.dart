import 'dart:convert';

class PhotoPetViewModel {
  final String nome;
  final String idEspecie;
  final String especie;
  final String idRaca;
  final String raca;

  PhotoPetViewModel({
    required this.nome,
    required this.idEspecie,
    required this.especie,
    required this.idRaca,
    required this.raca,
  });

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'idEspecie': idEspecie,
      'especie': especie,
      'idRaca': idRaca,
      'raca': raca,
    };
  }

  factory PhotoPetViewModel.fromMap(Map<String, dynamic> map) {
    return PhotoPetViewModel(
      nome: map['nome'] ?? '',
      idEspecie: map['idEspecie'] ?? '',
      especie: map['especie'] ?? '',
      idRaca: map['idRaca'] ?? '',
      raca: map['raca'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PhotoPetViewModel.fromJson(String source) =>
      PhotoPetViewModel.fromMap(json.decode(source));
}

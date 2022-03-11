import 'dart:convert';

class RacaModel {
  final List<Raca> result;
  RacaModel({
    required this.result,
  });

  Map<String, dynamic> toMap() {
    return {
      'result': result.map((x) => x.toMap()).toList(),
    };
  }

  factory RacaModel.fromMap(Map<String, dynamic> map) {
    return RacaModel(
      result: List<Raca>.from(map['result']?.map((x) => Raca.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory RacaModel.fromJson(String source) =>
      RacaModel.fromMap(json.decode(source));
}

class Raca {
  final String name;
  final String idPet;
  final String idRaca;
  Raca({
    required this.name,
    required this.idPet,
    required this.idRaca,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'idPet': idPet,
      'idRaca': idRaca,
    };
  }

  factory Raca.fromMap(Map<String, dynamic> map) {
    return Raca(
      name: map['name'] ?? '',
      idPet: map['idPet'] ?? '',
      idRaca: map['idRaca'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Raca.fromJson(String source) => Raca.fromMap(json.decode(source));
}

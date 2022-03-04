import 'dart:convert';

class PetModel {
  final List<Pet> result;
  PetModel({
    required this.result,
  });

  Map<String, dynamic> toMap() {
    return {
      'result': result.map((x) => x.toMap()).toList(),
    };
  }

  factory PetModel.fromMap(Map<String, dynamic> map) {
    return PetModel(
      result: List<Pet>.from(map['result']?.map((x) => Pet.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory PetModel.fromJson(String source) =>
      PetModel.fromMap(json.decode(source));
}

class Pet {
  final String objectId;
  final String name;
  Pet({
    required this.objectId,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'objectId': objectId,
      'name': name,
    };
  }

  factory Pet.fromMap(Map<String, dynamic> map) {
    return Pet(
      objectId: map['objectId'] ?? '',
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Pet.fromJson(String source) => Pet.fromMap(json.decode(source));
}

import 'dart:convert';

class AnimalModel {
  final List<Animal> result;
  AnimalModel({
    required this.result,
  });

  Map<String, dynamic> toMap() {
    return {
      'result': result.map((x) => x.toMap()).toList(),
    };
  }

  factory AnimalModel.fromMap(Map<String, dynamic> map) {
    return AnimalModel(
      result: List<Animal>.from(map['result']?.map((x) => Animal.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory AnimalModel.fromJson(String source) =>
      AnimalModel.fromMap(json.decode(source));
}

class Animal {
  final String name;
  final String objectId;
  final bool status;

  Animal({
    required this.name,
    required this.objectId,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'objectId': objectId,
      'status': status,
    };
  }

  factory Animal.fromMap(Map<String, dynamic> map) {
    return Animal(
      name: map['name'] ?? '',
      objectId: map['objectId'] ?? '',
      status: map['status'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Animal.fromJson(String source) => Animal.fromMap(json.decode(source));
}

import 'package:equatable/equatable.dart';
import 'package:peko_application/data/models/sprites_model.dart';

class PekemonsModel extends Equatable {
  final int? id;
  final String? name;
  final int? baseExperience;
  final int? height;
  final bool? isDefault;
  final int? order;
  final int? weight;
  final SpritesModel? sprites;

  const PekemonsModel({
    required this.id,
    required this.name,
    required this.baseExperience,
    required this.height,
    required this.isDefault,
    required this.order,
    required this.weight,
    required this.sprites,
  });

  factory PekemonsModel.fromJson(Map<String, dynamic> json) => PekemonsModel(
      id: json['id'] ?? "",
      name: json['name'],
      baseExperience: json['base_experience'],
      height: json['height'],
      isDefault: json['is_default'],
      order: json['order'],
      weight: json['weight'],
      sprites: json['sprites'] != null
          ? SpritesModel.fromJson(json['sprites'])
          : null);
  @override
  List<Object?> get props =>
      [id, name, baseExperience, height, isDefault, order, weight, sprites];
  PekemonsModel toEntity() => PekemonsModel(
      id: id,
      name: name,
      baseExperience: baseExperience,
      height: height,
      isDefault: isDefault,
      order: order,
      weight: weight,
      sprites: sprites);
  static List<PekemonsModel> toListOfModel(List<dynamic> data) {
    return data.map((data) => PekemonsModel.fromJson(data)).toList();
  }
}

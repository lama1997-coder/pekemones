import 'package:equatable/equatable.dart';
import 'package:peko_application/domin/entities/sprites.dart';

class Pekemons extends Equatable {
 final int? id;
 final String? name;
 final int? baseExperience;
 final int? height;
 final bool? isDefault;
 final int? order;
 final int? weight;
 final String? locationAreaEncounters;
final  Sprites? sprites;

const  Pekemons({
  required  this.id,
  required  this.name,
   required this.baseExperience,
   required this.height,
   required this.isDefault,
  required  this.order,
   required this.weight,
   required this.locationAreaEncounters,
   required this.sprites,
  });
  @override
  List<Object?> get props => [
        id,
        name,
        baseExperience,
        height,
        isDefault,
        order,
        weight,
        locationAreaEncounters,
        sprites
      ];
}

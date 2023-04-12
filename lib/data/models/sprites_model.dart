

import 'package:equatable/equatable.dart';
import 'package:peko_application/data/models/other.dart';

class SpritesModel extends Equatable{


 final  String? backDefault;
 final String? backFemale;
 final String? backShiny;
 final String? backShinyFemale;
final  String? frontDefault;
final  String? frontFemale;
final  String? frontShiny;
final  String? frontShinyFemale;
final  Other? other;

 const SpritesModel({
   required this.backDefault,
  required  this.backFemale,
  required  this.backShiny,
  required  this.backShinyFemale,
  required  this.frontDefault,
  required  this.frontFemale,
  required  this.frontShiny,
  required  this.frontShinyFemale,
  required this.other
  });



factory SpritesModel.fromJson(Map<String, dynamic> json) => SpritesModel(
       backDefault : json['back_default'],
    backFemale: json['back_female'],
    backShiny:json['back_shiny'],
    backShinyFemale :json['back_shiny_female'],
    frontDefault:json['front_default'],
    frontFemale:json['front_female'],
    frontShiny:json['front_shiny'],
    frontShinyFemale:json['front_shiny_female'],
      other : json['other'] != null ? new Other.fromJson(json['other']) : null
      );
  @override
  List<Object?> get props => [
        backDefault,
        backFemale,
        backShiny,
        backShinyFemale,
        frontDefault,
        frontFemale,
        frontShiny,
        frontShinyFemale
      ];


}
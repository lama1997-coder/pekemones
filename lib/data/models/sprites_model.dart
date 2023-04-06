

import 'package:equatable/equatable.dart';

class SpritesModel extends Equatable{


 final  String? backDefault;
 final String? backFemale;
 final String? backShiny;
 final String? backShinyFemale;
final  String? frontDefault;
final  String? frontFemale;
final  String? frontShiny;
final  String? frontShinyFemale;

 const SpritesModel({
   required this.backDefault,
  required  this.backFemale,
  required  this.backShiny,
  required  this.backShinyFemale,
  required  this.frontDefault,
  required  this.frontFemale,
  required  this.frontShiny,
  required  this.frontShinyFemale,
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
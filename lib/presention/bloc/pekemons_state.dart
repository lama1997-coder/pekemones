import 'package:equatable/equatable.dart';
import 'package:peko_application/data/models/pekemones_model.dart';


abstract class PekemonesState extends Equatable {
  const PekemonesState();

  @override
  List<Object?> get props => [];
}

class PekemonesEmpty extends PekemonesState {}

class PekemonesLoading extends PekemonesState {}

class PekemonesError extends PekemonesState {
  final String message;

  PekemonesError(this.message);

  @override
  List<Object?> get props => [message];
}

class PekemonesHasData extends PekemonesState {
  final List<PekemonsModel> result;

  PekemonesHasData(this.result);

  @override
  List<Object?> get props => [result];
}
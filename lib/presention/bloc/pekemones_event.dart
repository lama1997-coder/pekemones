import 'package:equatable/equatable.dart';

abstract class PekemonesEvent extends Equatable {
  const PekemonesEvent();

  @override
  List<Object?> get props => [];
}

class OnReloadChanged extends PekemonesEvent {

  OnReloadChanged();

  @override
  List<Object?> get props => [];
}
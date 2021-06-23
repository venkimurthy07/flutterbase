import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class BreedsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AppStarted extends BreedsEvent {}

class BreedEvent extends BreedsEvent {
  @override
  List<Object> get props => [];
}

import 'package:flutter/cupertino.dart';
import 'package:flutter_app/features/domain/entities/breeds_information_entity.dart';

@immutable
class BreedsState {}

class LoginInitial extends BreedsState {}

class LoadingState extends BreedsState {}

class ErrorState extends BreedsState {
  final String message;

  ErrorState({this.message});

  @override
  List<Object> get props => [message];
}

class LoadedState extends BreedsState {
  final List<BreedsInformationEntity> breedsInformationEntity;

  LoadedState({this.breedsInformationEntity});
}

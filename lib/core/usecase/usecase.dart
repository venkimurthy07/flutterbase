import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app/core/error/failures.dart';

/**
 * Created by venkateshmurthytp on 23,June,2021
 */
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}

class GetAllEventParams extends Equatable {
  final String userId;
  final String userGroupCode;

  GetAllEventParams({this.userId, this.userGroupCode});

  @override
  List<Object> get props => [userId, userGroupCode];
}

class NotificationEventParams extends Equatable {
  final String profId;

  NotificationEventParams({this.profId});

  @override
  List<Object> get props => [profId];
}

class NotificationMarkEventParams extends Equatable {
  int eventId;
  int profId;
  String eventTypeCd;

  NotificationMarkEventParams({this.profId, this.eventId, this.eventTypeCd});

  @override
  List<Object> get props => [profId, eventId, eventTypeCd];
}

class GetMyHealthDetailsParams extends Equatable {
  final int healthScrnId;

  GetMyHealthDetailsParams({this.healthScrnId});

  @override
  List<Object> get props => [healthScrnId];
}

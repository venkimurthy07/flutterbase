import 'package:equatable/equatable.dart';

/**
 * Created by venkateshmurthytp on 23,June,2021
 */
class BreedsInformationEntity extends Equatable {
  final int id;
  final String name;
  final String imageURL;

  BreedsInformationEntity(this.id, this.name, this.imageURL);

  @override
  List<Object> get props => [id, name];
}

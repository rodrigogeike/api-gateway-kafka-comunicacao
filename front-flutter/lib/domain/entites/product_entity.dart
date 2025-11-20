import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final int id;
  final String description;

  List get props => [description];

  ProductEntity({required this.id, required this.description});
}

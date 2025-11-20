import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final int id;
  final String name;

  List get props => [name];

  CategoryEntity({required this.id, required this.name});
}

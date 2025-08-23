import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final String id;
  final String name;

  List get props => [name];

  CategoryEntity({required this.id, required this.name, n});
}

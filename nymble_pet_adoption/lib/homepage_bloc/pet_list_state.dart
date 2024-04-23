part of 'pet_list_bloc.dart';

abstract class PetListState extends Equatable {
  const PetListState();

  @override
  List<Object> get props => [];
}

class PetListInitial extends PetListState {}

class PetListLoaded extends PetListState {
  final List<Pet> pets;

  const PetListLoaded({required this.pets});

  @override
  List<Object> get props => [pets];
}

class PetListLoading extends PetListState {}

class PetListError extends PetListState {
  final String error;

  const PetListError({required this.error});

  @override
  List<Object> get props => [error];
}

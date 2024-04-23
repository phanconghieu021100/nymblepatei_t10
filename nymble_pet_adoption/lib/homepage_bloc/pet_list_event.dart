part of 'pet_list_bloc.dart';


abstract class PetListEvent extends Equatable {
  const PetListEvent();

  @override
  List<Object> get props => [];
}

class FetchPetsEvent extends PetListEvent {}

class FilterPetsEvent extends PetListEvent {
  final String query;

  const FilterPetsEvent({required this.query});

  @override
  List<Object> get props => [query];
}

class UpdatePetAdoptionEvent extends PetListEvent {
  final Pet pet;

  const UpdatePetAdoptionEvent({required this.pet});

  @override
  List<Object> get props => [pet];
}

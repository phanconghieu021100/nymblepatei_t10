import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nymble_pet_adoption/components/data.dart';

part 'pet_list_event.dart';
part 'pet_list_state.dart';

class PetListBloc extends Bloc<PetListEvent, PetListState> {
  PetListBloc() : super(PetListInitial()) {
    on<FetchPetsEvent>((event, emit) async {
      emit(PetListLoading()); // Indicate loading state
      try {
        final pets = PetService.getAllPets();
        emit(PetListLoaded(pets: pets));
      } catch (error) {
        emit(PetListError(error: error.toString()));
      }
    });

    on<FilterPetsEvent>((event, emit) {
      if (state is PetListLoaded) {
        final filteredPets = (state as PetListLoaded).pets.where((pet) =>
            pet.name.toLowerCase().contains(event.query.toLowerCase()));
        emit(PetListLoaded(pets: filteredPets.toList()));
      }
    });

    on<UpdatePetAdoptionEvent>((event, emit) async {
      // Implement logic to update adoption status on server (if applicable)

      if (state is PetListLoaded) {
        final updatedPet = event.pet;
        final updatedPets = (state as PetListLoaded)
            .pets
            .map((pet) => pet.id == updatedPet.id ? updatedPet : pet)
            .toList();
        emit(PetListLoaded(pets: updatedPets));
      }

      // Show success/error message or handle UI updates as needed
    });
  }
}

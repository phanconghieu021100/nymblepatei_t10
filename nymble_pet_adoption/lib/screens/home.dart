import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nymble_pet_adoption/components/card.dart';
import 'package:nymble_pet_adoption/components/data.dart';
import 'package:nymble_pet_adoption/homepage_bloc/pet_list_bloc.dart';
import 'package:nymble_pet_adoption/screens/details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nymble_pet_adoption/u.dart';

late List<Pet> pets;
List<Pet> _filteredPets = [];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    pets = PetService.getAllPets();
    _filteredPets = pets;
    super.initState();
  }

  void _filterPets(String query) {
    setState(() {
      _filteredPets = pets
          .where((pet) => pet.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final PetListBloc _petListBloc = PetListBloc();
    _petListBloc.add(FetchPetsEvent()); // Inject PetService

    return Scaffold(
      backgroundColor: AppColors.tColor2,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 60),
           Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "Pet Adoption",
              style: AppFonts.quicksand(size: 30),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              // height: 50,
              child: TextField(
                onTapOutside: (event) {
                  FocusScope.of(context).unfocus();
                },
                style: AppFonts.quicksand(),
                onChanged: _filterPets,
                decoration: const InputDecoration(
                  
                  prefixIcon: Icon(Icons.search),
                  hintText: "Search...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: BlocProvider<PetListBloc>(
              create: (context) => _petListBloc, // Provide the Bloc instance
              child: BlocConsumer<PetListBloc, PetListState>(
                listener: (context, state) {
                  if (state is PetListError) {
                    // Show error message using ScaffoldMessenger or SnackBar
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Error fetching pets: ${state.error}',style: AppFonts.quicksand()),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is PetListInitial) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is PetListLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is PetListLoaded) {
                    final pets = (state as PetListLoaded).pets;
                    return _buildPetList(pets); // Build your pet list UI here
                  } else {
                    return Text('Something went wrong!',style: AppFonts.quicksand(),);
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPetList(List<Pet> pets) {
    // Implement your widget to display the list of pets
    // You can use ListView.builder or any other suitable widget
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.9,
      ),
      itemCount: _filteredPets.length,
      itemBuilder: (context, index) {
        final pet = _filteredPets[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PetDetailsScreen(pet: pet, index: index),
              ),
            );
          },
          child: Hero(
            tag: 'petImage$index', // Unique tag for each pet image
            child: Homecard(
              pet: pet,
              index: index,
            ),
          ),
        );
      },
    );
  }
}

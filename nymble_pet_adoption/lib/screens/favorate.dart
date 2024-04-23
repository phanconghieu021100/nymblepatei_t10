import 'package:flutter/material.dart';
import 'package:nymble_pet_adoption/components/card.dart';

import 'package:nymble_pet_adoption/screens/details.dart';
import 'package:nymble_pet_adoption/screens/home.dart';
import 'package:nymble_pet_adoption/u.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    final likedPets = pets.where((pet) => pet.like).toList();
    return Scaffold(
      backgroundColor: AppColors.tColor3,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 60),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.9,
              ),
              itemCount: likedPets.length,
              itemBuilder: (context, index) {
                final pet = likedPets[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PetDetailsScreen(pet: pet, index: index),
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
            ),
          ),
        ],
      ),
    );
  }
}

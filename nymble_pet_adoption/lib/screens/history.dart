import 'package:flutter/material.dart';
import 'package:nymble_pet_adoption/components/card.dart';

import 'package:nymble_pet_adoption/screens/details.dart';
import 'package:nymble_pet_adoption/screens/home.dart';
import 'package:nymble_pet_adoption/u.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    final likedPets = pets.where((pet) => pet.isAdopted).toList();
    return Scaffold(
      backgroundColor: AppColors.tColor2,
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

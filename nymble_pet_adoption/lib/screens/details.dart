import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/widgets.dart';

import 'package:nymble_pet_adoption/components/data.dart';
import 'package:nymble_pet_adoption/components/photoviewer.dart';

class PetDetailsScreen extends StatefulWidget {
  final Pet pet;
  final int index;
  const PetDetailsScreen({super.key, required this.pet, required this.index});

  @override
  State<PetDetailsScreen> createState() => _PetDetailsScreenState();
}

class _PetDetailsScreenState extends State<PetDetailsScreen> {
  final confettiController = ConfettiController();

  @override
  void dispose() {
    confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag:
                    'petImage${widget.index}', // Use the same tag as in HomePage
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(32),
                    child: Stack(
                      children: [
                        SizedBox(
                          height: 400,
                          child: GestureDetector(
                            onTap: () => showDialog(
                                context: (context),
                                builder: (BuildContext context) => Photoviewer(
                                      img: widget.pet.picture,
                                    )),
                            child: Image.asset(
                              'assets/images/${widget.pet.picture}',
                              fit: BoxFit.cover,
                              height: 400,
                              width: double.infinity,
                            ),
                          ),
                        ),
                        IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.arrow_back_ios_rounded,
                                color: Colors.black87,
                              ),
                            )),
                        Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                widget.pet.like = !widget.pet.like;
                              });
                            },
                            icon: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.white.withOpacity(0.3),
                              child: Icon(
                                widget.pet.like
                                    ? Icons.star
                                    : Icons.star_border,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.pet.name,
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "\$ ${widget.pet.price}",
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          shape: BoxShape.rectangle,
                          color: const Color(0xFFACD7FF),
                        ),
                        child: Center(
                          child: Text(
                            "Age: ${widget.pet.age}",
                            style: const TextStyle(
                              fontSize: 18,
                              color: Color(0xFF48739B),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Container(
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          shape: BoxShape.rectangle,
                          color: const Color(0xFFC5E59C),
                        ),
                        child: Center(
                          child: Text(
                            widget.pet.address,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Color(0xFF6B8B42),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Container(
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          shape: BoxShape.rectangle,
                          color: const Color(0xFFF1E689),
                        ),
                        child: Center(
                          child: Text(
                            widget.pet.gender,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Color(0xFF978C2F),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    widget.pet.about,
                    style: const TextStyle(fontSize: 15),
                  )),
              const SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: ElevatedButton(
          style: ElevatedButton.styleFrom(
              minimumSize: const Size(380, 50),
              backgroundColor: widget.pet.isAdopted
                  ? const Color(0xFFACACAC)
                  : const Color(0xFFF2968F)),
          onPressed: () {
            if (!widget.pet.isAdopted) {
              widget.pet.isAdopted = !widget.pet.isAdopted;
              confettiController.play(); // Play confetti if adopted
              showDialog(
                context: context,
                builder: (context) => _buildAdoptionPopup(widget.pet.name),
              );
            }
            setState(() {});
          },
          child: widget.pet.isAdopted
              ? const Text(
                  "Already Adopted",
                  style: TextStyle(color: Colors.white),
                )
              : const Text(
                  "Adopt Me",
                  style: TextStyle(color: Colors.white),
                )),
    );
  }

  Widget _buildAdoptionPopup(String petName) {
    return Stack(
      children: [
        AlertDialog(
          title: Text(
            "You’ve now adopted $petName",
            style: TextStyle(fontSize: 20),
          ),
          content: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Close")),
        ),
        Align(
          alignment: Alignment.center,
          child: ConfettiWidget(
            confettiController: confettiController,
            blastDirectionality: BlastDirectionality.explosive,
          ),
        )
      ],
    );
  }
}

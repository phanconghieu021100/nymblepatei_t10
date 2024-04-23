import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/widgets.dart';

import 'package:nymble_pet_adoption/components/data.dart';
import 'package:nymble_pet_adoption/components/photoviewer.dart';
import 'package:nymble_pet_adoption/u.dart';

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
                      style: AppFonts.quicksand(weight: FontWeight.w700,size: 30),
                    ),
                    Text(
                      "\$ ${widget.pet.price}",
                      style: AppFonts.quicksand(weight: FontWeight.w700,size: 25),
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
                            style:AppFonts.quicksand(weight: FontWeight.w700,size:17),
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
                            style: AppFonts.quicksand(weight: FontWeight.w700,size:17),
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
                            style: AppFonts.quicksand(weight: FontWeight.w700,size:17),
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
                    style: AppFonts.quicksand(weight: FontWeight.w500,size:15),
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
              ?  Text(
                  "Already Adopted",
                  style: AppFonts.quicksand(weight: FontWeight.w700,size:17,color: Colors.white),
                )
              :  Text(
                  "Adopt Me",
                  style: AppFonts.quicksand(weight: FontWeight.w700,size:17,color: Colors.white),
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

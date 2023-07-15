import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swipe_deck/swipe_deck.dart';

final List<String> colors = [
  "assets/magazine/images/image1.jpeg",
  "assets/magazine/images/image2.jpeg",
  "assets/magazine/images/image3.jpeg",
  "assets/magazine/images/image5.jpeg",
  "assets/magazine/images/image6.jpeg",
];

class AnimatedSwipeCart extends StatelessWidget {
  const AnimatedSwipeCart({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.sizeOf(context);
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Animated Cart"),
      // ),
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Positioned(
            top: 0,
            child: Container(
              height: mediaQuery.height / 1.3,
              width: mediaQuery.width,
              decoration: const BoxDecoration(
                color: Colors.black,
                gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black, Colors.transparent],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: mediaQuery.height / 1.3,
              width: mediaQuery.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.topCenter,
                  colors: [Colors.white, Colors.transparent],
                ),
              ),
            ),
          ),
          const Positioned(child: TopContainer()),
          Positioned(
            bottom: 0,
            child: Container(
              height: 100,
              width: mediaQuery.width,
              color: Colors.purple,
            ),
          ),
        ],
      ),
    );
  }
}

class TopContainer extends StatelessWidget {
  const TopContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.sizeOf(context);

    return SafeArea(
      child: SizedBox(
        height: mediaQuery.height,
        width: mediaQuery.width,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 150,
                    color: Colors.red,
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.security_rounded,
                    color: Colors.red,
                    size: 45,
                  )
                ],
              ),
            ),

            const SizedBox(height: 25),
            // Search Bar
            Container(
              height: 60,
              margin: const EdgeInsets.symmetric(horizontal: 18),
              width: mediaQuery.width,
              decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(30))),
            ),

            const SizedBox(height: 80),
            // Stacked Card
            const StackedCard(),

            const SizedBox(height: 80),
            // Row Text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Text("All Magazines",
                      style: GoogleFonts.poppins().copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      )),
                  const Spacer(),
                  const Icon(
                    Icons.security_rounded,
                    color: Colors.red,
                    size: 30,
                  )
                ],
              ),
            ),

            // Container List
            const SizedBox(height: 20),

            SizedBox(
              height: 130,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(
                    6,
                    (index) => Container(
                          width: 200,
                          color: Colors.lightGreen,
                          margin: const EdgeInsets.all(5),
                        )),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class StackedCard extends StatelessWidget {
  const StackedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SwipeDeck(
        startIndex: 2,
        emptyIndicator: const SizedBox(
          child: Center(
            child: Text("Nothing Here"),
          ),
        ),
        cardSpreadInDegrees: 50.0,
        // Change the Spread of Background Cards
        onSwipeLeft: () {
          print("USER SWIPED LEFT -> GOING TO NEXT WIDGET");
        },
        onSwipeRight: () {
          print("USER SWIPED RIGHT -> GOING TO PREVIOUS WIDGET");
        },
        onChange: (index) {
          print(colors[index]);
        },
        widgets: colors
            .map((image) => GestureDetector(
                  onTap: () {
                    print(image);
                  },
                  child: ClipRRect(
                      borderRadius: BorderRadius.zero,
                      child: Image.asset(
                        image,
                        fit: BoxFit.cover,
                      )),
                ))
            .toList(),
      ),
    );
  }
}

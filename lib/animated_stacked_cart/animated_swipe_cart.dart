import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swipe_deck/swipe_deck.dart';

import 'details_view.dart';

class CartItemModel {
  final int id;
  final String image;

  CartItemModel({required this.id, required this.image});
}

final List<CartItemModel> imageItems = [
  CartItemModel(id: 1, image: "assets/magazine/images/image1.jpeg"),
  CartItemModel(id: 2, image: "assets/magazine/images/image2.jpeg"),
  CartItemModel(id: 3, image: "assets/magazine/images/image3.jpeg"),
  CartItemModel(id: 4, image: "assets/magazine/images/image5.jpeg"),
  CartItemModel(id: 5, image: "assets/magazine/images/image6.jpeg"),
];

final List<String> bottomList = [
  "assets/magazine/images/image7.jpeg",
  "assets/magazine/images/image8.jpeg",
  "assets/magazine/images/image9.jpeg",
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
              color: Colors.white,
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: SafeArea(
                child: Transform.translate(
                  offset: const Offset(0, -45),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.home,
                        size: 30,
                      ),
                      Icon(
                        CupertinoIcons.bag,
                        size: 30,
                      ),
                      Icon(
                        CupertinoIcons.smiley,
                        size: 30,
                      ),
                      Icon(
                        CupertinoIcons.smallcircle_circle,
                        size: 30,
                      )
                    ],
                  ),
                ),
              ),
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
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 170,
                    // color: Colors.red,
                    child: Row(
                      children: [
                        Stack(
                          children: [
                            Transform.translate(
                              offset: const Offset(-2, 4),
                              child: const CircleAvatar(
                                radius: 10,
                                backgroundColor: Colors.greenAccent,
                              ),
                            ),
                            Transform.translate(
                              offset: const Offset(8, -4),
                              child: const CircleAvatar(
                                radius: 11,
                                backgroundColor: Colors.red,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 15),
                        Text(
                          "Magaz",
                          style: GoogleFonts.poppins().copyWith(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    CupertinoIcons.barcode_viewfinder,
                    color: Colors.white,
                    size: 30,
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
                color: Colors.white24,
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  children: [
                    Icon(
                      CupertinoIcons.search,
                      color: Colors.white,
                      size: 30,
                    ),
                    Spacer(),
                  ],
                ),
              ),
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
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: bottomList.length,
                itemBuilder: (context, i) => Container(
                  width: 200,
                  color: Colors.lightGreen,
                  margin: const EdgeInsets.all(5),
                  child: Image.asset(
                    bottomList[i],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
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
        // This is package That make card Swipe [ https://pub.dev/packages/swipe_deck ]
        startIndex: 2,
        emptyIndicator: const SizedBox(
          child: Center(
            child: Text("Nothing Here"),
          ),
        ),
        cardSpreadInDegrees: 50.0,
        // Change the Spread of Background Cards
        onSwipeLeft: () {
          // print("USER SWIPED LEFT -> GOING TO NEXT WIDGET");
        },
        onSwipeRight: () {
          // print("USER SWIPED RIGHT -> GOING TO PREVIOUS WIDGET");
        },
        onChange: (index) {
          // print(colors[index]);
        },
        widgets: imageItems
            .map((image) => GestureDetector(
                  onTap: () {

                    Navigator.of(context).push(
                      PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 500),
                        reverseTransitionDuration:
                            const Duration(milliseconds: 500),
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            FadeTransition(
                          opacity: animation,
                          child: CardDetailsView(image: image),
                        ),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          return child;
                        },
                      ),
                    );
                  },
                  child: ClipRRect(
                      borderRadius: BorderRadius.zero,
                      child: Image.asset(
                        image.image,
                        fit: BoxFit.cover,
                      )),
                ))
            .toList(),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation/animated_shopping_cart/cart_details_view.dart';
import 'package:google_fonts/google_fonts.dart';

class Product {
  final int id;
  final String title;
  final String description;
  final String imageUrl;
  final double price;
  late int quantity;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.quantity,
  });
}

final List<Product> _products = [
  Product(
    id: 1,
    title: "Apple IPhone 15",
    description:
        "This character description generator will generate a fairly random description of a belonging to a random race. However, some aspects of the descriptions will remain the same, this is done to keep the general structure the same, while still randomizing the important details. The generator does take into account which race is randomly picked, and changes some of the details accordingly. For example, if the character is an elf, they will have a higher chance of looking good and clean, they will, of course, have an elvish name, and tend to be related to more elvish related towns and people.",
    imageUrl: "assets/animated_list_app/images/inphon1.png",
    price: 1998.8,
    quantity: 1,
  ),
  Product(
    id: 2,
    title: "IPhone 15",
    description:
        "This character description generator will generate a fairly random description of a belonging to a random race. However, some aspects of the descriptions will remain the same, this is done to keep the general structure the same, while still randomizing the important details. The generator does take into account which race is randomly picked, and changes some of the details accordingly. For example, if the character is an elf, they will have a higher chance of looking good and clean, they will, of course, have an elvish name, and tend to be related to more elvish related towns and people.",
    imageUrl: "assets/animated_list_app/images/inphon1.png",
    price: 1998.8,
    quantity: 1,
  ),
  Product(
    id: 3,
    title: "IPhone 15",
    description:
        "This character description generator will generate a fairly random description of a belonging to a random race. However, some aspects of the descriptions will remain the same, this is done to keep the general structure the same, while still randomizing the important details. The generator does take into account which race is randomly picked, and changes some of the details accordingly. For example, if the character is an elf, they will have a higher chance of looking good and clean, they will, of course, have an elvish name, and tend to be related to more elvish related towns and people.",
    imageUrl: "assets/animated_list_app/images/inphon1.png",
    price: 1998.8,
    quantity: 1,
  ),
  Product(
    id: 5,
    title: "IPhone 15",
    description:
        "This character description generator will generate a fairly random description of a belonging to a random race. However, some aspects of the descriptions will remain the same, this is done to keep the general structure the same, while still randomizing the important details. The generator does take into account which race is randomly picked, and changes some of the details accordingly. For example, if the character is an elf, they will have a higher chance of looking good and clean, they will, of course, have an elvish name, and tend to be related to more elvish related towns and people.",
    imageUrl: "assets/animated_list_app/images/inphon1.png",
    price: 1998.8,
    quantity: 1,
  ),
  Product(
    id: 6,
    title: "IPhone 15",
    description:
        "This character description generator will generate a fairly random description of a belonging to a random race. However, some aspects of the descriptions will remain the same, this is done to keep the general structure the same, while still randomizing the important details. The generator does take into account which race is randomly picked, and changes some of the details accordingly. For example, if the character is an elf, they will have a higher chance of looking good and clean, they will, of course, have an elvish name, and tend to be related to more elvish related towns and people.",
    imageUrl: "assets/animated_list_app/images/inphon1.png",
    price: 1998.8,
    quantity: 1,
  ),
];

class AnimatedShoppingCart extends StatefulWidget {
  const AnimatedShoppingCart({super.key});

  @override
  State<AnimatedShoppingCart> createState() => _AnimatedShoppingCartState();
}

class _AnimatedShoppingCartState extends State<AnimatedShoppingCart> {
  bool showCart = false;
  bool showDetails = false;

  double storeHeight = 770;

  final List<Product> products = [..._products];

  final List<Product> cartItems = [];

  void addToCart(Product product) {
    for (Product cartProduct in cartItems) {
      if (cartProduct.id == product.id) {
        cartProduct.quantity++;
        return;
      }
    }

    setState(() {
      cartItems.add(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.sizeOf(context);

    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          GestureDetector(
            onTap: () {},
            onVerticalDragEnd: (details) {
              // print("End Details $details");
              // if (details.globalPosition == Offset(details.globalPosition.dx, 780.0)) {
              setState(() {
                showCart = !showCart;
              });
              // }
            },
            child: Container(
              color: Colors.black87,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 190),
                      // Text(
                      //   "Cart",
                      //   style: GoogleFonts.quicksand().copyWith(
                      //     color: Colors.white,
                      //     fontWeight: FontWeight.bold,
                      //     fontSize: 25,
                      //   ),
                      // ),
                      // const SizedBox(height: 30),
                      Expanded(
                        child: cartItems.isEmpty
                            ? const SizedBox(
                                child: Center(
                                  child: Text(
                                    "No Products",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                color: Colors.red,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: ListView.builder(
                                    itemCount: cartItems.length,
                                    itemBuilder: (context, index) {
                                      return Card(
                                        child: Text(cartItems[index].title),
                                      );
                                    },
                                  ),
                                ),
                              ),
                      ),
                      const SizedBox(height: 100),
                    ],
                  ),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            top: showCart ? -storeHeight : 0,
            bottom: showDetails
                ? 0
                : showCart
                    ? storeHeight
                    : 120,
            curve: Curves.easeOutQuad,
            duration: const Duration(milliseconds: 500),
            child: Container(
              height: mediaQuery.height,
              width: mediaQuery.width,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(60),
                  bottomRight: Radius.circular(60),
                ),
              ),
              child: Column(
                children: [
                  SafeArea(
                    bottom: false,
                    child: Container(
                      height: 50,
                      // color: Colors.lightGreen,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          const Icon(
                            CupertinoIcons.back,
                            size: 25,
                          ),
                          const SizedBox(width: 40),
                          Text(
                            "Apple Store",
                            style: GoogleFonts.lexendDeca().copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          const Icon(
                            CupertinoIcons.slider_horizontal_3,
                            size: 25,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(60),
                        bottomRight: Radius.circular(60),
                      ),
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 5.0,
                          childAspectRatio: 0.75,
                        ),
                        itemCount: products.length,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () async {
                              // Navigator.of(context).push(
                              //   MaterialPageRoute(
                              //     builder: (context) {
                              //       return CartDetailsView(
                              //         productIndex: index,
                              //         product: products[index],
                              //       );
                              //     },
                              //   ),
                              // );

                              setState(() {
                                showDetails = true;
                              });

                              final result = await Navigator.of(context).push(
                                PageRouteBuilder(
                                  transitionDuration:
                                      const Duration(milliseconds: 700),
                                  reverseTransitionDuration:
                                      const Duration(milliseconds: 300),
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      FadeTransition(
                                    opacity: animation,
                                    child: CartDetailsView(
                                        product: products[index],
                                        onAddProduct: (product) {
                                          addToCart(product);
                                        }),
                                  ),
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    return child;
                                  },
                                ),
                              );

                              if (result != null) {
                                setState(() {
                                  showDetails = false;
                                });
                              }
                            },
                            child: Card(
                              color: Colors.white,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15.0),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 120,
                                      child: Hero(
                                        tag: "${products[index].id}",
                                        child: Image.asset(
                                          products[index].imageUrl,
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    Text(
                                      "\$ ${products[index].price}",
                                      style: GoogleFonts.lexendDeca().copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      products[index].title,
                                      style: GoogleFonts.quicksand().copyWith(
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      "500 gm",
                                      style: GoogleFonts.quicksand().copyWith(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOutQuad,
            bottom: showDetails
                ? -80
                : showCart
                    ? storeHeight - 80
                    : 40,
            // bottom: showDetails || showCart ? -80 : 40,
            child: GestureDetector(
              onTap: () {},
              onVerticalDragEnd: (details) {
                // print("End Details $details");
                // if (details.globalPosition == Offset(details.globalPosition.dx, 780.0)) {
                setState(() {
                  showCart = !showCart;
                });
                // }
              },
              child: SizedBox(
                width: mediaQuery.width,
                height: 60,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    children: [
                      Text(
                        "Cart",
                        style: GoogleFonts.quicksand().copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: showCart
                            ? const SizedBox()
                            : ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: cartItems.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Hero(
                                      tag: "${cartItems[index].id}cart",
                                      child: CircleAvatar(
                                        radius: 25,
                                        backgroundColor: Colors.white,
                                        child: SizedBox(
                                          height: 30,
                                          child: Image.asset(
                                            cartItems[index].imageUrl,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                      ),
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.orange.shade300,
                        child: Text(
                          cartItems.isEmpty ? "0" : cartItems.length.toString(),
                          style: GoogleFonts.lexendDeca().copyWith(
                            fontSize: 18,
                          ),
                        ),
                      ),
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

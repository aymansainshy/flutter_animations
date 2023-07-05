import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation/animated_shopping_cart/animated_shopping_cart.dart';
import 'package:google_fonts/google_fonts.dart';

class CartDetailsView extends StatelessWidget {
  const CartDetailsView({
    required this.product,
    required this.productIndex,
    required this.onAddProduct,
    super.key,
  });

  final Product product;
  final int productIndex;

  final Function(Product product) onAddProduct;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          SizedBox(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // SizedBox(
                    //   height: 30,
                    //   child: Row(
                    //
                    //     children: [
                    //       IconButton(
                    //         onPressed: () {
                    //           Navigator.of(context).pop();
                    //           print("pressed");
                    //         },
                    //         icon: const Icon(
                    //           CupertinoIcons.back,
                    //         ),
                    //       ),
                    //       const Spacer(),
                    //     ],
                    //   ),
                    // ),
                    SafeArea(
                      child: SizedBox(
                        height: 350,
                        width: 350,
                        child: Hero(
                            tag: productIndex,
                            child: Image.asset(product.imageUrl)),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      product.title,
                      style: GoogleFonts.lexendDeca().copyWith(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "500 g",
                      style: GoogleFonts.quicksand().copyWith(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 40,
                          width: 150,
                          decoration: BoxDecoration(
                              // color: Colors.grey,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(25),
                              ),
                              border: Border.all(
                                color: Colors.grey,
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Icon(Icons.remove),
                              Text(
                                '1',
                                style: GoogleFonts.quicksand().copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              const Icon(Icons.add),
                            ],
                          ),
                        ),
                        Text(
                          "\$ ${product.price.toString()}",
                          style: GoogleFonts.lexendDeca().copyWith(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Text(
                      "About The Product: ",
                      style: GoogleFonts.quicksand().copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      product.description,
                      style: GoogleFonts.quicksand().copyWith(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 180,
            decoration: const BoxDecoration(
              color: Colors.white,
              gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.topCenter,
                colors: [
                  Colors.white,
                  Colors.white10,
                ],
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 30.0,
                  right: 30.0,
                  top: 50.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.black12,
                      child: CircleAvatar(
                        radius: 27,
                        backgroundColor: Colors.white,
                        child: Icon(
                          CupertinoIcons.heart,
                          size: 25,
                        ),
                      ),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        onAddProduct(product);
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.orange.shade300, // Background color
                      ),
                      child: SizedBox(
                        height: 50,
                        width: MediaQuery.sizeOf(context).width / 2,
                        child: Center(
                          child: Text(
                            "Add to cart",
                            style: GoogleFonts.lexendDeca().copyWith(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

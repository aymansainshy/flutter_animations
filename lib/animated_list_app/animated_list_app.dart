import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation/animated_list_app/details_view.dart';
import 'package:google_fonts/google_fonts.dart';

class CartModel {
  final String title;
  final String image;
  final Color color;
  final String logo;
  final double price;
  final Color priceColor;

  CartModel({
    required this.title,
    required this.image,
    required this.color,
    required this.logo,
    required this.price,
    required this.priceColor,
  });
}

final List<CartModel> items = [
  CartModel(
    title: "Apple Iphone",
    image: "assets/animated_list_app/images/inphon1.png",
    logo: "assets/animated_list_app/images/apple_logo.png",
    color: const Color(0xffd8e1ef),
    price: 15,
    priceColor: const Color(0xff270dd3),
  ),
  CartModel(
    title: "Apple Iphone",
    image: "assets/animated_list_app/images/inphon1.png",
    logo: "assets/animated_list_app/images/apple_logo.png",
    color: const Color(0xffd8e1ef),
    price: 15,
    priceColor: const Color(0xff270dd3),
  ),
  CartModel(
    title: "Apple Iphone",
    image: "assets/animated_list_app/images/inphon1.png",
    logo: "assets/animated_list_app/images/apple_logo.png",
    color: const Color(0xffd8e1ef),
    price: 15,
    priceColor: const Color(0xff270dd3),
  ),
  CartModel(
    title: "Apple Iphone",
    image: "assets/animated_list_app/images/inphon1.png",
    logo: "assets/animated_list_app/images/apple_logo.png",
    color: const Color(0xffd8e1ef),
    price: 15,
    priceColor: const Color(0xff270dd3),
  ),
  CartModel(
    title: "Apple Iphone",
    image: "assets/animated_list_app/images/inphon1.png",
    logo: "assets/animated_list_app/images/apple_logo.png",
    color: const Color(0xffd8e1ef),
    price: 15,
    priceColor: const Color(0xff270dd3),
  ),
];

final List<Color?> colors = [
  Colors.black,
  Colors.lightBlueAccent,
  Colors.red,
  Colors.green,
  Colors.deepPurple,
  Colors.yellow,
  Colors.black,
  Colors.red,
  Colors.green,
  Colors.deepPurple,
  Colors.yellow,

  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
];

class AnimatedListApp extends StatefulWidget {
  const AnimatedListApp({super.key});

  @override
  State<AnimatedListApp> createState() => _AnimatedListAppState();
}

class _AnimatedListAppState extends State<AnimatedListApp> {
  final _scrollController = ScrollController();
  double itemHeight = 180.0;
  bool isStartScrolling = false;

  void onListenToScroll() {
    if (_scrollController.offset > 50) {
      isStartScrolling = true;
    } else if (_scrollController.offset < 50) {
      isStartScrolling = false;
    }
    setState(() {});
  }

  @override
  void initState() {
    _scrollController.addListener(onListenToScroll);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  //Theme.of(context).colorScheme.inversePrimary,

  @override
  Widget build(BuildContext context) {
    //--------------------------------------------//
    // This for animating appBar and the top List //
    //--------------------------------------------//
    late double opacity;
    if (_scrollController.hasClients) {
      opacity = 2 - (_scrollController.offset / itemHeight * 2);
      if (opacity > 1.0) opacity = 1.0;
      if (opacity < 0.0) opacity = 0.0;
    } else {
      opacity = 1.0;
    }
    ////////////////////////////////////////////////

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: const CustomAppBar(),
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          CustomScrollView(
            controller: _scrollController,
            clipBehavior: Clip.antiAlias,
            slivers: [
              // SliverPersistentHeader(
              //   delegate: Header(title: "Discover", viewAll: true),
              // ),
              SliverToBoxAdapter(
                child: Opacity(
                  opacity: isStartScrolling ? opacity : 1.0,
                  child: SizedBox(
                    // color: Colors.amber,
                    width: MediaQuery.sizeOf(context).width,
                    height: 290,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 60,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 15, left: 25, bottom: 10, right: 25),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Discover",
                                  style: GoogleFonts.quicksand().copyWith(
                                    color: Colors.black54,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "View all>",
                                  style: GoogleFonts.quicksand().copyWith(
                                    color: Colors.grey.shade400,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 220,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: colors.length,
                            itemBuilder: (context, index) {
                              return
                                  // Transform(
                                  // alignment: Alignment.topLeft,
                                  // transform: Matrix4.identity()..scale(isStartScrolling ? opacity : 1.0, opacity),
                                  // child:
                                  Card(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30),
                                  ),
                                ),
                                color: colors[index],
                                child: const SizedBox(
                                  width: 170,
                                ),
                                // ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverPersistentHeader(
                delegate: PersistentHeader(title: "My Coupons"),
                floating: true,
                pinned: true,
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final cartItem = items[index];

                    // The first item position offset in every scroll is always = 0;
                    final itemPositionOffset = index * itemHeight / 1.4;
                    final difference =
                        _scrollController.offset - itemPositionOffset;
                    final percent = 1.5 - (difference / (itemHeight / 1.2));

                    double opacity = percent;
                    // Opacity accept value from 0.0 - 1.0 and Percent can go up to 1.0
                    // So we have to do so adjustment
                    if (opacity > 1.0) opacity = 1.0;
                    if (opacity < 0.0) opacity = 0.0;

                    double scale = percent;
                    if (percent > 1.0) scale = 1.0;

                    // if (index == 0) {
                    //   print('Index: $index');
                    //   print('Item Position Offset : $itemPositionOffset');
                    //   print('Scroll Offset : ${_scrollController.offset}');
                    //   print('Difference : ${_scrollController.offset - itemPositionOffset}');
                    //   print('Difference / ItemHeight : ${difference / itemHeight}');
                    //   print('Percent : $percent');
                    // }

                    return Align(
                      // Align With heightFactor give up the feel of indexedStack
                      heightFactor: 0.6,
                      child: Opacity(
                        opacity: opacity,
                        child: Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.identity()..scale(scale, 1.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                PageRouteBuilder(
                                  transitionDuration:
                                      const Duration(milliseconds: 150),
                                  reverseTransitionDuration:
                                      const Duration(milliseconds: 150),
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      ScaleTransition(
                                    scale: animation,
                                    child: const DetailsView(),
                                  ),
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    return child;
                                  },
                                ),
                              );
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade200, //New
                                      blurRadius: 40.0,
                                      offset: const Offset(0, 8),
                                    ),
                                  ],
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(30)),
                                ),
                                child: CartItem(
                                  cart: cartItem,
                                  itemHeight: itemHeight,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  childCount: items.length,
                ),
              ),
            ],
          ),
          ClipPath(
            clipper: MyCustomClipper(),
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade100, //New
                    blurRadius: 40.0,
                    offset: const Offset(0, -20),
                  ),
                ],
              ),
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 45.0, right: 45.0, top: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Transform.rotate(
                          angle: 30.5,
                          child: Icon(
                            Icons.send,
                            color: Colors.grey.shade400,
                            size: 32,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Send Money",
                          style: GoogleFonts.quicksand().copyWith(
                            color: Colors.grey.shade500,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.account_balance_wallet_rounded,
                          color: Colors.grey.shade400,
                          size: 32,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Services",
                          style: GoogleFonts.quicksand().copyWith(
                            color: Colors.grey.shade500,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: const Offset(0, -40),
            child: const CircleAvatar(
              radius: 45,
              backgroundColor: Colors.lightBlueAccent,
              child: Icon(
                Icons.add_box_outlined,
                color: Colors.white,
                size: 35,
              ),
            ),
          )
        ],
      ),
      // bottomNavigationBar: ClipPath(
      //   clipper: MyCustomClipper(),
      //   child: Container(
      //     height: 100,
      //     color: Colors.black87,
      //   ),
      // ),
    );
  }
}

class CartItem extends StatelessWidget {
  const CartItem({required this.cart, required this.itemHeight, super.key});

  final CartModel cart;
  final double itemHeight;

  @override
  Widget build(BuildContext context) {
    return Card(
      // elevation: 20,
      // surfaceTintColor: Colors.red,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      color: cart.color,
      child: SizedBox(
          height: itemHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 35,
                        width: 35,
                        child: Image.asset(cart.logo),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        cart.title,
                        style: GoogleFonts.quicksand().copyWith(
                          fontSize: 16,
                          color: Colors.black45,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Transform.translate(
                        offset: const Offset(0.0, -5.0),
                        child: RichText(
                          text: TextSpan(
                            text: "- ${cart.price.toString()}",
                            style: GoogleFonts.quicksand().copyWith(
                              fontSize: 40,
                              color: cart.priceColor,
                              fontWeight: FontWeight.bold,
                            ),
                            children: const <TextSpan>[
                              TextSpan(
                                text: ' %',
                                style: TextStyle(
                                  color: Colors.black26,
                                  fontSize: 25,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 160,
                  width: 100,
                  child: Image.asset(
                    cart.image,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

class PersistentHeader extends SliverPersistentHeaderDelegate {
  final String title;
  final bool viewAll;

  PersistentHeader({required this.title, this.viewAll = false});

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.only(top: 15, left: 25, bottom: 5, right: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: GoogleFonts.quicksand().copyWith(
                color: Colors.black54,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            // if (viewAll)
            //   Text(
            //     "View all>",
            //     style: GoogleFonts.quicksand().copyWith(
            //       color: Colors.grey.shade400,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => 100.0;

  @override
  double get minExtent => 100.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      CupertinoIcons.search,
                      color: Colors.black45,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.menu_open_sharp,
                      size: 30,
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Loyalty Cards",
                    style: GoogleFonts.quicksand().copyWith(
                        color: Colors.grey.shade400,
                        fontWeight: FontWeight.bold,
                        fontSize: 21),
                  ),
                  Row(
                    children: [
                      Text(
                        "Coupons",
                        style: GoogleFonts.quicksand().copyWith(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                      const SizedBox(width: 4),
                      Badge(
                        textColor: Colors.white,
                        smallSize: 20,
                        largeSize: 20,
                        backgroundColor: Colors.amber,
                        textStyle:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: Colors.white,
                                ),
                        label: const Text("2"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(170);
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(0, size.height - 100);

    path.lineTo((size.width / 3) - 50, 0);

    path.quadraticBezierTo((size.width / 3) + 10, 0, (size.width / 3) + 50, 30);
    path.quadraticBezierTo((size.width / 2), 50, (size.width / 2) + 20, 30);
    path.quadraticBezierTo(size.width - (size.width / 2) + 60, 0,
        size.width - (size.width / 3) + 50, 0);

    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

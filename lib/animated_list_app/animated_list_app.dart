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

class TopCardModel {
  final Color color;
  final IconData icon;
  final String title;

  TopCardModel({
    required this.color,
    required this.icon,
    required this.title,
  });
}

final List<TopCardModel> topCard = [
  TopCardModel(
    color: const Color(0xffeaae36),
    icon: CupertinoIcons.heart,
    title: "Most Favourites",
  ),
  TopCardModel(
    color: const Color(0xff46c0f5),
    icon: CupertinoIcons.arrow_2_circlepath_circle,
    title: "Newest",
  ),
  TopCardModel(
    color: const Color(0xffadd6f5),
    icon: CupertinoIcons.alarm,
    title: "Supers",
  ),
];

final List<CartModel> items = [
  CartModel(
    title: "Apple Iphone",
    image: "assets/animated_list_app/images/macdonald.png",
    logo: "assets/animated_list_app/images/macdonald_logo.png",
    color: const Color(0xff54afa7),
    price: 15,
    priceColor: const Color(0xffffffff),
  ),
  CartModel(
    title: "Dunkin Donuts",
    image: "assets/animated_list_app/images/donuts.png",
    logo: "assets/animated_list_app/images/dunkin_donuts.png",
    color: const Color(0xfff8f3f4),
    price: 0.50,
    priceColor: Colors.purpleAccent,
  ),
  CartModel(
    title: "Pizza",
    image: "assets/animated_list_app/images/pizza.png",
    logo: "assets/animated_list_app/images/pizza_logo.png",
    color: const Color(0xfff9cdef),
    price: 1.25,
    priceColor: const Color(0xff270dd3),
  ),
  CartModel(
    title: "Apple Iphone",
    image: "assets/animated_list_app/images/adidas.png",
    logo: "assets/animated_list_app/images/adidas_logo.png",
    color: const Color(0xffffffff),
    price: 23,
    priceColor: Colors.black87,
  ),
  CartModel(
    title: "Apple Iphone",
    image: "assets/animated_list_app/images/ps_5.png",
    logo: "assets/animated_list_app/images/ps5.png",
    color: Colors.black26,
    price: 15,
    priceColor: Colors.white,
  ),
  CartModel(
    title: "Pizza",
    image: "assets/animated_list_app/images/pizza.png",
    logo: "assets/animated_list_app/images/pizza_logo.png",
    color: const Color(0xfff9cdef),
    price: 1.25,
    priceColor: const Color(0xff270dd3),
  ),
  CartModel(
    title: "Apple Iphone",
    image: "assets/animated_list_app/images/inphon1.png",
    logo: "assets/animated_list_app/images/apple_logo.png",
    color: const Color(0xffd8e1ef),
    price: 13.5,
    priceColor: const Color(0xff270dd3),
  ),
  CartModel(
    title: "Mac Donalds23",
    image: "assets/animated_list_app/images/macdonald.png",
    logo: "assets/animated_list_app/images/macdonald_logo.png",
    color: const Color(0xff1f1d80),
    price: 0.04,
    priceColor: Colors.white,
  ),
  CartModel(
    title: "Dunkin Donuts",
    image: "assets/animated_list_app/images/donuts.png",
    logo: "assets/animated_list_app/images/dunkin_donuts.png",
    color: const Color(0xfff8f3f4),
    price: 0.50,
    priceColor: Colors.purpleAccent,
  ),
  CartModel(
    title: "Pizza",
    image: "assets/animated_list_app/images/pizza.png",
    logo: "assets/animated_list_app/images/pizza_logo.png",
    color: const Color(0xfff9cdef),
    price: 1.25,
    priceColor: const Color(0xff270dd3),
  ),
  CartModel(
    title: "Apple Iphone",
    image: "assets/animated_list_app/images/ps_5.png",
    logo: "assets/animated_list_app/images/ps5.png",
    color: Colors.black26,
    price: 15,
    priceColor: Colors.white,
  ),
  CartModel(
    title: "Play Station 5",
    image: "assets/animated_list_app/images/ps_5.png",
    logo: "assets/animated_list_app/images/ps5.png",
    color: const Color(0xffefe2f1),
    price: 33.5,
    priceColor: const Color(0xff270dd3),
  ),
  CartModel(
    title: "Apple Iphone",
    image: "assets/animated_list_app/images/inphon1.png",
    logo: "assets/animated_list_app/images/apple_logo.png",
    color: const Color(0xffC7DC71),
    price: 15,
    priceColor: const Color(0xff270dd3),
  ),
  CartModel(
    title: "Apple Iphone",
    image: "assets/animated_list_app/images/adidas.png",
    logo: "assets/animated_list_app/images/adidas_logo.png",
    color: const Color(0xffffffff),
    price: 23,
    priceColor: Colors.black87,
  ),
  CartModel(
    title: "Mac Donalds23",
    image: "assets/animated_list_app/images/macdonald.png",
    logo: "assets/animated_list_app/images/macdonald_logo.png",
    color: const Color(0xff1f1d80),
    price: 0.04,
    priceColor: Colors.white,
  ),
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
      backgroundColor: Colors.grey.shade100,
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
                    height: 270,
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
                                  style: GoogleFonts.tajawal().copyWith(
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
                          height: 200,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: topCard.length,
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
                                color: topCard[index].color,
                                child: SizedBox(
                                  width: 160,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 15,
                                      top: 10.0,
                                      right: 15,
                                      bottom: 15,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          topCard[index].title,
                                          style:
                                              GoogleFonts.quicksand().copyWith(
                                            color: Colors.grey.shade300,
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            const Spacer(),
                                            Icon(
                                              topCard[index].icon,
                                              color: Colors.grey.shade300,
                                              size: 35,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
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
                    final itemPositionOffset = index * itemHeight / 1.42;
                    final difference =
                        _scrollController.offset - itemPositionOffset;
                    final percent = 1.2 - (difference / (itemHeight / 1.2));

                    double opacity = percent;
                    // Opacity accept value from 0.0 - 1.0 and Percent can go up to 1.0
                    // So we have to do so adjustment
                    if (opacity > 1.0) opacity = 1.0;
                    if (opacity < 0.0) opacity = 0.0;

                    // double scale = percent;
                    // if (percent > 1.0) scale = 1.0;

                    // if (index == 0) {
                    //   print('Index: $index');
                    //   print('Item Position Offset : $itemPositionOffset');
                    //   print('Scroll Offset : ${_scrollController.offset}');
                    //   print('Difference : ${_scrollController.offset - itemPositionOffset}');
                    //   print('Difference / ItemHeight : ${difference / itemHeight}');
                    //   print('Percent : $percent');
                    // }

                    return Padding(
                      padding: const EdgeInsets.only(top: 3.0),
                      child: Align(
                        // Align With heightFactor give up the feel of indexedStack
                        heightFactor: 0.6,
                        child: Opacity(
                          opacity: opacity,
                          // child: Transform(
                          //   alignment: Alignment.center,
                          //   transform: Matrix4.identity()..scale(scale, 1.0),
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
                                decoration: const BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey, //New
                                      blurRadius: 40.0,
                                      offset: Offset(0, 8),
                                    ),
                                  ],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                ),
                                child: CartItem(
                                  cart: cartItem,
                                  itemHeight: itemHeight,
                                  scale: opacity,
                                ),
                              ),
                            ),
                          ),
                          // ),
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
              height: 90,
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
              radius: 42,
              backgroundColor: Colors.lightBlueAccent,
              child: Icon(
                Icons.add_box_outlined,
                color: Colors.white,
                size: 30,
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
  const CartItem({
    required this.cart,
    required this.itemHeight,
    required this.scale,
    super.key,
  });

  final CartModel cart;
  final double itemHeight;

  final double scale;

  @override
  Widget build(BuildContext context) {
    print("Scale : ${20 * scale}");

    return SizedBox(
      height: itemHeight,
      width: MediaQuery.sizeOf(context).width * (scale + 0.1),
      child: Card(
        key: Key(cart.image),
        // elevation: 20,
        // surfaceTintColor: Colors.red,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        color: cart.color,
        child: SizedBox(
            height: itemHeight * scale,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 20.0 * scale, top: 10.0 * scale),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 35 * scale,
                          width: 35 * scale,
                          child: Image.asset(cart.logo),
                        ),
                        SizedBox(height: 4 * scale),
                        Text(
                          cart.title,
                          style: GoogleFonts.quicksand().copyWith(
                            fontSize: 14 * scale,
                            color: cart.priceColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(0.0, -5.0 * scale),
                          child: RichText(
                            text: TextSpan(
                              text: "- ${cart.price.toString()}",
                              style: GoogleFonts.quicksand().copyWith(
                                fontSize: 35 * scale,
                                color: cart.priceColor,
                                fontWeight: FontWeight.bold,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: ' %',
                                  style: TextStyle(
                                    color: cart.priceColor,
                                    fontSize: 20 * scale,
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
                    height: 170,
                    width: 100,
                    child: Image.asset(
                      cart.image,
                    ),
                  ),
                ),
              ],
            )),
      ),
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

    path.moveTo(0, size.height - 90);

    path.lineTo((size.width / 3) - 50, 0);

    path.quadraticBezierTo((size.width / 3) + 10, 0, (size.width / 3) + 50, 30);
    path.quadraticBezierTo((size.width / 2), 50, (size.width / 2) + 20, 30);
    path.quadraticBezierTo(size.width - (size.width / 2) + 60, 0, size.width - (size.width / 3) + 50, 0);

    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

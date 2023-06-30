import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation/animated_list_app/details_view.dart';
import 'package:google_fonts/google_fonts.dart';

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
    /////////////////////////////////////////////////

    return Scaffold(
      appBar: const CustomAppBar(),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverPersistentHeader(
            delegate: Header(title: "Discover", viewAll: true),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: 250,
              child: Opacity(
                opacity: isStartScrolling ? opacity : 1.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: colors.length,
                  itemBuilder: (context, index) {
                    return
                        // Transform(
                        // alignment: Alignment.topLeft,
                        // transform: Matrix4.identity()
                        //   ..scale(isStartScrolling ? opacity : 1.0, opacity),
                        // child:
                        Card(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      color: colors[index],
                      child: const SizedBox(
                        width: 200,
                      ),
                      // ),
                    );
                  },
                ),
              ),
            ),
          ),
          SliverPersistentHeader(
            delegate: Header(title: "My Coupons"),
            floating: true,
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final cartItem = colors[index];

                // The first item position offset in every scroll is always = 0;
                final itemPositionOffset = index * itemHeight / 1.4;
                final difference =
                    _scrollController.offset - itemPositionOffset;
                final percent = 2 - (difference / (itemHeight / 1.1));

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
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
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
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade200, //New
                                  blurRadius: 40.0,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30)),
                            ),
                            child: Card(
                              // elevation: 20,
                              // surfaceTintColor: Colors.red,
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                              ),
                              color: cartItem,
                              child: SizedBox(
                                height: itemHeight,
                                child: Center(
                                  child: Text(
                                    "Ayman Sainshy",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(
                                          color: Colors.white,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
              childCount: colors.length,
            ),
          ),
        ],
      ),
      // bottomNavigationBar: Container(
      //   height: 100,
      //   color: Colors.black87,
      // ),
    );
  }
}

class Header extends SliverPersistentHeaderDelegate {
  final String title;
  final bool viewAll;

  Header({required this.title, this.viewAll = false});

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Padding(
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
          if (viewAll)
            Text(
              "View all>",
              style: GoogleFonts.quicksand().copyWith(
                color: Colors.grey.shade400,
                fontWeight: FontWeight.bold,
              ),
            ),
        ],
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
                  Text("Loyalty Cards",
                      style: GoogleFonts.quicksand().copyWith(
                          color: Colors.grey.shade400,
                          fontWeight: FontWeight.bold,
                          fontSize: 21)),
                  Row(
                    children: [
                      Text("Coupons",
                          style: GoogleFonts.quicksand().copyWith(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              fontSize: 24)),
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

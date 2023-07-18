import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation/animated_stacked_cart/animated_swipe_cart.dart';
import 'package:google_fonts/google_fonts.dart';

class CardDetailsView extends StatefulWidget {
  const CardDetailsView({
    required this.image,
    super.key,
  });

  final CartItemModel image;

  @override
  State<CardDetailsView> createState() => _CardDetailsViewState();
}

class _CardDetailsViewState extends State<CardDetailsView> {
  final _scrollController = ScrollController();

  late double animatedHeight = 0;
  late double animatedWidth = 0;

  late String appBarTitle = "";

  void scrollListener() {
    print("Scroll Offsets : ${_scrollController.offset}");

    if (_scrollController.offset > 460) {
      appBarTitle = "05";
    } else {
      appBarTitle = "";
    }

    animatedHeight = _scrollController.offset;
    animatedWidth = _scrollController.offset;

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        controller: _scrollController,
        clipBehavior: Clip.antiAlias,
        slivers: [
          SliverAppBar(
            elevation: 0.0,
            automaticallyImplyLeading: false,
            expandedHeight: 530,
            pinned: true,
            floating: true,
            backgroundColor: Colors.black,
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    CupertinoIcons.reply_all,
                    size: 24,
                  ),
                ),
              ),
              const Spacer(),
              Text(
                appBarTitle,
                style: GoogleFonts.playfairDisplay().copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: IconButton(
                  onPressed: () {},
                  // arrow_up_right
                  icon: const Icon(
                    CupertinoIcons.rectangle_on_rectangle_angled,
                    size: 24,
                  ),
                ),
              )
            ],
            flexibleSpace: FlexibleSpaceBar(
                stretchModes: const [
                  StretchMode.zoomBackground,
                ],
                background: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Container(
                      width: mediaQuery.width,
                      height: mediaQuery.height / 1.5,
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        image: DecorationImage(
                          image: ExactAssetImage(widget.image.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.0)),
                        ),
                      ),
                    ),
                    Container(
                      width: mediaQuery.width,
                      height: mediaQuery.height / 1.5,
                      // color: Colors.white,
                      padding: const EdgeInsets.only(top: 30),
                      child: Center(
                        child: Transform.translate(
                          offset: Offset(0, 0 + animatedHeight * 0.45),
                          child: Image.asset(
                            widget.image.image,
                            height: 335 + animatedHeight * 3,
                            width: 245 + animatedWidth * 1.4,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 30,
                      child: Column(
                        children: [
                          Text(
                            "16 JULY",
                            style: GoogleFonts.playfairDisplay().copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Container(
                            width: 70,
                            height: 2,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Stack(
                children: [
                  Transform.translate(
                    offset: Offset(
                        0 + animatedHeight * 0.4, -animatedHeight * -0.15),
                    child: Transform.translate(
                      offset: const Offset(0, -150),
                      child: Text(
                        "05",
                        style: GoogleFonts.playfairDisplay().copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 300 - animatedHeight * 0.5,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  const Positioned(
                    right: 0,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 20,
                      ),
                      child: Column(
                        children: [
                          Icon(
                            CupertinoIcons.heart,
                            color: Colors.white,
                            size: 25,
                          ),
                          SizedBox(height: 30),
                          Icon(
                            CupertinoIcons.bookmark,
                            color: Colors.white,
                            size: 25,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Transform.translate(
                offset: const Offset(0, -90),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Text(
                    "ON THE PLASTICITY OF AN ACTOR",
                    style: GoogleFonts.playfairDisplay().copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white),
                  ),
                ),
              ),
              Transform.translate(
                offset: const Offset(0, -80),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Text(
                    "Everyone has the right to freedom of thought, conscience and religion; this right includes freedom to change his religion or belief, and freedom, either alone or in community with others and in public or private, to manifest his religion or belief in teaching, practice, worship and observance. Everyone has the right to freedom of opinion and expression; this right includes freedom to hold opinions without interference and to seek, receive and impart information and ideas through any media and regardless of frontiers. Everyone has the right to rest and leisure, including reasonable limitation of working hours and periodic holidays with pay.Everyone has the right to freedom of thought, conscience and religion; this right includes freedom to change his religion or belief, and freedom, either alone or in community with others and in public or private, to manifest his religion or belief in teaching, practice, worship and observance. Everyone has the right to freedom of opinion and expression; this right includes freedom to hold opinions without interference and to seek, receive and impart information and ideas through any media and regardless of frontiers. Everyone has the right to rest and leisure, including reasonable limitation of working hours and periodic holidays with pay.Everyone has the right to freedom of thought, conscience and religion; this right includes freedom to change his religion or belief, and freedom, either alone or in community with others and in public or private, to manifest his religion or belief in teaching, practice, worship and observance. Everyone has the right to freedom of opinion and expression; this right includes freedom to hold opinions without interference and to seek, receive and impart information and ideas through any media and regardless of frontiers. Everyone has the right to rest and leisure, including reasonable limitation of working hours and periodic holidays with pay.Everyone has the right to freedom of thought, conscience and religion; this right includes freedom to change his religion or belief, and freedom, either alone or in community with others and in public or private, to manifest his religion or belief in teaching, practice, worship and observance. Everyone has the right to freedom of opinion and expression; this right includes freedom to hold opinions without interference and to seek, receive and impart information and ideas through any media and regardless of frontiers. Everyone has the right to rest and leisure, including reasonable limitation of working hours and periodic holidays with pay.",
                    style: GoogleFonts.playfairDisplay().copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}

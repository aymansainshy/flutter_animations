import 'package:flutter/material.dart';

class CardDetailsView extends StatefulWidget {
  const CardDetailsView({
    required this.image,
    super.key,
  });

  final String image;

  @override
  State<CardDetailsView> createState() => _CardDetailsViewState();
}

class _CardDetailsViewState extends State<CardDetailsView> {
  final _scrollController = ScrollController();

  late double animatedHeight = 0;
  late double animatedWidth = 0;

  void scrollListener() {
    // print( "Scroll Offsets : ${_scrollController.offset}");

    setState(() {
      animatedHeight = _scrollController.offset;
      animatedWidth = _scrollController.offset;
      print(animatedHeight);
    });
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
      body: CustomScrollView(
        controller: _scrollController,
        clipBehavior: Clip.antiAlias,
        slivers: [
          SliverAppBar(
            elevation: 0.0,
            automaticallyImplyLeading: false,
            expandedHeight: 530,
            pinned: true,
            stretch: true,
            backgroundColor: const Color.fromARGB(0, 0, 0, 1),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add_alarm_rounded),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.add_alarm_rounded),
              )
            ],
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const [
                StretchMode.zoomBackground,
              ],
              background: Container(
                width: mediaQuery.width,
                height: mediaQuery.height,
                padding: const EdgeInsets.only(top: 30),
                child: Center(
                  child: Transform.translate(
                    offset: Offset(0, 0 + animatedHeight * 0.45),
                    child: Image.asset(
                      widget.image,
                      height: 335  + animatedHeight * 3,
                      width: 245 + animatedWidth * 1.4,
                    ),
                  ),
                ),
              )

              // FadeInImage(
              //   placeholder: AssetImage(
              //     widget.image,
              //   ),
              //   image: NetworkImage(
              //     widget.image,
              //   ),
              //   fit: BoxFit.cover,
              // ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                height: 600,
                color: Colors.black,
              );
            }),
          )
        ],
      ),
    );
  }
}

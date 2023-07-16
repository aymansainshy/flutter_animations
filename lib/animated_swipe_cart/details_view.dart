import 'package:flutter/material.dart';

class CardDetailsView extends StatefulWidget {
  const CardDetailsView({super.key});

  @override
  State<CardDetailsView> createState() => _CardDetailsViewState();
}

class _CardDetailsViewState extends State<CardDetailsView> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        clipBehavior: Clip.antiAlias,
        slivers: [
          const SliverAppBar(

          ),

          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                height: 600,
                color: Colors.red,
              );
            }),
          )
        ],
      ),
    );
  }
}

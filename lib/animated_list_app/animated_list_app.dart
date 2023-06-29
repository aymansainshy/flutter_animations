import 'package:flutter/material.dart';

class AnimatedListApp extends StatelessWidget {
  const AnimatedListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Animated List"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {

              },
            ),
          ),
        ],
      ),
    );
  }
}

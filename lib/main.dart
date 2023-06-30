import 'package:flutter/material.dart';
import 'package:flutter_animation/animated_counter/tween_animation_builder.dart';
import 'package:flutter_animation/animated_list_app/animated_list_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animation',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
        // bottomNavigationBarTheme: Theme.of(context).bottomNavigationBarTheme.copyWith(
        //   backgroundColor: Colors.transparent,
        // )
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Animation"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AnimatedListApp(),
                  ),
                );
              },
              child: const Text("Animated List App"),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const TweenAnimationBuilderCounter(),
                  ),
                );
              },
              child: const Text("Animated Counter App"),
            ),
          ),
        ],
      ),
    );
  }
}

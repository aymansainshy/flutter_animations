import 'package:flutter/material.dart';

class TweenAnimationBuilderCounter extends StatefulWidget {
  const TweenAnimationBuilderCounter({super.key});

  @override
  State<TweenAnimationBuilderCounter> createState() =>
      _TweenAnimationBuilderCounterState();
}

class _TweenAnimationBuilderCounterState
    extends State<TweenAnimationBuilderCounter> {
  int _counter = 0;
  int? _oldCounter;

  void _incrementCounter() {
    _oldCounter = _counter;
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Animated Counter"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            TweenAnimationBuilder<double>(
              curve: Curves.bounceOut,
              key: Key(_counter.toString()),
              tween: Tween(begin: 0.0, end: 1.0),
              duration: const Duration(milliseconds: 500),
              builder: (context, value, _) {
                return Stack(
                  children: [
                    if (_oldCounter != null)
                      Opacity(
                        opacity: 1 * (1 - value),
                        child: Transform.translate(
                          offset: Offset(50 * value, 20 * value),
                          child: Text(
                            '$_oldCounter',
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                        ),
                      ),
                    TweenAnimationBuilder<Color?>(
                      tween:
                          ColorTween(begin: Colors.black, end: Colors.teal),
                      duration: const Duration(milliseconds: 1000),
                      builder: (context, Color? cValue, __) {
                        return Opacity(
                          opacity: value,
                          child: Transform.translate(
                            offset: Offset(-50 * (1 - value), 20 * (1 - value)),
                            child: Text(
                              '$_counter',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge
                                  ?.copyWith(
                                    color: cValue,
                                  ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details View"),
      ),
      body: Container(
        color: Colors.greenAccent,
      ),
    );
  }
}

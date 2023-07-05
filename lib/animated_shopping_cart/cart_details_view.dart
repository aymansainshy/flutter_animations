import 'package:flutter/material.dart';

class CartDetailsView extends StatelessWidget {
  const CartDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: const Text(''),
      ),
      body: const Center(
        child: Text("Details View"),
      ),
    );
  }
}

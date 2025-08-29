import 'package:flutter/material.dart';

void main() {
  runApp(const CarRental());
}

class CarRental extends StatelessWidget {
  const CarRental({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Scaffold());
  }
}

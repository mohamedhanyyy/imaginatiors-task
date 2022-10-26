import 'package:flutter/material.dart';
import 'package:task/features/product%20info/screen/product_info_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      title: 'Imaginators Task',
      debugShowCheckedModeBanner: false,
      home: const ProductInfoScreen(),
    );
  }
}

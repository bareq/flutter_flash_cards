import 'package:flashcardsflutter/features/flash_card/flash_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/flash_card/flash_card_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter fiszki',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FlashCardViewModel(),
      child: Scaffold(
        body: Center(child: FlashCardWidget()),
      ),
    );
  }
}

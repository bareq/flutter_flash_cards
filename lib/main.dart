import 'package:flashcardsflutter/features/flash_card/flash_card_widget.dart';
import 'package:flashcardsflutter/features/flash_card/repository/local_file/local_file_flash_cards_repository.dart';
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
      home: ChangeNotifierProvider(
          create: (context) => FlashCardViewModel(
              flashCardsRepository: LocalFileFlashCardsRepository()),
          child: const MyHomePage()),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final flashCardViewModel = context.watch<FlashCardViewModel>();
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(child: FlashCardWidget()),
          if (flashCardViewModel.cardFlipped)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                  ),
                  onPressed: () {
                    flashCardViewModel.nextCard();
                  },
                  child: const Text('Znałem'),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                  ),
                  onPressed: () {
                    flashCardViewModel.nextCard();
                  },
                  child: const Text('Nie znałem'),
                ),
              ],
            )
        ],
      )),
    );
  }
}

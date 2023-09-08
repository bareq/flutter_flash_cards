import 'package:flashcardsflutter/di/di_configuration.dart';
import 'package:flashcardsflutter/features/flash_card/di/flash_card_module.dart';
import 'package:flashcardsflutter/features/flash_card/widget/flash_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'features/flash_card/repository/flash_cards_repository.dart';
import 'features/flash_card/view_model/flash_card_view_model.dart';

void main() {
  DIConfiguration(modulesList: [FlashCardModule()]).configure();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final getIt = GetIt.instance;
    return MaterialApp(
      title: 'Flutter fiszki',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(
          create: (context) => FlashCardViewModel(
              flashCardsRepository: getIt<FlashCardsRepository>()),
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
            AnswerButtons(flashCardViewModel: flashCardViewModel)
        ],
      )),
    );
  }
}

class AnswerButtons extends StatelessWidget {
  const AnswerButtons({
    super.key,
    required this.flashCardViewModel,
  });

  final FlashCardViewModel flashCardViewModel;

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}

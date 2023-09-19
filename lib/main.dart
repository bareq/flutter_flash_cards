import 'package:flashcardsflutter/di/di_configuration.dart';
import 'package:flashcardsflutter/features/flash_card/di/flash_card_module.dart';
import 'package:flashcardsflutter/features/game_screen/widget/game_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'features/flash_card/repository/flash_cards_repository.dart';
import 'features/flash_card/view_model/flash_card_view_model.dart';
import 'features/main_menu/view_model/main_menu_view_model.dart';
import 'features/main_menu/widget/main_menu.dart';

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
      home: MultiProvider(providers: [
        ChangeNotifierProvider(
            create: (context) => FlashCardViewModel(
                flashCardsRepository: getIt<FlashCardsRepository>())),
        ChangeNotifierProvider(create: (context) => MainMenuViewModel())
      ], child: const MyHomePage()),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final mainMenuViewModel = context.watch<MainMenuViewModel>();
    Widget selectedWidget =
        getSelectedWidget(mainMenuViewModel.selectedMenuItem);
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        title: const Text('Flutter fiszki'),
      ),
      drawer: const MainMenu(),
      body: selectedWidget,
    );
  }

  Widget getSelectedWidget(int selectedMenuItem) {
    switch (selectedMenuItem) {
      case 0:
        return const GameScreen();
      case 1:
        return const GameScreen();
      default:
        return const GameScreen();
    }
  }
}

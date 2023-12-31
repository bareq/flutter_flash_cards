import 'package:flashcardsflutter/di/di_configuration.dart';
import 'package:flashcardsflutter/features/answers/di/answers_module.dart';
import 'package:flashcardsflutter/features/flash_card/di/flash_card_module.dart';
import 'package:flashcardsflutter/features/game_mode/di/game_mode_module.dart';
import 'package:flashcardsflutter/features/game_screen/widget/game_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'features/flash_card/view_model/flash_card_view_model.dart';
import 'features/main_menu/view_model/main_menu_view_model.dart';
import 'features/main_menu/widget/main_menu.dart';

void main() {
  DIConfiguration(
          modulesList: [GameModeModule(), AnswersModule(), FlashCardModule()])
      .configure();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final getIt = GetIt.instance;
    return MaterialApp(
      onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: MultiProvider(providers: [
        ChangeNotifierProvider(
            create: (context) => FlashCardViewModel(
                getCurrentCardUseCase: getIt.get(),
                fetchFlashCardsUseCase: getIt.get(),
                saveAnswerUseCase: getIt.get(),
                fetchAnswersUseCase: getIt.get())),
        ChangeNotifierProvider(
            create: (context) => MainMenuViewModel(
                updateGameModeUseCase: getIt.get(),
                getCurrentGameModeUseCase: getIt.get()))
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
        title: Text(AppLocalizations.of(context)!.appTitle),
      ),
      drawer: const MainMenu(),
      body: selectedWidget,
    );
  }

  Widget getSelectedWidget(int selectedMenuItem) {
    const gameScreen = GameScreen();
    switch (selectedMenuItem) {
      case 0:
        return gameScreen;
      case 1:
        return gameScreen;
      default:
        return gameScreen;
    }
  }
}

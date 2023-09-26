import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../flash_card/view_model/flash_card_view_model.dart';
import '../../flash_card/widget/flash_card_widget.dart';
import 'answer_buttons.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final flashCardViewModel = context.watch<FlashCardViewModel>();
    return Center(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: () {
              if (flashCardViewModel.currentFlashCard != null) {
                return flashCard(flashCardViewModel.cardFlipped);
              } else {
                return [const Text("Brak fiszek")];
              }
            }()));
  }

  List<Widget> flashCard(bool cardFlipped) {
    return [
      const Flexible(child: FlashCardWidget()),
      if (cardFlipped) const AnswerButtons()
    ];
  }
}

import 'package:flashcardsflutter/features/flash_card/view_model/flash_card_view_model.dart';
import 'package:flashcardsflutter/features/flash_card/widget/flash_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../texts/flash_card_description.dart';
import '../texts/flash_card_word.dart';

class CardAnswerSide extends StatelessWidget {
  const CardAnswerSide({super.key});

  @override
  Widget build(BuildContext context) {
    final flashCardViewModel = context.watch<FlashCardViewModel>();

    List<Widget> content = [];
    if (flashCardViewModel.cardFlipped) {
      content = [
        FlashCardWord(text: flashCardViewModel.currentFlashCard?.answer ?? ""),
        FlashCardDescription(
            text: flashCardViewModel.currentFlashCard?.answerDescription ?? "")
      ];
    }

    return FractionallySizedBox(
      widthFactor: cardWidthPercentage,
      heightFactor: cardHeightPercentage,
      child: Card(
        color: Theme.of(context).colorScheme.secondary,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: content,
          ),
        ]),
      ),
    );
  }
}

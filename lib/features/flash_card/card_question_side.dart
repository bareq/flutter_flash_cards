import 'package:flashcardsflutter/features/flash_card/flash_card_view_model.dart';
import 'package:flashcardsflutter/features/flash_card/flash_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'flash_card_description.dart';
import 'flash_card_word.dart';

class CardQuestionSide extends StatelessWidget {
  const CardQuestionSide({super.key});

  @override
  Widget build(BuildContext context) {
    final flashCardViewModel = context.watch<FlashCardViewModel>();

    return FractionallySizedBox(
      widthFactor: cardWidthPercentage,
      heightFactor: cardHeightPercentage,
      child: Card(
        color: Theme.of(context).colorScheme.primary,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FlashCardWord(
                  text: flashCardViewModel.currentFlashCard?.question ?? ""),
              FlashCardDescription(
                  text: flashCardViewModel
                          .currentFlashCard?.questionDescription ??
                      "")
            ],
          ),
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [FlipCardButton()],
            ),
          )
        ]),
      ),
    );
  }
}

class FlipCardButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final flashCardViewModel = context.watch<FlashCardViewModel>();

    return Padding(
      padding: const EdgeInsets.all(8),
      child: IconButton(
        padding: EdgeInsets.all(16.0),
        color: Colors.white,
        iconSize: 32,
        icon: Icon(Icons.loop),
        onPressed: () {
          flashCardViewModel.flipCard();
        },
      ),
    );
  }
}

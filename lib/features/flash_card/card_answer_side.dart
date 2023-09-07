import 'package:flashcardsflutter/features/flash_card/flash_card_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardAnswerSide extends StatelessWidget {
  const CardAnswerSide({super.key});

  @override
  Widget build(BuildContext context) {
    final flashCardViewModel = context.watch<FlashCardViewModel>();

    return FractionallySizedBox(
      widthFactor: .8,
      heightFactor: .3,
      child: Card(
        color: Theme.of(context).colorScheme.secondary,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FlashCardWord(text: flashCardViewModel.currentFlashCard.answer),
              FlashCardDescription(
                  text: flashCardViewModel.currentFlashCard.answerDescription)
            ],
          ),
        ]),
      ),
    );
  }
}

class FlashCardWord extends StatelessWidget {
  final String text;

  const FlashCardWord({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(text, style: TextStyle(fontSize: 32, color: Colors.white)),
    );
  }
}

class FlashCardDescription extends StatelessWidget {
  final String text;

  const FlashCardDescription({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Text(text, style: TextStyle(fontSize: 16, color: Colors.white)),
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

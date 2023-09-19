import 'package:flutter/material.dart';

import '../../flash_card/view_model/flash_card_view_model.dart';

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

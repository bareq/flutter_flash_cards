import 'dart:math';

import 'package:flashcardsflutter/features/flash_card/card_answer_side.dart';
import 'package:flashcardsflutter/features/flash_card/card_question_side.dart';
import 'package:flashcardsflutter/features/flash_card/flash_card_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FlashCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final flashCardViewModel = context.watch<FlashCardViewModel>();

    return AnimatedSwitcher(
      transitionBuilder: (widget, animation) => createCardFlipAnimation(
          widget, animation, flashCardViewModel.cardFlipped),
      duration: Duration(milliseconds: 400),
      child: flashCardViewModel.cardFlipped
          ? CardAnswerSide(key: ValueKey(false))
          : CardQuestionSide(key: ValueKey(true)),
    );
  }

  Widget createCardFlipAnimation(
      Widget widget, Animation<double> animation, bool cardFlipped) {
    final rotateAnim = Tween(begin: pi, end: 0.0).animate(animation);
    return AnimatedBuilder(
      animation: rotateAnim,
      child: widget,
      builder: (context, widget) {
        final isUnder = (ValueKey(cardFlipped) != widget!.key);
        final value =
            isUnder ? min(rotateAnim.value, pi / 2) : rotateAnim.value;
        return Transform(
          transform: Matrix4.rotationY(value),
          child: widget,
          alignment: Alignment.center,
        );
      },
    );
  }
}

import 'dart:math';

import 'package:flashcardsflutter/features/flash_card/view_model/flash_card_view_model.dart';
import 'package:flashcardsflutter/features/flash_card/widget/answer_side/card_answer_side.dart';
import 'package:flashcardsflutter/features/flash_card/widget/question_side/card_question_side.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const cardWidthPercentage = .8;
const cardHeightPercentage = .3;

class FlashCardWidget extends StatelessWidget {
  const FlashCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final flashCardViewModel = context.watch<FlashCardViewModel>();

    return AnimatedSwitcher(
      transitionBuilder: (widget, animation) => createCardFlipAnimation(
          widget, animation, flashCardViewModel.cardFlipped),
      duration: const Duration(milliseconds: 400),
      child: flashCardViewModel.cardFlipped
          ? const CardAnswerSide(key: ValueKey(false))
          : const CardQuestionSide(key: ValueKey(true)),
    );
  }

  Widget createCardFlipAnimation(
      Widget widget, Animation<double> animation, bool cardFlipped) {
    if (!cardFlipped) {
      return FadeTransition(opacity: animation, child: widget);
    } else {
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
            alignment: Alignment.center,
            child: widget,
          );
        },
      );
    }
  }
}

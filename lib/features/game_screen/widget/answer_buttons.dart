import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../flash_card/view_model/flash_card_view_model.dart';

class AnswerButtons extends StatelessWidget {
  const AnswerButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final flashCardViewModel = context.watch<FlashCardViewModel>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.greenAccent,
          ),
          onPressed: () {
            flashCardViewModel.wordKnownClicked();
          },
          child: Text(AppLocalizations.of(context)!.iKnew),
        ),
        const SizedBox(width: 16),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.redAccent,
          ),
          onPressed: () {
            flashCardViewModel.wordUnknownClicked();
          },
          child: Text(AppLocalizations.of(context)!.iDidntKnow),
        ),
      ],
    );
  }
}

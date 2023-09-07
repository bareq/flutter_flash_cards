import 'package:flutter/material.dart';

class FlashCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: .8,
      heightFactor: .3,
      child: Card(
        color: Theme.of(context).colorScheme.primary,
        child: Column(children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [FlashCardWord(), FlashCardDescription()],
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
    return Padding(
      padding: const EdgeInsets.all(8),
      child: IconButton(
        padding: EdgeInsets.all(16.0),
        color: Colors.white,
        iconSize: 32,
        icon: Icon(Icons.loop),
        onPressed: () {},
      ),
    );
  }
}

class FlashCardWord extends StatelessWidget {
  const FlashCardWord({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: const Text("FlashCard",
          style: TextStyle(fontSize: 32, color: Colors.white)),
    );
  }
}

class FlashCardDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: const Text(
          "description or details which helps to understand a word",
          style: TextStyle(fontSize: 16, color: Colors.white)),
    );
  }
}

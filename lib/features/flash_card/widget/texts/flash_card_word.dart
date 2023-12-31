import 'package:flutter/material.dart';

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
      child:
          Text(text, style: const TextStyle(fontSize: 32, color: Colors.white)),
    );
  }
}

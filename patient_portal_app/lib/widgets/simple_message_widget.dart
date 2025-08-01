import 'package:flutter/material.dart';

class SimpleMessageWidget extends StatelessWidget {
  final String message;
  const SimpleMessageWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      );
  }
}
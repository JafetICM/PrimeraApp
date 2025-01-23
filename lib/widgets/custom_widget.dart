//lib/widgets/custom_widget.dart
import 'package:flutter/material.dart';

class CustomWidget extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const CustomWidget({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        color: Colors.blue,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

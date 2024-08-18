import "package:flutter/material.dart";

class MyButton extends StatelessWidget {
  const MyButton(
      {super.key,
      required this.text,
      required this.color,
      required this.textColor,
      required this.handleTap});

  final String text;
  final Color color;
  final Color textColor;
  final void Function(String) handleTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => handleTap(text),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
            color: color,
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

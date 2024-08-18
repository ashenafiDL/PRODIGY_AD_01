import "package:flutter/material.dart";

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.text,
    required this.color,
    required this.textColor,
  });

  final String text;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}

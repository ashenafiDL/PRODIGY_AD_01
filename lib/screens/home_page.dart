import "package:flutter/material.dart";
import "package:prodigy_ad_01/widgets/button.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List buttons = [
    "C",
    "DEL",
    "%",
    "/",
    "9",
    "8",
    "7",
    "*",
    "6",
    "5",
    "4",
    "-",
    "3",
    "2",
    "1",
    "+",
    "0",
    ".",
    "ANS",
    "="
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surfaceDim,
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(child: Text("Hello World")),
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  itemCount: buttons.length,
                  itemBuilder: (context, index) {
                    var color = index == 0
                        ? theme.colorScheme.error
                        : index == 1
                            ? theme.colorScheme.primary
                            : _isOperator(buttons[index])
                                ? theme.colorScheme.inverseSurface
                                : theme.colorScheme.surface;
                    var textColor = index == 0
                        ? theme.colorScheme.onError
                        : index == 1
                            ? theme.colorScheme.onSurface
                            : _isOperator(buttons[index])
                                ? theme.colorScheme.onInverseSurface
                                : theme.colorScheme.onSurface;

                    return MyButton(
                      text: buttons[index],
                      textColor: textColor,
                      color: color,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _isOperator(String text) {
    return text == "+" ||
        text == "-" ||
        text == "*" ||
        text == "/" ||
        text == "%" ||
        text == "=";
  }
}

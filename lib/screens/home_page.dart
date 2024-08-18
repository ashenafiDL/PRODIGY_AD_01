import "package:flutter/material.dart";
import "package:prodigy_ad_01/widgets/button.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userInput = "";
  var answer = "0";

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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      alignment: AlignmentDirectional.centerEnd,
                      child:
                          Text(userInput, style: theme.textTheme.displayMedium),
                    ),
                    Container(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text(answer, style: theme.textTheme.displaySmall),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainer,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
              ),
              height: MediaQuery.of(context).size.height * 0.6,
              alignment: AlignmentDirectional.centerEnd,
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
                          ? theme.colorScheme.onInverseSurface
                          : _isOperator(buttons[index])
                              ? theme.colorScheme.onInverseSurface
                              : theme.colorScheme.onSurface;

                  return MyButton(
                    text: buttons[index],
                    textColor: textColor,
                    color: color,
                    handleTap: _handleTap,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleTap(String text) {
    if (text == "C") {
      userInput = "";
      answer = "0";
    } else if (text == "DEL") {
      if (userInput.isNotEmpty) {
        userInput = userInput.substring(0, userInput.length - 1);
      }
    } else if (text == "ANS") {
      userInput += answer;
    } else if (text == "=") {
      answer = userInput;
    } else {
      userInput += text;
    }
    setState(() {});
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

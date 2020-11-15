import 'package:flutter/material.dart';
import 'package:meeting_app/src/home/store/home.dart';
import 'package:provider/provider.dart';

import 'style.dart';

class Keypad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        keypadRow(['1', '2', '3']),
        keypadRow(['4', '5', '6']),
        keypadRow(['7', '8', '9']),
        keypadRow(['x', '0', '<-']),
      ],
    );
  }

  Widget keypadRow(List<String> keys) {
    return Row(
        mainAxisSize: MainAxisSize.min,
        children: keys
            .map(
              (key) => KeypadButton(
                buttonString: key,
              ),
            )
            .toList());
  }
}

class KeypadButton extends StatelessWidget {
  final String buttonString;

  const KeypadButton({Key key, this.buttonString}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final home = Provider.of<Home>(context);
    return TextButton(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
        child: Text(
          buttonString,
          style: Style.keypadStyle,
        ),
      ),
      onPressed: () => home.process(buttonString),
    );
  }
}

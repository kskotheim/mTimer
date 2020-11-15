
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

Future<String> getStringFromDialog(String prompt, BuildContext context) {
  return showDialog<String>(
    context: context,
    builder: (context) {
      return DialogStringTextField(prompt);
    },
  );
}

class DialogStringTextField extends HookWidget {
  final String prompt;
  DialogStringTextField(this.prompt);
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = useTextEditingController();

    return SimpleDialog(
      title: Text(prompt),
      children: [
        Container(
          width: 80.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.text,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RaisedButton(
              child: Text('Cancel'),
              onPressed: () => Navigator.pop(context),
            ),
            RaisedButton(
              child: Text('Submit'),
              onPressed: () =>
                  Navigator.pop(context, controller.text),
            ),
          ],
        ),
      ],
    );
  }
}

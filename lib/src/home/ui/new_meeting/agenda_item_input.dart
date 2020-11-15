import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:meeting_app/src/home/store/meeting.dart';
import 'package:meeting_app/src/material/widgets.dart';
import 'package:provider/provider.dart';

class AgendaItemInput extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final meeting = Provider.of<Meeting>(context);

    // set the text editing controller value and selection in case this field is rebuilt
    final TextEditingController inputController = TextEditingController(text: meeting.newItemName);
    inputController.selection = TextSelection.fromPosition(TextPosition(offset: inputController.text.length));

    return Observer(
      builder: (_) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Text('Item: ', style: Style.subTitleStyle),
          Container(
            width: 150.0,
            child: Theme(
              data: Theme.of(context).copyWith(textSelectionHandleColor: meeting.newItemColor),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Item:',
                  labelStyle: TextStyle(color: Colors.black),
                  focusColor: meeting.newItemColor,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: meeting.newItemColor),
                  ),
                ),
                cursorColor: meeting.newItemColor,
                controller: inputController,
                onChanged: meeting.updateNewItemName,
                onSubmitted: (_) {
                  inputController.clear();
                  meeting.createAgendaItem();
                },
              ),
            ),
          ),
          Container(width: 5),
          GestureDetector(
            onTap: meeting.changeNewItemColor,
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: meeting.newItemColor,
                borderRadius: BorderRadius.circular(5),
              ),
              // child: Text('${meeting.newItemMinutes}'),
            ),
          ),
        ],
      ),
    );
  }
}

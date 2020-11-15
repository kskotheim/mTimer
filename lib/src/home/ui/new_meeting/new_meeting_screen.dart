import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:meeting_app/src/data/db.dart';
import 'package:meeting_app/src/home/store/meeting.dart';
import 'package:meeting_app/src/home/ui/new_meeting/agenda_display.dart';
import 'package:meeting_app/src/home/ui/new_meeting/agenda_item_input.dart';
import 'package:meeting_app/src/home/ui/new_meeting/meeting_title.dart';
import 'package:meeting_app/src/home/ui/new_meeting/minutes_input.dart';
import 'package:meeting_app/src/material/widgets.dart';
import 'package:provider/provider.dart';

class CreateMeetingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final meeting = Provider.of<Meeting>(context);

    return Observer(builder: (_) {
      return SingleChildScrollView(
        child: MTimerBanner(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(height: 144),
              MeetingTitle(),
              MeetingAgendaDisplay(),

              // show widgets for adding an agenda item if able
              if (meeting.canAddMoreItems) ...[
                AgendaItemInput(),
                MinutesInput(),
                MeetingButtonOutlined(
                  title: 'Add',
                  color: meeting.newItemColor,
                  onPressed: meeting.createAgendaItem,
                ),
              ],

              MeetingButton(
                onPressed: () {
                  DatabaseManager db = DB();
                  db.createMeeting('new meeting');
                },
                title: 'Create',
                color: Style.greenColor,
              )
            ],
          ),
        ),
      );
    });
  }
}

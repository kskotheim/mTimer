import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:meeting_app/src/home/store/home.dart';
import 'package:meeting_app/src/home/store/meeting.dart';
import 'package:meeting_app/src/material/widgets.dart';
import 'package:provider/provider.dart';

class MeetingTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var meeting = Provider.of<Meeting>(context);
    var home = Provider.of<Home>(context);

    return Observer(builder: (_) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: Icon(Icons.cancel, color: Colors.red.shade700),
            onPressed: () {
              meeting.resetMeeting();
              home.cancelCreateMeeting();
            },
          ),
          Flexible(
            child: Text('${meeting.meetingName}\n\n${meeting.totalMeetingTime} minutes\n', textAlign: TextAlign.center, style: Style.subTitleStyle),
          ),
          IconButton(
            onPressed: () => getStringFromDialog('Timer Name: ', context).then(meeting.setMeetingName),
            icon: Icon(Icons.edit),
          ),
        ],
      );
    });
  }
}

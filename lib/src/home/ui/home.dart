import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:meeting_app/src/home/store/home.dart';
import 'package:meeting_app/src/material/widgets.dart';
import 'package:provider/provider.dart';

export 'join_meeting_screen.dart';
export 'new_meeting/new_meeting_screen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final home = Provider.of<Home>(context);
    return MTimerBanner(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MeetingButton(
              icon: Icons.add,
              onPressed: home.createMeetingPressed,
              title: 'New',
              color: Style.greenColor,
            ),
            MeetingButton(
              icon: Icons.arrow_right,
              onPressed: home.enterCodePressed,
              title: 'Join',
              color: Style.yellowColor,
            ),
          ],
        ),
      ),
    );
  }
}

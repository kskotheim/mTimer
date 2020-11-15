import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:meeting_app/src/home/store/home.dart';
import 'package:meeting_app/src/material/widgets.dart';
import 'package:provider/provider.dart';

class ConnectToMeetingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final home = Provider.of<Home>(context);

    return MTimerBanner(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(height: MediaQuery.of(context).size.height * .25),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Meeting Code:'),
              Observer(builder: (_) {
                return MeetingButton(
                  onPressed: () => print('boop'),
                  title: '${home.code}',
                  color: Style.yellowColor,
                );
              }),
              Container(height: 25.0),
            ],
          ),
          Keypad(),
        ],
      ),
    );
  }
}

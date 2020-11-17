import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:meeting_app/src/home/store/auth.dart';
import 'package:meeting_app/src/home/store/home.dart';
import 'package:meeting_app/src/home/store/meeting.dart';
import 'package:meeting_app/src/home/store/meeting_controller.dart';
import 'package:meeting_app/src/material/banner.dart';
import 'package:meeting_app/src/home/ui/home.dart';
import 'package:provider/provider.dart';
import 'src/material/widgets.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'm:Timer', theme: ThemeData(fontFamily: 'Ubuntu'), home: MainPage());
  }
}

class MainPage extends StatelessWidget {
  final auth = Auth();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Home>(
          create: (_) => Home(auth: auth),
        ),
        Provider<Meeting>(
          create: (_) => Meeting(auth: auth),
        ),
        Provider<Auth>(
          create: (_) => auth,
        )
      ],
      child: Scaffold(
        backgroundColor: Style.bgColor,
        body: Observer(
          builder: (context) {
            final home = Provider.of<Home>(context);

            switch (home.state) {
              case HomeState.home:
                return HomePage();
              case HomeState.connect:
                return ConnectToMeetingScreen();
              case HomeState.create:
                return CreateMeetingScreen();
              case HomeState.meet:
                return MeetingPage();
            }
          },
        ),
      ),
    );
  }
}

class MeetingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context);
    final home = Provider.of<Home>(context);
    final meetingController = MeetingController(meeting: home.meeting.value, userId: auth.userId);

    return Provider<MeetingController>(
      create: (_) => meetingController,
      child: MTimerBanner(
        child: Observer(
          builder: (_) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(meetingController.meeting.name),

                PieChart(meetingController.meeting.items, currentTime: meetingController.currentTime,),

                meetingController.meetingIsStarted
                    ? Text(meetingController.currentTimerString)
                    : TextButton(
                        child: Text('start'),
                        onPressed: meetingController.startMeeting,
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

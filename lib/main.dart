import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:meeting_app/src/home/store/home.dart';
import 'package:meeting_app/src/home/store/meeting.dart';
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
  final home = Home();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Home>(
          create: (_) => home,
        ),
        Provider<Meeting>(
          create: (_) => Meeting(),
        )
      ],
      child: Scaffold(
        backgroundColor: Style.bgColor,
        body: Observer(
          builder: (_) {
            switch (home.state) {
              case HomeState.home:
                return HomePage();
              case HomeState.connect:
                return ConnectToMeetingScreen();
              case HomeState.create:
                return CreateMeetingScreen();
            }
          },
        ),
      ),
    );
  }
}

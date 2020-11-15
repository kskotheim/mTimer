import 'package:flutter/material.dart';
import 'package:meeting_app/src/material/widgets.dart';

class MTimerBanner extends StatelessWidget {
  final Widget child;

  const MTimerBanner({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final banner = Image.asset(
      'assets/banner.png',
      width: MediaQuery.of(context).size.width,
    );
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: banner,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              'm:Timer',
              style: Style.subTitleStyle,
            ),
          ),
        ),
        Center(
          child: child,
        )
      ],
    );
  }
}

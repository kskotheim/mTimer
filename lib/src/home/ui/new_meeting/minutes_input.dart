import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:meeting_app/src/home/store/meeting.dart';
import 'package:meeting_app/src/material/widgets.dart';
import 'package:provider/provider.dart';

class MinutesInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var meeting = Provider.of<Meeting>(context);

    return Observer(
      builder: (_) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('${meeting.newItemMinutes}min', style: Style.subTitleStyle),
                Container(width: 20),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      child: Icon(Icons.arrow_upward, size: 15,),
                      onTap: () => meeting.incrementItemMinutes(1),
                      onLongPress: () => meeting.startFastIncrement(1),
                      onLongPressEnd: meeting.endFastIncrement,
                    ),
                    GestureDetector(
                      child: Icon(Icons.arrow_downward, size: 15),
                      onTap: () => meeting.incrementItemMinutes(-1),
                      onLongPress: () => meeting.startFastIncrement(-1),
                      onLongPressEnd: meeting.endFastIncrement,
                    ),
                  ],
                ),
              ],
            ),
            SliderTheme(
              data: SliderThemeData(
                  inactiveTrackColor: Style.bannerColorFaded,
                  activeTrackColor: meeting.newItemColor,
                  trackHeight: 2,
                  thumbColor: Style.bannerColor,
                  thumbShape: MeetingSliderShape()
                  // thumbShape: RectangularSliderValueIndicatorShape(),
                  ),
              child: Slider(
                value: meeting.newItemMinutes.toDouble(),
                min: meeting.minItemMinutes.toDouble(),
                max: meeting.maxItemMinutes.toDouble(),
                onChanged: (val) => meeting.setItemMinutes(val.round()),
              ),
            )
          ],
        );
      },
    );
  }
}

class MeetingSliderShape extends SliderComponentShape {
  static const MINUTES_HAND_LENGTH = 12.0;
  static const HOUR_HAND_LENGTH = 8.0;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.square(30);
  }

  @override
  void paint(PaintingContext context, Offset center,
      {Animation<double> activationAnimation,
      Animation<double> enableAnimation,
      bool isDiscrete,
      TextPainter labelPainter,
      RenderBox parentBox,
      SliderThemeData sliderTheme,
      TextDirection textDirection,
      double value,
      double textScaleFactor,
      Size sizeWithOverflow}) {
    final canvas = context.canvas;

    final facePaint = Paint()
      ..color = Style.bannerColorFaded
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    final borderPaint = Paint()
      ..color = Style.bgColor
      ..style = PaintingStyle.fill;
    final handsPaint = Paint()
      ..color = Style.bannerColorFaded
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    // draw bg behind clock
    canvas.drawCircle(center, 20, borderPaint);
    //draw clock face
    canvas.drawCircle(center, 15, facePaint);
    //draw hour hand
    double hourAngle = (value * 2 * pi) / 12;

    canvas.drawLine(center, center.translate(sin(hourAngle) * HOUR_HAND_LENGTH, -1 * cos(hourAngle) * HOUR_HAND_LENGTH),
        handsPaint);

    //draw minute hand
    double minutesAngle = (value * 2 * pi);

    canvas.drawLine(
        center,
        center.translate(sin(minutesAngle) * MINUTES_HAND_LENGTH, -1 * cos(minutesAngle) * MINUTES_HAND_LENGTH),
        handsPaint);
  }
}

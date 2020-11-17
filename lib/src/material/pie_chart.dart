
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:meeting_app/src/home/model/agenda_item.dart';
import 'package:meeting_app/src/home/model/meeting.dart';
import 'package:meeting_app/src/material/style.dart';


class PieChart extends StatelessWidget {
  final List<AgendaItem> items;
  final int currentTime;

  PieChart(this.items, {this.currentTime});

  @override
  Widget build(BuildContext context) {
    return Center(
      // circle display
      child: SizedBox(
        width: 150,
        height: 150,
        child: CustomPaint(
          painter: AgendaPainter(items, currentTime: currentTime),
        ),
      ),
    );
  }
}

class AgendaPainter extends CustomPainter {
  static const WHEEL_SIZE = 150.0;
  final List<AgendaItem> items;
  final int currentTime;
  final int totalTime;
  List<double> ratios;
  double currentAngle = -pi / 2;
  Paint outlinePaint = Paint()
    ..style = PaintingStyle.stroke
    ..color = Style.bannerColor
    ..strokeWidth = 2.5;

  AgendaPainter(this.items, {this.currentTime}) : totalTime = items.fold(0, (previousValue, element) => previousValue + element.minutes) {
    ratios = items.map((item) => item.minutes / totalTime).toList();
  }

  @override
  void paint(Canvas canvas, Size size) {
    // paint objects for each agenda item
    final paintObjs = items
        .map((e) => Paint()
          ..style = PaintingStyle.fill
          ..color = e.color)
        .toList();

    // the center of the circle
    final center = Offset(size.width * .5, size.height * .5);

    // draw arc for items
    for (int i = 0; i < items.length; i++) {
      canvas.drawArc(Rect.fromCenter(center: center, width: WHEEL_SIZE, height: WHEEL_SIZE), currentAngle,
          ratios[i] * 2 * pi, true, paintObjs[i]);
      currentAngle += ratios[i] * 2 * pi;
    }

    // draw '0' line
    canvas.drawLine(center, center.translate(0, -1 * WHEEL_SIZE * .5), outlinePaint);

    // draw outline
    canvas.drawCircle(center, WHEEL_SIZE * .5, outlinePaint);

    if(currentTime != null){
      double pctDone = currentTime / (totalTime * 60);
      double angle = pctDone * 2 * pi;
      //  draw timer 'ticker'
      canvas.drawLine(center, center.translate(WHEEL_SIZE * .5 * sin(angle), WHEEL_SIZE * .5 * -cos(angle)), outlinePaint);


    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

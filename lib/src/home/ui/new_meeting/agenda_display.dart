import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:meeting_app/src/home/model/agenda_item.dart';
import 'package:meeting_app/src/home/store/meeting.dart';
import 'package:meeting_app/src/material/widgets.dart';
import 'package:provider/provider.dart';

class MeetingAgendaDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final meeting = Provider.of<Meeting>(context);

    return Observer(
      builder: (_) {
        return Stack(
          children: [
            Center(
              // circle display
              child: SizedBox(
                width: 150,
                height: 150,
                child: CustomPaint(
                  painter: AgendaPainter(meeting.agendaItems, meeting.totalMeetingTime),
                ),
              ),
            ),

            // item names
            SizedBox(
              height: 160,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Descriptions(meeting.secondItems),
                  SizedBox(
                    width: 150,
                  ),
                  Descriptions(meeting.firstItems),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}

class Descriptions extends StatelessWidget {
  final List<AgendaItem> items;

  Descriptions(this.items);

  @override
  Widget build(BuildContext context) {
    final meeting = Provider.of<Meeting>(context);
    final sideWidth = (MediaQuery.of(context).size.width - 180) * .5;
    return Container(
      width: sideWidth,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: items.map((element) {
            // final offset = ValueNotifier<double>(0);
            return Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
              // child: GestureDetector(
              //   onHorizontalDragUpdate: (details) {
              //     offset.value = details.localPosition.dx;
              //   },
              //   onHorizontalDragEnd: (details){
              //     offset.value = 0;
              //   },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () => meeting.changeItemColor(element),
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: element.color,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  Container(
                    width: 5,
                  ),
                  // ValueListenableBuilder<double>(
                  //   valueListenable: offset,
                  //   builder: (context, val, _) {
                  //     print('updated val');
                  //     return Padding(
                  //       padding: val > 0 ? EdgeInsets.only(left: val) : EdgeInsets.only(right: val.abs()),
                  //       child:
                  Container(
                    width: sideWidth - 28,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: Text(element.name),
                        ),
                        Text(
                          '${element.minutes} min',
                          style: TextStyle(fontStyle: FontStyle.italic, color: Style.bannerColorFaded),
                        ),
                      ],
                    ),
                  ),
                  // );
                  // },
                  // ),
                  // ),
                  // ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class AgendaPainter extends CustomPainter {
  static const WHEEL_SIZE = 150.0;

  final List<AgendaItem> items;
  final int totalTime;
  List<double> ratios;
  double currentAngle = -pi / 2;
  Paint outlinePaint = Paint()
    ..style = PaintingStyle.stroke
    ..color = Style.bannerColor
    ..strokeWidth = 2.5;

  AgendaPainter(this.items, this.totalTime) {
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
    canvas.drawLine(center, Offset(size.width * .5, size.height * .5 - (WHEEL_SIZE * .5)), outlinePaint);

    // draw outline
    canvas.drawCircle(center, WHEEL_SIZE * .5, outlinePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

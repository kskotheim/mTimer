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
            PieChart(meeting.agendaItems),

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

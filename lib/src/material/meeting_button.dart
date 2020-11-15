import 'package:flutter/material.dart';

import 'style.dart';

class MeetingButton extends StatelessWidget {
  static const BUTTON_WIDTH = 80.0;

  final Function onPressed;
  final String title;
  final Color color;
  final IconData icon;

  MeetingButton({this.onPressed, this.title, this.color = Style.bannerColor, this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Container(
        width: BUTTON_WIDTH,
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              icon != null
                  ? Icon(
                      icon,
                      color: Style.bannerColor,
                    )
                  : Container(),
              Text(
                title,
                style: Style.subTitleStyle,
              ),
            ],
          ),
        ),
      ),
      style: ElevatedButton.styleFrom(primary: color),
    );
  }
}

class MeetingButtonOutlined extends StatelessWidget {
  static const BUTTON_WIDTH = 80.0;

  final Function onPressed;
  final String title;
  final Color color;
  final IconData icon;

  MeetingButtonOutlined({this.onPressed, this.title, this.color = Style.bannerColor, this.icon});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        side: MaterialStateProperty.all<BorderSide>(
          BorderSide(color: color, width: 2),
        ),
      ),
      child: Container(
        width: BUTTON_WIDTH,
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              icon != null
                  ? Icon(
                      icon,
                      color: Style.bannerColor,
                    )
                  : Container(),
              Text(
                title,
                style: Style.subTitleStyle,
              ),
            ],
          ),
        ),
      ),
      // style: OutlinedButton.styleFrom(primary: color),
    );
  }
}

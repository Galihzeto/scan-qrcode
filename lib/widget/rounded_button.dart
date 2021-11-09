import 'package:flutter/material.dart';

class GeneralRoundedButton extends StatefulWidget {
  final String text;
  final Color color;
  final GestureTapCallback onPressed;

  const GeneralRoundedButton(
      {required this.text, required this.color, required this.onPressed});

  @override
  _GeneralRoundedButtonState createState() => _GeneralRoundedButtonState();
}

class _GeneralRoundedButtonState extends State<GeneralRoundedButton> {
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(64.0))),
      onPressed: widget.onPressed,
      elevation: 0.0,
      fillColor: widget.color,
      splashColor: Colors.blue[100],
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Container(
          height: 30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text(
                widget.text,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

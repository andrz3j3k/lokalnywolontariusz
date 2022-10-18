import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  Button(
      {super.key,
      required this.text,
      required this.function,
      required this.backgroundColor,
      required this.textColor});
  String text;
  Function() function;
  Color backgroundColor;
  Color textColor;
  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.backgroundColor,
      ),
      onPressed: widget.function,
      child: Text(
        widget.text,
        style: TextStyle(color: widget.textColor),
      ),
    );
  }
}

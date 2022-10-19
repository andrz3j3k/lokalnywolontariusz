import 'package:flutter/material.dart';

class FieldSendData extends StatefulWidget {
  FieldSendData({
    super.key,
    required this.hideText,
  });
  String hideText;

  @override
  State<FieldSendData> createState() => _FieldSendDataState();
}

class _FieldSendDataState extends State<FieldSendData> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  returnLine() {
    if (widget.hideText == "Opis") {
      return 10;
    }
    return 1;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
        child: SizedBox(
          width: double.infinity,
          height: 200,
          child: TextField(
            decoration: InputDecoration(
              labelText: widget.hideText,
              labelStyle: const TextStyle(color: Colors.blueGrey),
              border: const OutlineInputBorder(),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey),
              ),
            ),
            maxLines: returnLine(),
            controller: _controller,
            style: const TextStyle(color: Colors.blueGrey),
            onChanged: (valueTextField) {
              setState(() {});
            },
          ),
        ),
      ),
    );
  }
}

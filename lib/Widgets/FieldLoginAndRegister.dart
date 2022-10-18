import 'package:flutter/material.dart';

class FieldLoginAndRegister extends StatefulWidget {
  FieldLoginAndRegister({
    super.key,
    required this.hideText,
  });
  String hideText;

  @override
  State<FieldLoginAndRegister> createState() => _FieldLoginAndRegisterState();
}

class _FieldLoginAndRegisterState extends State<FieldLoginAndRegister> {
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

  isPassword() {
    if (widget.hideText == "Hasło" || widget.hideText == "Powtórz hasło") {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 5),
        child: SizedBox(
          width: 300,
          height: 50,
          child: TextField(
            decoration: InputDecoration(
              labelText: widget.hideText,
              labelStyle: const TextStyle(color: Colors.white),
              border: const OutlineInputBorder(),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
            obscureText: isPassword(),
            controller: _controller,
            style: const TextStyle(color: Colors.white),
            onChanged: (valueTextField) {
              setState(() {});
            },
          ),
        ),
      ),
    );
  }
}

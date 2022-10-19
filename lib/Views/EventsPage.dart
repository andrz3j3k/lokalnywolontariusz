import 'package:flutter/material.dart';

class EventsPage extends StatelessWidget {
  EventsPage({super.key, required this.nameEvent});
  String nameEvent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nameEvent),
      ),
      body: Center(
        child: Column(
          children: [
            Image.network(
              "src",
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.4,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20),
            ),
            Text("Loremidnaiendiwenidmeiwd"),
            TextOnEventsPage(text: "Kontakt: "),
            TextOnEventsPage(text: "Miejsce wydarzenia: "),
            TextOnEventsPage(text: "Kiedy: "),
          ],
        ),
      ),
    );
  }
}

class TextOnEventsPage extends StatelessWidget {
  TextOnEventsPage({super.key, required this.text});
  String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(text),
      ),
    );
  }
}

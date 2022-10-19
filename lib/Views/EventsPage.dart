import 'package:flutter/material.dart';

class EventsPage extends StatelessWidget {
  EventsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Stack(
              children: [
                Image.network(
                  "https://www.swiatobrazu.pl/zdjecie/artykuly/494201/nikon-d850-sample-01.jpg",
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.4,
                  fit: BoxFit.cover,
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).padding.top + 20,
                      left: MediaQuery.of(context).padding.left + 10),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.red),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.arrow_back))),
                )
              ],
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
                child: Column(
                  children: [
                    Text("Loremidnaiendiwenidmeiwd"),
                    TextOnEventsPage(text: "Kontakt: "),
                    TextOnEventsPage(text: "Miejsce wydarzenia: "),
                    TextOnEventsPage(text: "Kiedy: "),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: CircleAvatar(
                          radius: 27,
                          backgroundColor: Colors.red,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://ocdn.eu/pulscms-transforms/1/0Z9k9kpTURBXy8xN2U0ZWYwM2EwZWQzYTBkNDE0N2I5N2EzZDBjMGIzMC5qcGeTlQPNBJ9lzQyHzQcMkwXNBLDNAqSTCaYwNThmNTcGgaEwAQ/jaroslaw-kaczynski.jpg"),
                            radius: 25,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
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
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(text),
      ),
    );
  }
}

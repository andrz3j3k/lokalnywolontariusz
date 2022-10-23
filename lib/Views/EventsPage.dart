import 'package:flutter/material.dart';
import 'package:lokalnywolontariusz/Providers/Providers.dart';
import 'package:lokalnywolontariusz/Services/Services.dart';
import 'package:lokalnywolontariusz/Views/AccountPage.dart';
import 'package:http/http.dart' as http;
import 'package:lokalnywolontariusz/Widgets/loading.dart';
import "package:provider/provider.dart";

import '../Models/Account.dart';

class EventsPage extends StatefulWidget {
  EventsPage({super.key, required this.id, required this.index});
  String id;
  int index;

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  isTakeEvent() async {
    final response = await http.get(
      Uri.parse(
          "https://ajlrimlsmg.cfolks.pl/addedevents.php?id=${widget.id}&idAccount=${Account.id}"),
    );
    if (response.body != "[]") {
      context.read<IsTake>().changeText("Dołączyłeś!");
    } else {
      context.read<IsTake>().changeText("Dołącz!");
    }
  }

  addDeleteEvent() async {
    final response = await http.post(
        Uri.parse("https://ajlrimlsmg.cfolks.pl/favouriteevent.php"),
        body: {
          "idEvents": widget.id,
          "idAccount": Account.id,
        });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: FutureBuilder(
            future: fetchEventsPage(widget.id),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const ErrorInternet();
              } else if (snapshot.hasData) {
                var list = snapshot.data!;
                return Column(
                  children: [
                    Stack(
                      children: [
                        Image.network(
                          "https://ajlrimlsmg.cfolks.pl/${list.url}",
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.4,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Text(
                              'Błąd w trakcie wczytywania zdjęcia!',
                              textAlign: TextAlign.center,
                            );
                          },
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
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).padding.top + 20,
                              right: MediaQuery.of(context).padding.right + 10),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: FutureBuilder(
                                future: isTakeEvent(),
                                builder: (context, snapshot) => ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(40))),
                                      onPressed: () {
                                        addDeleteEvent();
                                        setState(() {});
                                      },
                                      child: Text(
                                        context.watch<IsTake>().isTake,
                                        style: const TextStyle(
                                          color: Colors.red,
                                        ),
                                      ),
                                    )),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: Column(
                        children: [
                          Text(list.description),
                          TextOnEventsPage(text: "Kiedy: ${list.date}"),
                          TextOnEventsPage(
                              text: "Miejsce wydarzenia: ${list.city}"),
                          TextOnEventsPage(
                              text: "Kontakt: ${list.numberPhone}"),
                          TextOnEventsPage(text: "E-mail: ${list.email}"),
                          TextOnEventsPage(
                              text:
                                  "Zainteresowani wolontariusze: ${list.countAccounts}"),
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 15, bottom: 10),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => AccountPage(
                                          isProfile: false,
                                          id: list.id,
                                        ),
                                      ));
                                },
                                child: CircleAvatar(
                                  radius: 27,
                                  backgroundColor: Colors.red,
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                      "https://ajlrimlsmg.cfolks.pl/${list.accountsUrl}",
                                    ),
                                    radius: 25,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              } else {
                return const Loading();
              }
            },
          ),
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

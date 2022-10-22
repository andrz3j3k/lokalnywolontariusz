import 'package:flutter/material.dart';
import 'package:lokalnywolontariusz/Services/Services.dart';
import 'package:lokalnywolontariusz/Views/EventsPage.dart';
import 'package:lokalnywolontariusz/Widgets/Button.dart';
import '../Models/Account.dart';
import 'package:http/http.dart' as http;

class AccountPage extends StatefulWidget {
  AccountPage({
    super.key,
    required this.isProfile,
    required this.id,
  });
  bool isProfile;
  String id;

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.isProfile ? "Twój profil" : ""),
        actions: [
          widget.isProfile
              ? IconButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(
                          "Aby zmienić swoje dane nalezy kliknąć na nie! :)",
                        ),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.info,
                  ),
                )
              : IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => FutureBuilder(
                        future: fetchMyEvents(widget.id),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Container();
                          } else if (snapshot.hasData) {
                            var list = snapshot.data!;
                            return ListView.builder(
                              itemCount: list.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => EventsPage(
                                            id: list[index].id,
                                            index: index,
                                          ),
                                        ));
                                  },
                                  child: Card(
                                    child: ListTile(
                                      title: Text(list[index].name),
                                      leading: const Icon(Icons.event),
                                      trailing: Text(list[index].date),
                                    ),
                                  ),
                                );
                              },
                            );
                          } else {
                            return Container();
                          }
                        },
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.event_note,
                  ),
                )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Center(
          child: FutureBuilder(
            future: fetchAccountPersonality(widget.id),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Container();
              } else if (snapshot.hasData) {
                var list = snapshot.data!;
                List date = [
                  list.fullname,
                  list.age,
                  list.city,
                  list.numberPhone,
                  list.sex,
                ];
                List nameTitle = [
                  "Imię i nazwisko",
                  "Wiek",
                  "Miasto",
                  "Numer telefonu",
                  "Płeć"
                ];
                return Column(
                  children: [
                    CircleAvatar(
                      radius: 110,
                      backgroundColor: Colors.red,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://ocdn.eu/pulscms-transforms/1/0Z9k9kpTURBXy8xN2U0ZWYwM2EwZWQzYTBkNDE0N2I5N2EzZDBjMGIzMC5qcGeTlQPNBJ9lzQyHzQcMkwXNBLDNAqSTCaYwNThmNTcGgaEwAQ/jaroslaw-kaczynski.jpg"),
                        radius: 100,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 5)),
                    widget.isProfile
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.edit)),
                              const Text("Zdjęcie profilowe"),
                            ],
                          )
                        : Container(),
                    const Padding(
                        padding: EdgeInsets.only(
                      top: 20,
                    )),
                    Expanded(
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        color: Colors.grey.shade200,
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 10),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: nameTitle.length,
                                  itemBuilder: (context, index) {
                                    return SingleChildScrollView(
                                      child: GestureDetector(
                                        onTap: () {
                                          if (widget.isProfile) {
                                            showModalBottomSheet(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30)),
                                              context: context,
                                              builder: (context) {
                                                String data = "";
                                                TextEditingController
                                                    _controller =
                                                    TextEditingController();
                                                return SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.3,
                                                  child: Center(
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 30,
                                                                  right: 30),
                                                          child: TextField(
                                                            decoration:
                                                                InputDecoration(
                                                              labelText:
                                                                  nameTitle[
                                                                      index],
                                                              labelStyle:
                                                                  const TextStyle(
                                                                      color: Colors
                                                                          .blueGrey),
                                                              border:
                                                                  const OutlineInputBorder(),
                                                              enabledBorder:
                                                                  const OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .blueGrey),
                                                              ),
                                                              focusedBorder:
                                                                  const OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .blueGrey),
                                                              ),
                                                            ),
                                                            controller:
                                                                _controller,
                                                            onChanged: (value) {
                                                              data = value;
                                                            },
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                            top: 10,
                                                          ),
                                                          child: Button(
                                                            text: "Zmień",
                                                            function: () {
                                                              if (data != "") {
                                                                if (checkData(
                                                                    nameTitle[
                                                                        index],
                                                                    data)) {
                                                                  http.post(
                                                                    Uri.parse(
                                                                        'https://ajlrimlsmg.cfolks.pl/updatedataaccount.php?type=${nameTitle[index]}'),
                                                                    body: {
                                                                      'id': Account
                                                                          .id,
                                                                      'data':
                                                                          data
                                                                    },
                                                                  );
                                                                  data = "";
                                                                  _controller
                                                                      .clear();
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      backgroundColor:
                                                                          Colors
                                                                              .red,
                                                                      content:
                                                                          Text(
                                                                        infoTrue(
                                                                          nameTitle[
                                                                              index],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                } else {
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      backgroundColor:
                                                                          Colors
                                                                              .red,
                                                                      content:
                                                                          Text(
                                                                        infoError(
                                                                          nameTitle[
                                                                              index],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                              }
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            backgroundColor:
                                                                Colors.blueGrey,
                                                            textColor:
                                                                Colors.white,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          }
                                        },
                                        child: Column(
                                          children: [
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                nameTitle[index],
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                textAlign: TextAlign.start,
                                              ),
                                            ),
                                            TextOnEventsPage(
                                              text: date[index] == ""
                                                  ? "Nie podano"
                                                  : date[index],
                                            ),
                                            const Divider(thickness: 2),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}

checkData(type, data) {
  switch (type) {
    case "Imię i nazwisko":
      if (RegExp("([a-zA-Z]+( [a-zA-Z]+)+)").hasMatch(data)) {
        return true;
      } else {
        return false;
      }

    case "Wiek":
      if (RegExp("[0-9]").hasMatch(data)) {
        return true;
      } else {
        return false;
      }

    case "Miasto":
      if (RegExp("[a-zA-Z]").hasMatch(data)) {
        return true;
      } else {
        return false;
      }
    case "Numer telefonu":
      if (RegExp("[0-9]").hasMatch(data)) {
        if (data.length == 9) {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    case "Płeć":
      if (RegExp("[a-zA-Z]").hasMatch(data)) {
        return true;
      }
  }
}

infoError(type) {
  switch (type) {
    case "Imię i nazwisko":
      return "Nieprawidłowe imię i nazwisko";
    case "Wiek":
      return "Nieprawidłowy wiek";
    case "Miasto":
      return "Nieprawidłowe miasto.";
    case "Numer telefonu":
      return "Nieprawidłowy numer telefonu";
  }
}

infoTrue(type) {
  switch (type) {
    case "Imię i nazwisko":
      return "Prawidłowa zmiana imięnia i nazwiska!";
    case "Wiek":
      return "Prawidłowa zmiana wieku!";
    case "Miasto":
      return "Prawidłowa zmiana miasta!";
    case "Numer telefonu":
      return "Prawidłowa zmiana numeru telefonu!";
    case "Płeć":
      return "Prawidłowa zmiana płci";
  }
}

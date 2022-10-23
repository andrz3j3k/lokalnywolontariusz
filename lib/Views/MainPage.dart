import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:lokalnywolontariusz/Services/Services.dart';
import 'package:lokalnywolontariusz/Views/EventsPage.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: FutureBuilder(
            future: fetchMainPageEvents(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Container();
              } else if (snapshot.hasData) {
                var list = snapshot.data!;

                return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 300,
                      child: GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EventsPage(
                                id: list[index].id,
                                index: index,
                              ),
                            )),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.network(
                                'https://ajlrimlsmg.cfolks.pl/${list[index].url}',
                                fit: BoxFit.cover,
                                height: double.infinity,
                                errorBuilder: (context, error, stackTrace) {
                                  return Text(
                                    'Błąd w trakcie wczytywania zdjęcia!',
                                    textAlign: TextAlign.center,
                                  );
                                },
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  color: Colors.red.withOpacity(0.9),
                                  height: 65,
                                  width: double.infinity,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 30),
                                    child: ListTile(
                                      leading: const Icon(
                                        Icons.event,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                      title: AutoSizeText(
                                        list[index].name,
                                        maxFontSize: 24,
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      trailing: Text(
                                        list[index].date,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                      subtitle: Text(
                                        list[index].city,
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 13),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
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
        )
      ],
    );
  }
}

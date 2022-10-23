import 'package:flutter/material.dart';
import 'package:lokalnywolontariusz/Services/Services.dart';
import 'package:lokalnywolontariusz/Views/AccountPage.dart';
import 'package:lokalnywolontariusz/Views/AddEvents.dart';
import 'package:lokalnywolontariusz/Views/EventsPage.dart';

import '../Models/Account.dart';

class MyEventsPage extends StatelessWidget {
  const MyEventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Twoje wydarzenia"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddEvents(),
                  ));
            },
            icon: const Icon(
              Icons.add,
              size: 26,
            ),
          )
        ],
      ),
      body: Center(
        child: FutureBuilder(
          future: fetchMyEvents(Account.id),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Container();
            } else if (snapshot.hasData) {
              var list = snapshot.data!;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ListView.builder(
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
                              leading: const Padding(
                                padding: EdgeInsets.only(top: 5),
                                child: Icon(
                                  Icons.event,
                                ),
                              ),
                              subtitle: Text(list[index].date),
                              trailing: IconButton(
                                  onPressed: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return FutureBuilder(
                                          future:
                                              fetchUsersInEvent(list[index].id),
                                          builder: (context, snapshot) {
                                            if (snapshot.hasError) {
                                              return Container();
                                            } else if (snapshot.hasData) {
                                              return ListView.builder(
                                                itemCount:
                                                    snapshot.data!.length,
                                                itemBuilder: (context, index) {
                                                  return GestureDetector(
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                  top: 15,
                                                                  right: 10,
                                                                ),
                                                                child: SizedBox(
                                                                  height: 65,
                                                                  child:
                                                                      ListTile(
                                                                    leading:
                                                                        CircleAvatar(
                                                                      radius:
                                                                          50,
                                                                      backgroundImage:
                                                                          NetworkImage(
                                                                              "https://ajlrimlsmg.cfolks.pl/${snapshot.data![index].url}"),
                                                                    ),
                                                                    title: Text(snapshot
                                                                        .data![
                                                                            index]
                                                                        .fullname),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      right:
                                                                          10),
                                                              child: IconButton(
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.push(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                          builder: (context) => AccountPage(
                                                                              isProfile: false,
                                                                              id: snapshot.data![index].id),
                                                                        ));
                                                                  },
                                                                  icon: Icon(
                                                                    Icons
                                                                        .arrow_forward,
                                                                    size: 30,
                                                                  )),
                                                            )
                                                          ],
                                                        ),
                                                        Divider(
                                                          thickness: 1.5,
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              );
                                            } else {
                                              return Container();
                                            }
                                          },
                                        );
                                      },
                                    );
                                  },
                                  icon: Icon(
                                    Icons.list,
                                    size: 26,
                                  )),
                            ),
                          ),
                        );
                      },
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
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lokalnywolontariusz/Services/Services.dart';

import 'EventsPage.dart';

class TakeEventsPage extends StatelessWidget {
  const TakeEventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wydarzenia"),
      ),
      body: Center(
        child: FutureBuilder(
          future: fetchTakeEvents(),
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
                              leading: const Icon(Icons.event),
                              trailing: Text(list[index].date),
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

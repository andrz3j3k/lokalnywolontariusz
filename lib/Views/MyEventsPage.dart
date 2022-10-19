import 'package:flutter/material.dart';
import 'package:lokalnywolontariusz/Views/AddEvents.dart';
import 'package:lokalnywolontariusz/Widgets/FieldChangeData.dart';

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text("Moje wydarzenie"),
                      leading: Icon(Icons.event),
                      trailing: Text("10.10.2022"),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

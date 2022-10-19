import 'package:flutter/material.dart';

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EventsPage(),
                          ));
                    },
                    child: Card(
                      child: ListTile(
                        title: Text("Moje wydarzenie"),
                        leading: Icon(Icons.event),
                        trailing: Text("10.10.2022"),
                      ),
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

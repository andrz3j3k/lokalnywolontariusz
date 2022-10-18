import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lokalnywolontariusz/Views/AccountPage.dart';
import 'package:lokalnywolontariusz/Views/LoginPage.dart';
import 'package:lokalnywolontariusz/Views/MainPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.red,
          primaryColor: Colors.red,
          fontFamily: "abrilfatfacev19"),
      home: const LoginPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: const Text("Lokalny Wolontariusz"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AccountPage(),
                ),
              );
            },
            icon: const Icon(Icons.account_box),
            iconSize: 26,
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          primary: false,
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              child: Text(
                'Dominik Gąsior',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.event_note),
              title: Text('Wydarzenia'),
            ),
            const ListTile(
              leading: Icon(Icons.event),
              title: Text('Twoje wydarzenia'),
            ),
            const ListTile(
              leading: Icon(Icons.settings),
              title: Text('Ustawienia'),
            ),
            const ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Wyloguj się'),
            ),
          ],
        ),
      ),
      body: const MainPage(),
    );
  }
}

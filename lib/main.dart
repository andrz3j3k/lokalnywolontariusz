import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lokalnywolontariusz/Models/Account.dart';
import 'package:lokalnywolontariusz/Views/AccountPage.dart';
import 'package:lokalnywolontariusz/Views/LoginPage.dart';
import 'package:lokalnywolontariusz/Views/MainPage.dart';
import 'package:lokalnywolontariusz/Views/MyEventsPage.dart';
import 'package:lokalnywolontariusz/Views/SettingsPage.dart';
import 'package:lokalnywolontariusz/Views/TakeEventsPage.dart';
import 'package:provider/provider.dart';

import 'Providers/Providers.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Login(),
        ),
        ChangeNotifierProvider(
          create: (_) => IsTake(),
        ),
      ],
      child: const MyApp(),
    ),
  );
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
                  builder: (context) =>
                      AccountPage(isProfile: true, id: Account.id),
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
                Account.fullname,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.event_note),
              title: const Text('Wydarzenia'),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TakeEventsPage(),
                  )),
            ),
            ListTile(
              leading: const Icon(Icons.event),
              title: const Text('Twoje wydarzenia'),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyEventsPage(),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Ustawienia'),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsPage(),
                  )),
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Wyloguj się'),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  )),
            ),
          ],
        ),
      ),
      body: const MainPage(),
    );
  }
}

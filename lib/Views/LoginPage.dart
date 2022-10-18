import 'package:flutter/material.dart';
import 'package:lokalnywolontariusz/Views/MainPage.dart';
import 'package:lokalnywolontariusz/Views/RegisterPage.dart';
import 'package:lokalnywolontariusz/Widgets/Button.dart';
import 'package:lokalnywolontariusz/Widgets/FieldLoginAndRegister.dart';
import 'package:lokalnywolontariusz/main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.red,
              boxShadow: const [
                BoxShadow(color: Colors.red, blurRadius: 5),
              ]),
          height: 303,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 10),
                ),
                const Text(
                  "Logowanie",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 10),
                ),
                FieldLoginAndRegister(
                  hideText: "Adres e-mail",
                ),
                FieldLoginAndRegister(
                  hideText: "Hasło",
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 10),
                ),
                Button(
                  text: "Zaloguj się!",
                  function: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyHomePage(),
                      ),
                    );
                  },
                  backgroundColor: Colors.white,
                  textColor: Colors.red,
                ),
                Button(
                  text: "Stworz konto!",
                  function: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterPage(),
                      ),
                    );
                  },
                  backgroundColor: Colors.redAccent.shade200,
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

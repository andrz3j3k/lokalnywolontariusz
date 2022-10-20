import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:lokalnywolontariusz/Models/Account.dart';
import 'package:lokalnywolontariusz/Views/RegisterPage.dart';
import 'package:lokalnywolontariusz/Widgets/Button.dart';
import 'package:lokalnywolontariusz/main.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController LoginController;
  late TextEditingController PassController;

  @override
  void initState() {
    super.initState();
    LoginController = TextEditingController();
    PassController = TextEditingController();
  }

  @override
  void dispose() {
    LoginController.dispose();
    PassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.red,
              boxShadow: const [
                BoxShadow(color: Colors.red, blurRadius: 5),
              ]),
          height: 310,
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
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    child: SizedBox(
                      width: 300,
                      height: 50,
                      child: TextField(
                        decoration: loginDecoration,
                        controller: LoginController,
                        style: const TextStyle(color: Colors.white),
                        onChanged: (valueTextField) {
                          setState(() {});
                        },
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    child: SizedBox(
                      width: 300,
                      height: 50,
                      child: TextField(
                        decoration: passDecoration,
                        obscureText: true,
                        controller: PassController,
                        style: const TextStyle(color: Colors.white),
                        onChanged: (valueTextField) {
                          setState(() {});
                        },
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 10),
                ),
                Button(
                  text: "Zaloguj się!",
                  function: () async {
                    if (!RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(LoginController.text)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Adres e-mail jest niepoprawny!"),
                          backgroundColor: Colors.red,
                        ),
                      );
                    } else {
                      final response = await http.post(
                        Uri.parse('https://ajlrimlsmg.cfolks.pl/login.php'),
                        body: {
                          "login": LoginController.text,
                          "pass": PassController.text,
                        },
                      );

                      if (response.body != "Błędny e-mail lub hasło.") {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Colors.red,
                            content: Text(
                              "Logowanie pomyślne!",
                            ),
                          ),
                        );
                        var date =
                            AccountId.fromJson(jsonDecode(response.body));
                        Account.id = date.id;
                        Account.fullname = date.fullname;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MyHomePage(),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.red,
                            content: Text(
                              response.body.toString(),
                            ),
                          ),
                        );
                      }
                    }
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

  InputDecoration loginDecoration = const InputDecoration(
    labelText: "Adres e-mail",
    labelStyle: TextStyle(color: Colors.white),
    border: OutlineInputBorder(),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    ),
  );
  InputDecoration passDecoration = const InputDecoration(
    labelText: "Hasło",
    labelStyle: TextStyle(color: Colors.white),
    border: OutlineInputBorder(),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    ),
  );
}

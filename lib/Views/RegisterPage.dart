import 'package:flutter/material.dart';

import '../Widgets/Button.dart';
import '../Widgets/FieldLoginAndRegister.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

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
            ],
          ),
          height: 433,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 10),
                ),
                const Text(
                  "Rejestracja",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 10),
                ),
                FieldLoginAndRegister(
                  hideText: "Imię i nazwisko",
                ),
                FieldLoginAndRegister(
                  hideText: "Adres e-mail",
                ),
                FieldLoginAndRegister(
                  hideText: "Hasło",
                ),
                FieldLoginAndRegister(
                  hideText: "Powtórz hasło",
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 10),
                ),
                Button(
                  text: "Zarejestruj się!",
                  function: () {},
                  backgroundColor: Colors.white,
                  textColor: Colors.red,
                ),
                Button(
                  text: "Powrót",
                  function: () {
                    Navigator.pop(
                      context,
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

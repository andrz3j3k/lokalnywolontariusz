import 'package:flutter/material.dart';
import 'package:lokalnywolontariusz/Views/LoginPage.dart';
import '../Widgets/Button.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late TextEditingController FullNameController;
  late TextEditingController LoginController;
  late TextEditingController PassController;
  late TextEditingController Pass2Controller;
  @override
  void initState() {
    super.initState();
    FullNameController = TextEditingController();
    LoginController = TextEditingController();
    PassController = TextEditingController();
    Pass2Controller = TextEditingController();
  }

  @override
  void dispose() {
    LoginController.dispose();
    PassController.dispose();
    FullNameController.dispose();
    Pass2Controller.dispose();
    super.dispose();
  }

  createAccount() async {
    final response = await http.post(
      Uri.parse('https://ajlrimlsmg.cfolks.pl/register.php'),
      body: {
        "fullname": FullNameController.text,
        "email": LoginController.text,
        "pass": PassController.text,
      },
    );
    if (response.body != "Istnieje juz taki uzytkownik!") {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Konto zostało utworzone pomyślnie!"),
          backgroundColor: Colors.red,
        ),
      );
      Future.delayed(Duration(seconds: 1));
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
      );
      FullNameController.text = "";
      LoginController.text = "";
      PassController.text = "";
      Pass2Controller.text = "";
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Istnieje juz taki uzytkownik!"),
          backgroundColor: Colors.red,
        ),
      );
      LoginController.text = "";
      PassController.text = "";
      Pass2Controller.text = "";
    }
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
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    child: SizedBox(
                      width: 300,
                      height: 50,
                      child: TextField(
                        decoration: nameDecoration,
                        controller: FullNameController,
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
                        decoration: mailDecoration,
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
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    child: SizedBox(
                      width: 300,
                      height: 50,
                      child: TextField(
                        decoration: pass2Decoration,
                        obscureText: true,
                        controller: Pass2Controller,
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
                  text: "Zarejestruj się!",
                  function: () {
                    if (!RegExp("([A-Za-z0-9]+( [A-Za-z0-9]+)+)")
                        .hasMatch(FullNameController.text.trim())) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Niepoprawne imię i nazwisko!"),
                          backgroundColor: Colors.red,
                        ),
                      );
                    } else {
                      if (PassController.text.length < 7) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                "Hasło powinno być dłuzsze! Minimum 8 znaków"),
                            backgroundColor: Colors.red,
                          ),
                        );
                        PassController.text = "";
                        Pass2Controller.text = "";
                      } else {
                        if (PassController.text != Pass2Controller.text) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Hasła nie są identyczne!"),
                              backgroundColor: Colors.red,
                            ),
                          );
                          PassController.text = "";
                          Pass2Controller.text = "";
                        } else {
                          if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(LoginController.text)) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Adres e-mail jest niepoprawny!"),
                                backgroundColor: Colors.red,
                              ),
                            );
                            LoginController.text = "";
                            PassController.text = "";
                            Pass2Controller.text = "";
                          } else {
                            createAccount();
                          }
                        }
                      }
                    }
                  },
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

  InputDecoration nameDecoration = const InputDecoration(
    labelText: "Imię i nazwisko",
    labelStyle: TextStyle(color: Colors.white),
    border: OutlineInputBorder(),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    ),
  );
  InputDecoration mailDecoration = const InputDecoration(
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
  InputDecoration pass2Decoration = const InputDecoration(
    labelText: "Powtórz hasło",
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

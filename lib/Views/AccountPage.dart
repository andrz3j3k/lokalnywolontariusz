import 'package:flutter/material.dart';
import 'package:lokalnywolontariusz/Widgets/Button.dart';
import 'package:lokalnywolontariusz/Widgets/FieldChangeData.dart';

class AccountPage extends StatelessWidget {
  AccountPage({super.key});
  List<String> personality = ["Miasto", "Płeć", "Wiek", "Numer telefonu"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Twój profil"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Center(
          child: Column(
            children: [
              CircleAvatar(
                radius: 110,
                backgroundColor: Colors.red,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://ocdn.eu/pulscms-transforms/1/0Z9k9kpTURBXy8xN2U0ZWYwM2EwZWQzYTBkNDE0N2I5N2EzZDBjMGIzMC5qcGeTlQPNBJ9lzQyHzQcMkwXNBLDNAqSTCaYwNThmNTcGgaEwAQ/jaroslaw-kaczynski.jpg"),
                  radius: 100,
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 5)),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
                  const Text("Zdjęcie profilowe"),
                ],
              ),
              const Padding(
                  padding: EdgeInsets.only(
                top: 20,
              )),
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  color: Colors.grey.shade200,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 10),
                      ),
                      SizedBox(
                        height: 300,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return FieldChangeData(
                              hideText: personality[index],
                            );
                          },
                        ),
                      ),
                      Button(
                        text: "Zaaktualizuj dane",
                        function: () {},
                        backgroundColor: Colors.blueGrey.shade500,
                        textColor: Colors.white,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lokalnywolontariusz/Widgets/Button.dart';
import 'package:lokalnywolontariusz/Widgets/FieldChangeData.dart';
import 'package:lokalnywolontariusz/Widgets/FieldSendData.dart';

class AddEvents extends StatelessWidget {
  AddEvents({super.key});

  DateTime date = DateTime.now();
  late String datePicker;
  @override
  Widget build(BuildContext context) {
    datePicker = "${date.day}.${date.month}.${date.year}";
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dodaj wydarzenie"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FieldChangeData(hideText: "Nazwa wydarzenia"),
            FieldSendData(hideText: "Opis"),
            FieldChangeData(hideText: "Miejsce wydarzenia"),
            FieldChangeData(hideText: "Zdjęcie wydarzenia"),
            FieldChangeData(hideText: "Kontakt"),
            Button(
              text: datePicker,
              function: () {
                showDatePicker(
                  context: context,
                  initialDate: date,
                  firstDate: DateTime(2022),
                  lastDate: DateTime(2100),
                  helpText: "Wybierz datę",
                );
              },
              backgroundColor: Colors.blueGrey,
              textColor: Colors.white,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10),
            ),
            Button(
              text: "Dodaj wydarzenie",
              function: () {},
              backgroundColor: Colors.red,
              textColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lokalnywolontariusz/Models/Account.dart';
import 'package:lokalnywolontariusz/Widgets/Button.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:http/http.dart' as http;

class AddEvents extends StatefulWidget {
  const AddEvents({super.key});

  @override
  State<AddEvents> createState() => _AddEventsState();
}

class _AddEventsState extends State<AddEvents> {
  late TextEditingController _controllerNazwaWydarzenia;
  late TextEditingController _controllerOpis;
  late TextEditingController _controllerMiejsceWydarzenia;
  late var date;

  @override
  void initState() {
    _controllerNazwaWydarzenia = TextEditingController();
    _controllerOpis = TextEditingController();
    _controllerMiejsceWydarzenia = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controllerNazwaWydarzenia.dispose();
    _controllerOpis.dispose();
    _controllerMiejsceWydarzenia.dispose();
    super.dispose();
  }

  File? imagepath;
  String? imagename;
  String? imagedata;
  Future<void> getImage() async {
    var getimage = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      imagepath = File(getimage!.path);
      imagename = getimage.path.split('/').last;
      imagedata = base64Encode(imagepath!.readAsBytesSync());
    });
  }

  Future<void> uploadEvents() async {
    String uri = "https://ajlrimlsmg.cfolks.pl/imageupload.php";
    var res = await http.post(Uri.parse(uri), body: {
      "data": imagedata,
      "namePhoto": imagename,
      "idAccount": Account.id,
      "name": _controllerNazwaWydarzenia.text,
      "description": _controllerOpis.text,
      "city": _controllerMiejsceWydarzenia.text,
      "date": date.toString(),
    });
    var response = jsonDecode(res.body);
    if (response["success"] == "true") {
      print("uploaded");
    } else {
      print("error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dodaj wydarzenie"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:
                    EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: "Nazwa wydarzenia",
                    labelStyle: TextStyle(color: Colors.blueGrey),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueGrey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueGrey),
                    ),
                  ),
                  controller: _controllerNazwaWydarzenia,
                  style: const TextStyle(color: Colors.blueGrey),
                  onChanged: (valueTextField) {
                    setState(() {});
                  },
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: "Opis",
                    labelStyle: TextStyle(color: Colors.blueGrey),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueGrey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueGrey),
                    ),
                  ),
                  controller: _controllerOpis,
                  style: const TextStyle(color: Colors.blueGrey),
                  onChanged: (valueTextField) {
                    setState(() {});
                  },
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: "Miejsce wydarzenia",
                    labelStyle: TextStyle(color: Colors.blueGrey),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueGrey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueGrey),
                    ),
                  ),
                  controller: _controllerMiejsceWydarzenia,
                  style: const TextStyle(color: Colors.blueGrey),
                  onChanged: (valueTextField) {
                    setState(() {});
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                child: SfDateRangePicker(
                  monthViewSettings:
                      const DateRangePickerMonthViewSettings(firstDayOfWeek: 1),
                  onSelectionChanged: _onselectionChanged,
                ),
              ),
              imagepath != null
                  ? Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      child: Image.file(imagepath!))
                  : const Text("Brak wybranego zdjęcia"),
              ElevatedButton(
                  onPressed: () {
                    getImage();
                  },
                  child: const Text("Wybierz zdjęcie")),
              const Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              Button(
                text: "Dodaj wydarzenie",
                function: () {
                  uploadEvents();
                },
                backgroundColor: Colors.red,
                textColor: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onselectionChanged(
      DateRangePickerSelectionChangedArgs dateRangePickerSelectionChangedArgs) {
    date = dateRangePickerSelectionChangedArgs.value;
  }
}

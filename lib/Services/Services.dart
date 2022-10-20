import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
//to jest wykonywane na samym koncu
import 'package:lokalnywolontariusz/Models/Account.dart';

import '../Models/Events.dart';

Future<AccountPersonality> fetchAccountPersonality(id) async {
  //pobranie strony WWW
  final response = await http.post(
    Uri.parse('https://ajlrimlsmg.cfolks.pl/accountpage.php'),
    body: {
      "id": id,
    },
  );
  return AccountPersonality.fromJson(jsonDecode(response.body));
}

Future<List<MainPageEvents>> fetchMainPageEvents() async {
  final response = await http.get(
    Uri.parse('https://ajlrimlsmg.cfolks.pl/events.php'),
  );
  return compute(parseMainPageEvents, response.body);
}

Future<EventsPage> fetchEventsPage(id) async {
  final response = await http.get(
    Uri.parse('https://ajlrimlsmg.cfolks.pl/pageevents.php?id=${id}'),
  );
  return EventsPage.fromJson(jsonDecode(response.body));
}

Future<List<MyEvents>> fetchMyEvents() async {
  final response = await http.get(
    Uri.parse(
        'https://ajlrimlsmg.cfolks.pl/myevents.php?idAccount=${Account.id}'),
  );
  return compute(parseMyEvents, response.body);
}

Future<List<MyEvents>> fetchTakeEvents() async {
  final response = await http.get(
    Uri.parse('https://ajlrimlsmg.cfolks.pl/takeevents.php?id=${Account.id}'),
  );
  return compute(parseMyEvents, response.body);
}

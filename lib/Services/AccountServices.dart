import 'dart:convert';
import 'package:http/http.dart' as http;
//to jest wykonywane na samym koncu
import 'package:lokalnywolontariusz/Models/Account.dart';

Future<Account> fetchAccount(id) async {
  //pobranie strony WWW
  final response = await http.get(
    Uri.parse(''),
  );
  return Account.fromJson(jsonDecode(response.body));
}


// Future<List<MainPageEvents>> fetchMainPageEvents() async {
//   //pobranie strony WWW
//   final response =
//       await http.get(Uri.parse('https://gdzieterazapp.pl/api/events'));

//   // Use the compute function to run parsePhotos in a separate isolate.
//   return compute(parseMainPageEvents, response.body);
// }

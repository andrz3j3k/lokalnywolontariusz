import 'dart:convert';

class Events {
  final int id;
  final int idAccount;
  final String name;
  final DateTime date;
  final String description;
  final String city;
  final String numberPhone;

  const Events({
    required this.id,
    required this.idAccount,
    required this.name,
    required this.date,
    required this.description,
    required this.city,
    required this.numberPhone,
  });
  factory Events.fromJson(Map<String, dynamic> json) {
    return Events(
      id: json['id'] as int,
      idAccount: json['idAccount'] as int,
      name: json['name'] as String,
      date: json['date'] as DateTime,
      description: json['description'] as String,
      city: json['city'] as String,
      numberPhone: json['numberPhone'] as String,
    );
  }
  List<Events> parseMainPageEvents(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Events>((json) => Events.fromJson(json)).toList();
  }
}

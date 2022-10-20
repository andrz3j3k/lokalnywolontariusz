import 'dart:convert';

class MainPageEvents {
  final String id;
  final String name;
  final String city;
  final String date;

  MainPageEvents({
    required this.id,
    required this.name,
    required this.date,
    required this.city,
  });
  factory MainPageEvents.fromJson(Map<String, dynamic> json) {
    return MainPageEvents(
      id: json['id'] as String,
      name: json['name'] as String,
      date: json['date'] as String,
      city: json['city'] as String,
    );
  }
}

List<MainPageEvents> parseMainPageEvents(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed
      .map<MainPageEvents>((json) => MainPageEvents.fromJson(json))
      .toList();
}

class EventsPage {
  final String id;
  final String fullname;
  final String email;
  final String numberPhone;
  final String name;
  final String description;
  final String city;
  final String date;
  final String countAccounts;

  EventsPage({
    required this.id,
    required this.fullname,
    required this.email,
    required this.numberPhone,
    required this.name,
    required this.description,
    required this.city,
    required this.date,
    required this.countAccounts,
  });
  factory EventsPage.fromJson(Map<String, dynamic> json) {
    return EventsPage(
      id: json['id'] as String,
      fullname: json['fullname'] as String,
      email: json['email'] as String,
      numberPhone: json['numberPhone'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      city: json['city'] as String,
      date: json['date'] as String,
      countAccounts: json['countAccounts'] as String,
    );
  }
}

class MyEvents {
  final String id;
  final String name;

  final String date;

  MyEvents({
    required this.id,
    required this.name,
    required this.date,
  });
  factory MyEvents.fromJson(Map<String, dynamic> json) {
    return MyEvents(
      id: json['id'] as String,
      name: json['name'] as String,
      date: json['date'] as String,
    );
  }
}

List<MyEvents> parseMyEvents(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<MyEvents>((json) => MyEvents.fromJson(json)).toList();
}

class AccountPersonality {
  final String fullname;
  final String age;
  final String sex;
  final String city;
  final String numberPhone;

  const AccountPersonality({
    required this.fullname,
    required this.age,
    required this.sex,
    required this.city,
    required this.numberPhone,
  });
  factory AccountPersonality.fromJson(Map<String, dynamic> json) {
    return AccountPersonality(
      fullname: json['fullname'] as String,
      age: json['age'] as String,
      city: json['city'] as String,
      sex: json['sex'] as String,
      numberPhone: json['numberPhone'] as String,
    );
  }
}

class AccountId {
  final String id;
  final String fullname;

  const AccountId({
    required this.id,
    required this.fullname,
  });
  factory AccountId.fromJson(Map<String, dynamic> json) {
    return AccountId(
      id: json['id'] as String,
      fullname: json['fullname'] as String,
    );
  }
}

class Account {
  static String id = "0";
  static String fullname = "";
  static returnSex(sex) {
    if (sex == "0") {
      return "Męzczyzna";
    } else {
      return "Kobieta";
    }
  }
}

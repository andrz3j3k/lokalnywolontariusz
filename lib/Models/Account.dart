class Account {
  final int id;
  final String fullname;
  final int age;
  final bool sex;
  final String city;
  final String numberPhone;

  const Account({
    required this.id,
    required this.fullname,
    required this.age,
    required this.sex,
    required this.city,
    required this.numberPhone,
  });
  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      id: json['id'] as int,
      fullname: json['fullname'] as String,
      age: json['age'] as int,
      city: json['city'] as String,
      sex: json['sex'] as bool,
      numberPhone: json['numberPhone'] as String,
    );
  }
}

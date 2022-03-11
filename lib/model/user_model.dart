class User {
  int? id;
  String? name;
  String? age;
  String? salary;

  User(
      {required this.id,
      required this.name,
      required this.age,
      required this.salary});

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        age = json['age'],
        salary = json['salary'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'age': age,
        'salary': salary,
      };
}

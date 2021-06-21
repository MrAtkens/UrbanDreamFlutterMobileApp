import 'dart:convert';

class User {
  late String id;
  late String firstName;
  late String lastName;
  late String email;
  late String creationDate;

  User.empty();
  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.creationDate
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'creationDate': creationDate
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {

    return User(
      id: map['id'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      email: map['email'],
      creationDate: map['creationDate'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

}


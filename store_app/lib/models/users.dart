import 'dart:convert';

class User {
  final String id;
  final String fullName;
  final String email;
  final String state;
  final String city;
  final String locality;
  final String password;

  User({
    required this.id,
    required this.fullName,
    required this.email,
    required this.state,
    required this.city,
    required this.locality,
    required this.password,
  });

  //Serialization:Convert user object to a map

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      'fullName': fullName,
      'email': email,
      'state': state,
      'city': city,
      'locality': locality,
      'password': password,
    };
  }

  //Serialization: Convert map to user object
  //this method directly encodes the data from the map to the Json string
  //The json.encode() function converts the map to a JSON string.
  String toJson() => json.encode(toMap());

  //Deserialization: Convert map to user object
  //purpose - manipulation and use : Once the data is
  //converted to a user object it can easily be manipulated and used in the application.

  //factory constructor is used to create an instance of User from a map.
  // usually form a json object and if fields is empty it defaults to an empty String
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] as String? ?? "",
      fullName: map['fullName'] as String? ?? "",
      email: map['email'] as String? ?? "",
      state: map['state'] as String? ?? "",
      city: map['city'] as String? ?? "",
      locality: map['locality'] as String? ?? "",
      password: map['password'] as String? ?? "",
    );
  }

  //fromJson: This factory constructor takes a Json String and decodes it into a map,
  //then uses the fromMap method to create a User object.

  factory User.fromJson(String source) {
    return User.fromMap(json.decode(source) as Map<String, dynamic>);
  }
}

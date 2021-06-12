import 'dart:convert';

List<Users> usersFromJson(String str) => List<Users>.from(json.decode(str).map((x) => Users.fromJson(x)));

String usersToJson(List<Users> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Users {
  Users({
    this.id,
    this.userName,
    this.fullName,
  });

  int id;
  String userName;
  String fullName;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
    id: json["ID"],
    userName: json["UserName"],
    fullName: json["FullName"],
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "UserName": userName,
    "FullName": fullName,
  };
}

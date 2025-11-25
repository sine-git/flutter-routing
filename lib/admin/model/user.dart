class User {
  int id;
  String name;
  String username;

  User(this.id, this.name, this.username) {}

  factory User.fromJson(Map<String, dynamic> json) => User(
      json['id'] as int, json['name'] as String, json['username'] as String);
}

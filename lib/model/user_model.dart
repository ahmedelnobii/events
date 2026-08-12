class UserModel {
  String id;
  String name;
  String email;

  UserModel({required this.name, required this.email, required this.id});
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      UserModel(name: json['name'], email: json['email'], id: json['id']);

  Map<String, dynamic> toJson() => {'name': name, 'email': email, 'id': id};
}

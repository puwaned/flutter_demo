class User {
  final int id;
  final String firstName;
  final String lastName;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        firstName: json['firstNameEn'],
        lastName: json['lastNameEn']);
  }

  User({required this.id, required this.firstName, required this.lastName});
}

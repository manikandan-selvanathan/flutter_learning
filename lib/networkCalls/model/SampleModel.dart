class User {
  final String userName;
  final String password;

  User({this.userName, this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(userName: json['username'], password: json['password']);
  }
}

class User {
  int id;
  String email;
  String password;

  User(this.id, this.email, this.password);

  User.fromJson(parsedJson) {
    this.id = parsedJson['id'];
    this.email = parsedJson['email'];
    this.password = parsedJson['password'];
  }

  String toString() {
    return 'Email: $email, Password: $password, Id: $id';
  }
}
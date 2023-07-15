class SecureUser {
  String? fullName;
  String? email;
  String? phone;
  String? password;
  String? confirmPassword;

  SecureUser(
    this.fullName,
    this.email,
    this.phone,
    this.password,
    this.confirmPassword,
  );

  SecureUser.fromJson(Map<String, dynamic> json)
      : fullName = json['fullName'],
        email = json['email'],
        phone = json['phone'],
        password = json['password'],
        confirmPassword = json['confirmPassword'];

  Map<String, dynamic> toJson() => {
        'fullName': fullName,
        'email': email,
        'phone': phone,
        'password': password,
        'confirmPassword': confirmPassword,
      };
}

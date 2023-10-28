class Admin {
  final String? id;
  final String? name;
  final String? nickName;
  final String? email;
  final String? username;
  final String? password;
  final String? adminCode;
  final List<dynamic>? group;
  final Map<String, dynamic>? requests;
  final String? type;
  final bool? isEmailVerified;

  const Admin(
      {required this.id,
      required this.name,
      required this.nickName,
      required this.email,
      required this.username,
      required this.password,
      required this.adminCode,
      required this.group,
      required this.requests,
      required this.type,
      required this.isEmailVerified});

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "nickName": nickName,
        "email": email,
        "username": username,
        "password": password,
        "adminCode": adminCode,
        "group": group,
        "requests": requests,
        "type": type,
        "emailVerified": isEmailVerified,
      };

  factory Admin.fromJson(Map<String, dynamic> json) {
    return Admin(
      id: json["id"],
      name: json["name"],
      nickName: json["nickName"],
      email: json["email"],
      username: json["username"],
      password: json["password"],
      adminCode: json["adminCode"],
      group: json["group"] as List<dynamic>,
      requests: json["requests"] as Map<String, dynamic>,
      type: json["type"],
      isEmailVerified: json["emailVerified"],
    );
  }
}

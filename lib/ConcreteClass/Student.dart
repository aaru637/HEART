// ignore: file_names
class Student {
  final String id;
  final String name;
  final String nickName;
  final String email;
  final String username;
  final String password;
  final String adminCode;
  final bool adminAccept;
  final String type;
  final bool isEmailVerified;

  const Student(
      {required this.id,
      required this.name,
      required this.nickName,
      required this.email,
      required this.username,
      required this.password,
      required this.adminCode,
      required this.adminAccept,
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
        "adminAccept": adminAccept,
        "type": type,
        "isEmailVerified": isEmailVerified,
      };

  factory Student.fromJson(Map<String, dynamic> json) => Student(
      id: json["id"],
      name: json["name"],
      nickName: json["nickName"],
      email: json["email"],
      username: json["username"],
      password: json["password"],
      adminCode: json["adminCode"],
      adminAccept: json["adminAccept"],
      type: json["type"],
      isEmailVerified: json["isEmailVerified"]);
}

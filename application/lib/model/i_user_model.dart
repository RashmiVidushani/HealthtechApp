class UserModel {
  String? uid;
  String? email;
  String? username;
  String? phone;

  UserModel({this.uid, this.email, this.username, this.phone});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      username: map['username'],
      phone: map['phone'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'username': username,
      'phone': phone,
    };
  }
}

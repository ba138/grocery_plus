class UserModel {
  String uid;
  String username;
  String email;
  String phone;
  String? profilePic;

  UserModel({
    required this.uid,
    required this.username,
    required this.email,
    required this.phone,
    this.profilePic,
  });

  // Convert to Map
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'username': username,
      'email': email,
      'phone': phone,
      'profilePic': profilePic ?? "",
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      username: map['username'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      profilePic: map['profilePic'],
    );
  }
}

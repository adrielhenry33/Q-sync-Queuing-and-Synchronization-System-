class UserModel {
  final int id;
  final String name;
  final String email;
  final String? role;
  final String? avatarUrl;
  final String token;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.token,
    this.role,
    this.avatarUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      token: json['token'] as String,
      role: json['role'] as String?,
      avatarUrl: json['avatar_url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'role': role,
      'avatar_url': avatarUrl,
      'toke': token
    };
  }

  UserModel copyWith(
      {int? id,
      String? name,
      String? email,
      String? token,
      String? avatarUrl,
      String? role}) {
    return UserModel(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        token: token ?? this.token,
        role: role ?? this.role,
        avatarUrl: avatarUrl ?? this.avatarUrl);
  }
}

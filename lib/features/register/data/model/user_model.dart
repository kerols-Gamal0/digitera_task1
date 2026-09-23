class UserModel {
  const UserModel({
    this.id,
    this.email,
    this.password,
    this.name,
    this.role,
    this.avatar,
    this.creationAt,
    this.updatedAt,
  });

  final int? id;
  final String? email;
  final String? password;
  final String? name;
  final String? role;
  final String? avatar;
  final String? creationAt;
  final String? updatedAt;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json['id'] as int?,
    email: json['email'] as String?,
    password: json['password'] as String?,
    name: json['name'] as String?,
    role: json['role'] as String?,
    avatar: json['avatar'] as String?,
    creationAt: json['creationAt'] as String?,
    updatedAt: json['updatedAt'] as String?,
  );
}

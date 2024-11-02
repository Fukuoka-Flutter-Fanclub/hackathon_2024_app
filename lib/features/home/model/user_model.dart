class UserModel {
  final String id;
  final String nickname;

  UserModel({
    required this.id,
    required this.nickname,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      nickname: json['nickname'] as String? ?? '名無し',
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'nickname': nickname,
      };
}

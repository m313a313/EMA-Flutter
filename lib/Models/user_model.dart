class UserModel {
  final int id;
  final String name;
  final String email;
  final String joined_at;
  final int? phone;
  UserModel(
      {required this.id,
      required this.email,
      required this.name,
      required this.phone,
      required this.joined_at
      });

  factory UserModel.fromjson(data) {
    return UserModel(
        id: data['id'],
        email: data['email'],
        name: data['name'],
        phone: data['phone'],
        joined_at: data['created_at']
        
        );
  }
}

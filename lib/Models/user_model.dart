class UserModel {
  final int id;
  final String name;
  final String email;
  
  final int? phone;
  UserModel(
      {required this.id,
      required this.email,
      required this.name,
   
      required this.phone});

  factory UserModel.fromjson(data) {
    return UserModel(
        id:  data['id'],
        email: data['email'],
        name: data['name'],
      
        phone: data['phone']);
  }
}

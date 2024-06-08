
import 'package:laporrita/data/cache_data_source.dart';

class UserModel implements CacheMappable {
  final String id;
  final String name;
  final String email;
  final String? image;

  static var key = "user";

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.image,
  });

  factory UserModel.fromStorageMap(Map<String, dynamic> map) => UserModel(
    id: map['id'] as String,
    name: map['name'] as String,
    email: map['email'] as String,
    image: map['image'] as String?,
  );

  @override
  Map<String, dynamic> toStorageMap() => {
    'id': id,
    'name': name,
    'email': email,
    'image': image,
  };

}
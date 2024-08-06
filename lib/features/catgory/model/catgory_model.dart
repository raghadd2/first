
import 'package:equatable/equatable.dart';

class CatgoryModel extends Equatable {
  final int id;
  final String name;
  final String imageUrl;
  final String iconUrl;

  CatgoryModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.iconUrl,
  });

  factory CatgoryModel.fromJson(Map<String, dynamic> json) => CatgoryModel(
        id: json["id"],
        name: json["name"],
        imageUrl: json["imageURL"],
        iconUrl: json["iconURL"],
      );

  Map<String, Object> toJson() => {
        "id": id,
        "name": name,
        "imageURL": imageUrl,
        "iconURL": iconUrl,
      };

  @override
  List<Object?> get props => [id, name, imageUrl, iconUrl];
}

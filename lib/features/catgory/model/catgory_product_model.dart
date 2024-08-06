import 'package:equatable/equatable.dart';

class CatgoryproductModel extends Equatable {
  final String id;
  final String name;
  final num sellingPrice;

  const CatgoryproductModel({
    required this.id,
    required this.name,
    required this.sellingPrice,
  });

  factory CatgoryproductModel.fromJson(Map<String, dynamic> json) =>
      CatgoryproductModel(
        id: json["id"],
        name: json["name"],
        sellingPrice: json["sellingPrice"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "sellingPrice": sellingPrice,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
        sellingPrice,
      ];
}

class ProductColorMapping {
  final int colorId;
  final String nameAr;
  final String nameEn;
  final String hex;

  ProductColorMapping({
    required this.colorId,
    required this.nameAr,
    required this.nameEn,
    required this.hex,
  });

  factory ProductColorMapping.fromJson(Map<String, dynamic> json) =>
      ProductColorMapping(
        colorId: json["colorId"],
        nameAr: json["nameAR"],
        nameEn: json["nameEN"],
        hex: json["hex"],
      );

  Map<String, dynamic> toJson() => {
        "colorId": colorId,
        "nameAR": nameAr,
        "nameEN": nameEn,
        "hex": hex,
      };
}

class ProductImage {
  final String imageUrl;

  ProductImage({
    required this.imageUrl,
  });

  factory ProductImage.fromJson(Map<String, dynamic> json) => ProductImage(
        imageUrl: json["imageURL"],
      );

  Map<String, dynamic> toJson() => {
        "imageURL": imageUrl,
      };
}

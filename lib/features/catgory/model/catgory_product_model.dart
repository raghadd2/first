
import 'package:equatable/equatable.dart';

class CatgoryproductModel extends Equatable {
  final String id;
  final String name;
  final int sellingPrice;
  final int additionalFees;
  final String description;
  final int quantity;
  final int discount;
  final int categoryId;
  final String categoryName;
  final String unit;
  final bool sample;
  final bool isAvailable;
  final int prepaid;
  final bool isfaivorte;
  final List<ProductImage> productImages;
  final List<dynamic> productProberties;
  final List<ProductColorMapping> productColorMappings;

  CatgoryproductModel({
    required this.id,
    required this.name,
    required this.sellingPrice,
    required this.additionalFees,
    required this.description,
    required this.quantity,
    required this.discount,
    required this.categoryId,
    required this.categoryName,
    required this.unit,
    required this.sample,
    required this.isAvailable,
    required this.prepaid,
    required this.isfaivorte,
    required this.productImages,
    required this.productProberties,
    required this.productColorMappings,
  });

  factory CatgoryproductModel.fromJson(Map<String, dynamic> json) =>
      CatgoryproductModel(
        id: json["id"],
        name: json["name"],
        sellingPrice: json["sellingPrice"],
        additionalFees: json["additionalFees"],
        description: json["description"],
        quantity: json["quantity"],
        discount: json["discount"],
        categoryId: json["categoryId"],
        categoryName: json["categoryName"],
        unit: json["unit"],
        sample: json["sample"],
        isAvailable: json["isAvailable"],
        prepaid: json["prepaid"],
        isfaivorte: json["isfaivorte"],
        productImages: List<ProductImage>.from(
            json["productImages"].map((x) => ProductImage.fromJson(x))),
        productProberties:
            List<dynamic>.from(json["productProberties"].map((x) => x)),
        productColorMappings: List<ProductColorMapping>.from(
            json["productColorMappings"]
                .map((x) => ProductColorMapping.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "sellingPrice": sellingPrice,
        "additionalFees": additionalFees,
        "description": description,
        "quantity": quantity,
        "discount": discount,
        "categoryId": categoryId,
        "categoryName": categoryName,
        "unit": unit,
        "sample": sample,
        "isAvailable": isAvailable,
        "prepaid": prepaid,
        "isfaivorte": isfaivorte,
        "productImages":
            List<dynamic>.from(productImages.map((x) => x.toJson())),
        "productProberties":
            List<dynamic>.from(productProberties.map((x) => x)),
        "productColorMappings":
            List<dynamic>.from(productColorMappings.map((x) => x.toJson())),
      };

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
        sellingPrice,
        additionalFees,
        description,
        quantity,
        discount,
        categoryId,
        categoryName,
        unit,
        sample,
        isAvailable,
        prepaid,
        isfaivorte,
        productImages,
        productProberties,
        productColorMappings
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

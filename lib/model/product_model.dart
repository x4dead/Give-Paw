import 'dart:convert';

class ProductModel {
  final List<String>? imgs;
  final String? title;
  final String? desc;
  final bool? inStock;
  final bool? topSeller;
  final int? previousPrice;
  final int? discountPrice;
  final int? producId;
  final String? petType;

  ProductModel({
    this.imgs,
    this.title,
    this.desc,
    this.inStock,
    this.topSeller,
    this.previousPrice,
    this.discountPrice,
    this.producId,
    this.petType,
  });

  ProductModel copyWith({
    List<String>? imgs,
    String? title,
    String? desc,
    bool? inStock,
    bool? topSeller,
    int? previousPrice,
    int? discountPrice,
    int? producId,
    String? petType,
  }) =>
      ProductModel(
        imgs: imgs ?? this.imgs,
        title: title ?? this.title,
        desc: desc ?? this.desc,
        inStock: inStock ?? this.inStock,
        topSeller: topSeller ?? this.topSeller,
        previousPrice: previousPrice ?? this.previousPrice,
        discountPrice: discountPrice ?? this.discountPrice,
        producId: producId ?? this.producId,
        petType: petType ?? this.petType,
      );

  factory ProductModel.fromJson(String str) =>
      ProductModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductModel.fromMap(Map<String, dynamic> json) => ProductModel(
        imgs: json["imgs"] == null
            ? []
            : List<String>.from(json["imgs"]!.map((x) => x)),
        title: json["title"],
        desc: json["desc"],
        inStock: json["inStock"],
        topSeller: json["topSeller"],
        previousPrice: json["previousPrice"],
        discountPrice: json["discountPrice"],
        producId: json["producId"],
        petType: json["petType"],
      );

  Map<String, dynamic> toMap() => {
        "imgs": imgs == null ? [] : List<dynamic>.from(imgs!.map((x) => x)),
        "title": title,
        "desc": desc,
        "inStock": inStock,
        "topSeller": topSeller,
        "previousPrice": previousPrice,
        "discountPrice": discountPrice,
        "producId": producId,
        "petType": petType,
      };
}

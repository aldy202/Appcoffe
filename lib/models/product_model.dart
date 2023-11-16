import 'dart:convert';

class ProductModel {
  String? idProduct;
  String? productName;
  String? productDetail;
  int? stock;
  int? priceProduct;
  String? lastUpdated;
  String? imageProduct;

  ProductModel({
    this.idProduct,
    this.productName,
    this.productDetail,
    this.stock,
    this.priceProduct,
    this.lastUpdated,
    this.imageProduct,
  });

  Map<String, dynamic> toMap() {
    return {
      'idProduct': idProduct,
      'productName': productName,
      'productDetail': productDetail,
      'stock': stock,
      'priceProduct': priceProduct,
      'lastUpdated': lastUpdated,
      'imageProduct': imageProduct,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      idProduct: map['idProduct'],
      productName: map['productName'],
      productDetail: map['productDetail'],
      stock: map['stock']?.toInt(),
      priceProduct: map['priceProduct']?.toInt(),
      lastUpdated: map['lastUpdated'],
      imageProduct: map['imageProduct'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));
}

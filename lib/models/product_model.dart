import 'dart:convert';

List<ProductModel> productFromJson(String str) => List<ProductModel>.from(
    json.decode(str).map((x) => ProductModel.fromJson(x)));

class ProductModelRating {
  String? rate;
  String? count;

  ProductModelRating({
    this.rate,
    this.count,
  });
  ProductModelRating.fromJson(Map<String, dynamic> json) {
    rate = json['rate']?.toString();
    count = json['count']?.toString();
  }
}

// خطائص المنتجات السعر
class ProductModel {
  String? id;
  String? title;
  String? price;
  String? description;
  String? category;
  String? image;
  bool? isFav;
  ProductModelRating? rating;

  ProductModel(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image,
      this.rating,
      this.isFav});
  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    isFav = false;
    title = json['title']?.toString();
    price = json['price']?.toString();
    description = json['description']?.toString();
    category = json['category']?.toString();
    image = json['image']?.toString();
    rating = (json['rating'] != null)
        ? ProductModelRating.fromJson(json['rating'])
        : null;
  }
}

class EditProductModel {
  Product? product;
  String? message;

  EditProductModel({this.product, this.message});

  EditProductModel.fromJson(Map<String, dynamic> json) {
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Product {
  int? id;
  String? productName;
  String? productPrice;
  String? detail;
  String? image1;
  int? subCategoryId;
  String? createdAt;
  String? updatedAt;

  Product(
      {this.id,
      this.productName,
      this.productPrice,
      this.detail,
      this.image1,
      this.subCategoryId,
      this.createdAt,
      this.updatedAt});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['product_name'];
    productPrice = json['product_price'];
    detail = json['detail'];
    image1 = json['image1'];
    subCategoryId = json['sub_category_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_name'] = this.productName;
    data['product_price'] = this.productPrice;
    data['detail'] = this.detail;
    data['image1'] = this.image1;
    data['sub_category_id'] = this.subCategoryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

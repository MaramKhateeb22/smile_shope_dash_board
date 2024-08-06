class AllProductForSubCategoryModel {
  int? productId;
  String? productName;
  int? productPrice;
  String? detail;
  String? image1;
  String? subcategory;
  String? category;
  List<Colorrs>? colors;

  AllProductForSubCategoryModel(
      {this.productId,
      this.productName,
      this.productPrice,
      this.detail,
      this.image1,
      this.subcategory,
      this.category,
      this.colors});

  AllProductForSubCategoryModel.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productName = json['product_name'];
    productPrice = json['product_price'];
    detail = json['detail'];
    image1 = json['image1'];
    subcategory = json['subcategory'];
    category = json['category'];
    if (json['colors'] != null) {
      colors = <Colorrs>[];
      json['colors'].forEach((v) {
        colors!.add(new Colorrs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['product_name'] = this.productName;
    data['product_price'] = this.productPrice;
    data['detail'] = this.detail;
    data['image1'] = this.image1;
    data['subcategory'] = this.subcategory;
    data['category'] = this.category;
    if (this.colors != null) {
      data['colors'] = this.colors!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Colorrs {
  String? colorName;
  List<Sizes>? sizes;

  Colorrs({this.colorName, this.sizes});

  Colorrs.fromJson(Map<String, dynamic> json) {
    colorName = json['color_name'];
    if (json['sizes'] != null) {
      sizes = <Sizes>[];
      json['sizes'].forEach((v) {
        sizes!.add(new Sizes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['color_name'] = this.colorName;
    if (this.sizes != null) {
      data['sizes'] = this.sizes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Sizes {
  String? sizeName;
  int? quantity;
  String? price;

  Sizes({this.sizeName, this.quantity, this.price});

  Sizes.fromJson(Map<String, dynamic> json) {
    sizeName = json['size_name'];
    quantity = json['quantity'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['size_name'] = this.sizeName;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    return data;
  }
}

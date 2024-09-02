class getMostPurchasedProductsModel {
  int? id;
  String? productName;
  String? image1;
  int? productPrice;
  String? totalPurchases;

  getMostPurchasedProductsModel(
      {this.id,
      this.productName,
      this.image1,
      this.productPrice,
      this.totalPurchases});

  getMostPurchasedProductsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['product_name'];
    image1 = json['image1'];
    productPrice = json['product_price'];
    totalPurchases = json['total_purchases'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_name'] = productName;
    data['image1'] = image1;
    data['product_price'] = productPrice;
    data['total_purchases'] = totalPurchases;
    return data;
  }
}

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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_name'] = this.productName;
    data['image1'] = this.image1;
    data['product_price'] = this.productPrice;
    data['total_purchases'] = this.totalPurchases;
    return data;
  }
}

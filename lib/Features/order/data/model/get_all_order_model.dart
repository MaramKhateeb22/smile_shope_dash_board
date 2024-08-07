class GetAllOrderModel {
  int? orderId;
  String? date;
  int? paid;
  int? totalPrice;
  String? userName;
  String? userPhone;
  String? userAddress;
  List<Items>? items;

  GetAllOrderModel(
      {this.orderId,
      this.date,
      this.paid,
      this.totalPrice,
      this.userName,
      this.userPhone,
      this.userAddress,
      this.items});

  GetAllOrderModel.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    date = json['date'];
    paid = json['paid'];
    totalPrice = json['total_Price'];
    userName = json['user_name'];
    userPhone = json['user_phone'];
    userAddress = json['user_address'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['date'] = this.date;
    data['paid'] = this.paid;
    data['total_Price'] = this.totalPrice;
    data['user_name'] = this.userName;
    data['user_phone'] = this.userPhone;
    data['user_address'] = this.userAddress;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? productName;
  String? color;
  String? size;
  int? count;
  int? pricePerItem;
  int? totalPrice;

  Items(
      {this.productName,
      this.color,
      this.size,
      this.count,
      this.pricePerItem,
      this.totalPrice});

  Items.fromJson(Map<String, dynamic> json) {
    productName = json['product_name'];
    color = json['color'];
    size = json['size'];
    count = json['count'];
    pricePerItem = json['price_per_item'];
    totalPrice = json['total_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_name'] = this.productName;
    data['color'] = this.color;
    data['size'] = this.size;
    data['count'] = this.count;
    data['price_per_item'] = this.pricePerItem;
    data['total_price'] = this.totalPrice;
    return data;
  }
}

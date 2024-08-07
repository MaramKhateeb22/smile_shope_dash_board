class ShowAllPaymentProofModel {
  List<PaymentProofs>? paymentProofs;

  ShowAllPaymentProofModel({this.paymentProofs});

  ShowAllPaymentProofModel.fromJson(Map<String, dynamic> json) {
    if (json['paymentProofs'] != null) {
      paymentProofs = <PaymentProofs>[];
      json['paymentProofs'].forEach((v) {
        paymentProofs!.add(new PaymentProofs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.paymentProofs != null) {
      data['paymentProofs'] =
          this.paymentProofs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PaymentProofs {
  int? orderId;
  int? paid;
  String? userName;
  String? paymentProof;
  int? totalAmount;
  List<Bills>? bills;

  PaymentProofs(
      {this.orderId,
      this.paid,
      this.userName,
      this.paymentProof,
      this.totalAmount,
      this.bills});

  PaymentProofs.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    paid = json['paid'];
    userName = json['user_name'];
    paymentProof = json['payment_proof'];
    totalAmount = json['total_amount'];
    if (json['bills'] != null) {
      bills = <Bills>[];
      json['bills'].forEach((v) {
        bills!.add(new Bills.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['paid'] = this.paid;
    data['user_name'] = this.userName;
    data['payment_proof'] = this.paymentProof;
    data['total_amount'] = this.totalAmount;
    if (this.bills != null) {
      data['bills'] = this.bills!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Bills {
  int? billId;
  String? productName;
  String? color;
  String? size;
  int? count;
  int? pricePerItem;
  int? totalPrice;

  Bills(
      {this.billId,
      this.productName,
      this.color,
      this.size,
      this.count,
      this.pricePerItem,
      this.totalPrice});

  Bills.fromJson(Map<String, dynamic> json) {
    billId = json['bill_id'];
    productName = json['product_name'];
    color = json['color'];
    size = json['size'];
    count = json['count'];
    pricePerItem = json['price_per_item'];
    totalPrice = json['total_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bill_id'] = this.billId;
    data['product_name'] = this.productName;
    data['color'] = this.color;
    data['size'] = this.size;
    data['count'] = this.count;
    data['price_per_item'] = this.pricePerItem;
    data['total_price'] = this.totalPrice;
    return data;
  }
}

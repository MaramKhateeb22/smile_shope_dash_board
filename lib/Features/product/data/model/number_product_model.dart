class NumberPorductModel {
  int? numberOfProducts;

  NumberPorductModel({this.numberOfProducts});

  NumberPorductModel.fromJson(Map<String, dynamic> json) {
    numberOfProducts = json['Number of products'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Number of products'] = this.numberOfProducts;
    return data;
  }
}

class ProductDeleteModel {
  Null? data;
  String? massege;
  int? status;

  ProductDeleteModel({this.data, this.massege, this.status});

  ProductDeleteModel.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    massege = json['massege'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data;
    data['massege'] = this.massege;
    data['status'] = this.status;
    return data;
  }
}

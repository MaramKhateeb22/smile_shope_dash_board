class AllSizeModel {
  List<Data>? data;
  String? massege;
  int? status;

  AllSizeModel({this.data, this.massege, this.status});

  AllSizeModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    massege = json['massege'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['massege'] = this.massege;
    data['status'] = this.status;
    return data;
  }
}

class Data {
  int? id;
  String? sizeName;
  String? createdAt;
  String? updatedAt;

  Data({this.id, this.sizeName, this.createdAt, this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sizeName = json['size_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['size_name'] = this.sizeName;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

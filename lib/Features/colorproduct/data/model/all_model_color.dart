class AllColorModel {
  List<Data>? data;
  String? massege;
  int? status;

  AllColorModel({this.data, this.massege, this.status});

  AllColorModel.fromJson(Map<String, dynamic> json) {
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
  String? colorName;
  String? createdAt;
  String? updatedAt;

  Data({this.id, this.colorName, this.createdAt, this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    colorName = json['color_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['color_name'] = this.colorName;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

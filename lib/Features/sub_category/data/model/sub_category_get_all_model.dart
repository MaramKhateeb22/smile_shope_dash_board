class SubCategoryGetAllModel {
  List<Data>? data;
  String? massege;
  int? status;

  SubCategoryGetAllModel({this.data, this.massege, this.status});

  SubCategoryGetAllModel.fromJson(Map<String, dynamic> json) {
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
  String? title2;
  String? image2;
  String? createdAt;
  String? updatedAt;
  int? categoryId;

  Data(
      {this.id,
      this.title2,
      this.image2,
      this.createdAt,
      this.updatedAt,
      this.categoryId});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title2 = json['title2'];
    image2 = json['image2'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    categoryId = json['category_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title2'] = this.title2;
    data['image2'] = this.image2;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['category_id'] = this.categoryId;
    return data;
  }
}

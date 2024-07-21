class AddSubCategoryModel {
  Data? data;
  String? massege;
  int? status;

  AddSubCategoryModel({this.data, this.massege, this.status});

  AddSubCategoryModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    massege = json['massege'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['massege'] = this.massege;
    data['status'] = this.status;
    return data;
  }
}

class Data {
  String? title2;
  String? image2;
  int? categoryId;
  String? updatedAt;
  String? createdAt;
  int? id;

  Data(
      {this.title2,
      this.image2,
      this.categoryId,
      this.updatedAt,
      this.createdAt,
      this.id});

  Data.fromJson(Map<String, dynamic> json) {
    title2 = json['title2'];
    image2 = json['image2'];
    categoryId = json['category_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title2'] = this.title2;
    data['image2'] = this.image2;
    data['category_id'] = this.categoryId;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}

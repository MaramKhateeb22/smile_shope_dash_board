class AddCategoryModel {
  Data? data;
  String? massege;
  int? status;

  AddCategoryModel({this.data, this.massege, this.status});

  AddCategoryModel.fromJson(Map<String, dynamic> json) {
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
  String? title1;
  String? image;
  String? updatedAt;
  String? createdAt;
  int? id;

  Data({this.title1, this.image, this.updatedAt, this.createdAt, this.id});

  Data.fromJson(Map<String, dynamic> json) {
    title1 = json['title1'];
    image = json['image'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title1'] = this.title1;
    data['image'] = this.image;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}

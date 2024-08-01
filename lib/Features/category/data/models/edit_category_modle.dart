class EditCategoryModel {
  Data? data;
  String? massege;
  int? status;

  EditCategoryModel({this.data, this.massege, this.status});

  EditCategoryModel.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? title1;
  String? createdAt;
  String? updatedAt;
  String? image;

  Data({this.id, this.title1, this.createdAt, this.updatedAt, this.image});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title1 = json['title1'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title1'] = this.title1;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['image'] = this.image;
    return data;
  }
}

class GetAllSubCatForOneCatModel {
  int? id;
  String? title2;
  String? image2;
  String? createdAt;
  String? updatedAt;
  int? categoryId;

  GetAllSubCatForOneCatModel(
      {this.id,
      this.title2,
      this.image2,
      this.createdAt,
      this.updatedAt,
      this.categoryId});

  GetAllSubCatForOneCatModel.fromJson(Map<String, dynamic> json) {
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

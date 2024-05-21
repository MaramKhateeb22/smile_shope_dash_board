import 'package:smile_shope_dash_board/core/utils/api/end_points.dart';

class ProductGetAllModel {
  List<DataProduct>? data;
  String? massege;
  int? status;

  ProductGetAllModel({this.data, this.massege, this.status});

  ProductGetAllModel.fromJson(Map<String, dynamic> json) {
    if (json[ApiKey.data] != null) {
      data = <DataProduct>[];
      json[ApiKey.data].forEach((v) {
        data!.add(new DataProduct.fromJson(v));
      });
    }
    massege = json[ApiKey.massege];
    status = json[ApiKey.status];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data[ApiKey.data] = this.data!.map((v) => v.toJson()).toList();
    }
    data[ApiKey.massege] = this.massege;
    data[ApiKey.status] = this.status;
    return data;
  }
}

class DataProduct {
  int? id;
  String? productName;
  int? productPrice;
  String? detail;
  String? image1;
  int? subCategoryId;
  String? createdAt;
  String? updatedAt;

  DataProduct(
      {this.id,
      this.productName,
      this.productPrice,
      this.detail,
      this.image1,
      this.subCategoryId,
      this.createdAt,
      this.updatedAt});

  DataProduct.fromJson(Map<String, dynamic> json) {
    id = json[ApiKey.id];
    productName = json[ApiKey.product_name];
    productPrice = json[ApiKey.product_price];
    detail = json[ApiKey.detail];
    image1 = json[ApiKey.image1];
    subCategoryId = json[ApiKey.sub_category_id];
    createdAt = json[ApiKey.created_at];
    updatedAt = json[ApiKey.updated_at];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data[ApiKey.id] = this.id;
    data[ApiKey.product_name] = this.productName;
    data[ApiKey.product_price] = this.productPrice;
    data[ApiKey.detail] = this.detail;
    data[ApiKey.image1] = this.image1;
    data[ApiKey.sub_category_id] = this.subCategoryId;
    data[ApiKey.created_at] = this.createdAt;
    data[ApiKey.updated_at] = this.updatedAt;
    return data;
  }
}

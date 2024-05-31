// import 'package:smile_shope_dash_board/core/utils/api/end_points.dart';

// class ProductGetAllModel {
//   List<DataProduct>? data;
//   String? massege;
//   int? status;

//   ProductGetAllModel({this.data, this.massege, this.status});

//   ProductGetAllModel.fromJson(Map<String, dynamic> json) {
//     if (json[ApiKey.data] != null) {
//       data = <DataProduct>[];
//       json[ApiKey.data].forEach((v) {
//         data!.add(DataProduct.fromJson(v));
//       });
//     }
//     massege = json[ApiKey.massege];
//     status = json[ApiKey.status];
//   }
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (this.data != null) {
//       data[ApiKey.data] = this.data!.map((v) => v.toJson()).toList();
//     }
//     data[ApiKey.massege] = massege;
//     data[ApiKey.status] = status;
//     return data;
//   }
// }

// class DataProduct {
//   int? id;
//   String? productName;
//   int? productPrice;
//   String? detail;
//   String? image1;
//   int? subCategoryId;
//   String? createdAt;
//   String? updatedAt;

//   DataProduct(
//       {this.id,
//       this.productName,
//       this.productPrice,
//       this.detail,
//       this.image1,
//       this.subCategoryId,
//       this.createdAt,
//       this.updatedAt});

//   DataProduct.fromJson(Map<String, dynamic> json) {
//     id = json[ApiKey.id];
//     productName = json[ApiKey.product_name];
//     productPrice = json[ApiKey.product_price];
//     detail = json[ApiKey.detail];
//     image1 = json[ApiKey.image1];
//     subCategoryId = json[ApiKey.sub_category_id];
//     createdAt = json[ApiKey.created_at];
//     updatedAt = json[ApiKey.updated_at];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data[ApiKey.id] = id;
//     data[ApiKey.product_name] = productName;
//     data[ApiKey.product_price] = productPrice;
//     data[ApiKey.detail] = detail;
//     data[ApiKey.image1] = image1;
//     data[ApiKey.sub_category_id] = subCategoryId;
//     data[ApiKey.created_at] = createdAt;
//     data[ApiKey.updated_at] = updatedAt;
//     return data;
//   }
// }

class ProductGetAllModel {
  List<Data>? data;
  String? massege;
  int? status;

  ProductGetAllModel({this.data, this.massege, this.status});

  ProductGetAllModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    massege = json['massege'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['massege'] = massege;
    data['status'] = status;
    return data;
  }
}

class Data {
  int? id;
  String? productName;
  int? productPrice;
  String? detail;
  String? image1;
  int? subCategoryId;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.productName,
      this.productPrice,
      this.detail,
      this.image1,
      this.subCategoryId,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['product_name'];
    productPrice = json['product_price'];
    detail = json['detail'];
    image1 = json['image1'];
    subCategoryId = json['sub_category_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_name'] = productName;
    data['product_price'] = productPrice;
    data['detail'] = detail;
    data['image1'] = image1;
    data['sub_category_id'] = subCategoryId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

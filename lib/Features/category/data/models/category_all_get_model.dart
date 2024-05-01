import 'package:smile_shope_dash_board/core/utils/api/end_points.dart';

class CategoryGetAllModle {
  List<Data>? data;
  String? massege;
  int? status;

  CategoryGetAllModle({this.data, this.massege, this.status});

  CategoryGetAllModle.fromJson(Map<String, dynamic> json) {
    data = json[ApiKey.data] == null
        ? null
        : (json[ApiKey.data] as List).map((e) => Data.fromJson(e)).toList();
    massege = json[ApiKey.massege];
    status = json[ApiKey.status];
  }

  static List<CategoryGetAllModle> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => CategoryGetAllModle.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (data != null) {
      _data[ApiKey.data] = data?.map((e) => e.toJson()).toList();
    }

    _data[ApiKey.massege] = massege;
    _data[ApiKey.massege] = status;
    return _data;
  }
}

class Data {
  int? id;
  String? title1;
  String? createdAt;
  String? updatedAt;

  Data({this.id, this.title1, this.createdAt, this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json[ApiKey.id];
    title1 = json[ApiKey.title1];
    createdAt = json[ApiKey.created_at];
    updatedAt = json[ApiKey.updated_at];
  }

  static List<Data> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Data.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data[ApiKey.id] = id;
    _data[ApiKey.title1] = title1;
    _data[ApiKey.created_at] = createdAt;
    _data[ApiKey.updated_at] = updatedAt;
    return _data;
  }
}

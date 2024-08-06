class NumberUserModel {
  int? numberOfUsers;

  NumberUserModel({this.numberOfUsers});

  NumberUserModel.fromJson(Map<String, dynamic> json) {
    numberOfUsers = json['Number of users'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Number of users'] = this.numberOfUsers;
    return data;
  }
}

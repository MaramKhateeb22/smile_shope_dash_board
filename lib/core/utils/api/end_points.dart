class EndPoints {
  static String baseUrl = "https://smilestore20002000.000webhostapp.com/api/";
  static String categoryGetAll = "category/get_all";
  static String productGetAll = "product/get_all";
  static String addProduct = "product/add";

  static String deleteProduct(String id) {
    return "product/delete/$id";
  }

  static String deleteCategory(String id) {
    return "category/delete/$id";
  }

  static String categoryGetAllSubCategory(String id) {
    return "category/getsubcategory/$id";
  }
}

class ApiKey {
  static String status = "status";
  static String massege = "massege";
  static String data = "data";
  static String id = "id";
  static String title1 = "title1";
  static String created_at = "created_at";
  static String updated_at = "updated_at";

  //product
  static String product_name = "product_name ";
  static String product_price = "product_price ";
  static String detail = "detail ";
  static String image1 = "image1 ";
  static String sub_category_id = "sub_category_id ";
}

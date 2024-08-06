class EndPoints {
  static String baseUrl = "http://yomnabaksmawi-001-site1.ltempurl.com/api/";
  static String categoryGetAll = "category/get_all";
  static String allUsers = "getallusers";
  static String numberusers = "countofUsers";
  static String subcategoryGetAll = "subcategory/get_all";
  static String productGetAll = "product/get_all";
  static String sizetGetAll = "size/get_all";
  static String colortGetAll = "color/get_all";
  static String productGetAllDetail = "product/getAllProductsWithDetails";
  static String addProduct = "product/add";
  static String addCategory = "category/add";
  static String addSize = "size/add";
  static String addColor = "color/add";

  static String deleteProduct(String id) {
    return "product/delete/$id";
  }

  static String deleteSize(String id) {
    return "size/delete/$id";
  }

  static String deleteColor(String id) {
    return "color/delete/$id";
  }

  static String deleteCategory(String id) {
    return "category/delete/$id";
  }

  static String deleteSubCategory(String id) {
    return "subcategory/delete/$id";
  }

  static String categoryGetAllSubCategory(String id) {
    return "category/getsubcategory/$id";
  }

  static String allSubCategoryGetproduct(String id) {
    return "subcategory/getproductsforsubcategory/$id";
  }

  static String editCategoryTitle(String id) {
    return "category/update/$id";
  }

  static String editPrdouct(String id) {
    return "product/update/$id";
  }

  static String editSize(String id) {
    return "size/update/$id";
  }

  static String editColor(String id) {
    return "color/update/$id";
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

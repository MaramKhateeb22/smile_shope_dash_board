import 'package:smile_shope_dash_board/Features/category/data/models/category_all_get_model.dart';
import 'package:smile_shope_dash_board/core/utils/api/api_consumer.dart';
import 'package:smile_shope_dash_board/core/utils/api/end_points.dart';

class CategoryGetAllService {
  final ApiConsumer api;

  CategoryGetAllService({required this.api});

  Future<List<CategoryGetAllModle>> categorygetall() async {
    List<CategoryGetAllModle> response =
        await api.get(EndPoints.baseUrl + EndPoints.categoryGetAll);
    List<CategoryGetAllModle> categoryList = [];
    for (var i = 0; i < response.length; i++) {
      categoryList.add(
        CategoryGetAllModle.fromJson(
          response[i].data,
        ),
      );
    }
  }
}

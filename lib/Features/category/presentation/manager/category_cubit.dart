import 'package:bloc/bloc.dart';
import 'package:smile_shope_dash_board/Features/category/presentation/manager/category_state.dart';
import '../../data/models/category_all_get_model.dart';
import '../../data/repos/repo.dart';


class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.categoryRepository, ) : super(GetAllCategoryInitialState()) {}
  final CategoryRepositry categoryRepository;
  CategoryGetAllModle? allCategory;
  getAllCategory() async {
    emit(GetAllCategoryLoading());
    final response = await categoryRepository.categoryGetAll();
    response.fold(
            (errMessage) => emit(CetAllCategoryFailure(errMessage: errMessage)),
            (category) {
           allCategory=category;
          emit(GetAllCategorySuccess())
          ;
        }
    );

  }




}



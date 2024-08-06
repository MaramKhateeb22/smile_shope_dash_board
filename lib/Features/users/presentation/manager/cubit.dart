import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_shope_dash_board/Features/users/data/models/all_users_model.dart';
import 'package:smile_shope_dash_board/Features/users/data/models/number_users_model.dart';
import 'package:smile_shope_dash_board/Features/users/data/repo/repo.dart';
import 'package:smile_shope_dash_board/Features/users/presentation/manager/state.dart';

class AllUsersCubit extends Cubit<AllUsersState> {
  AllUsersCubit(
    this.usersRepositry,
  ) : super(GetAllUsersStateInitialState());
  AllUsersModel? allUsers;
  NumberUserModel? numberUseres;
  final UsersRepositry usersRepositry;
  // List<AllProductForSubCategoryModel>? allProductForSubCategory;

  getAllUsersCubit() async {
    emit(GetAllUsersStateLoading());
    final response = await usersRepositry.usersGetAll();
    response.fold(
        (errMessage) => emit(GetAllUsersStateFailure(errMessage: errMessage)),
        (users) {
      allUsers = users;
      emit(GetAllUsersStateSuccess());
    });
  }

  getNumberUsersCubit() async {
    emit(GetNumberUsersStateLoading());
    final response = await usersRepositry.numberUsers();
    response.fold(
      (errMessage) => emit(GetNumberUsersStateFailure(errMessage: errMessage)),
      (users) {
        numberUseres = users;
        emit(
          GetNumberUsersStateSuccess(numberUserModel: users),
        );
      },
    );
  }
}

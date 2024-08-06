// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:smile_shope_dash_board/Features/users/data/models/number_users_model.dart';

abstract class AllUsersState {}

class GetAllUsersStateInitialState extends AllUsersState {}

class GetAllUsersStateLoading extends AllUsersState {}

class GetAllUsersStateSuccess extends AllUsersState {}

class GetAllUsersStateFailure extends AllUsersState {
  final String errMessage;

  GetAllUsersStateFailure({required this.errMessage});
}

class GetNumberUsersStateInitialState extends AllUsersState {}

class GetNumberUsersStateLoading extends AllUsersState {}

class GetNumberUsersStateSuccess extends AllUsersState {
  NumberUserModel numberUserModel;
  GetNumberUsersStateSuccess({
    required this.numberUserModel,
  });
}

class GetNumberUsersStateFailure extends AllUsersState {
  final String errMessage;

  GetNumberUsersStateFailure({required this.errMessage});
}

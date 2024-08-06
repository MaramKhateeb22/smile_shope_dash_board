abstract class ColorState {}

class AddColorInitalState extends ColorState {}

class AddColorLoadingState extends ColorState {}

class AddColorSuccessState extends ColorState {}

class AddColorErrorState extends ColorState {
  final String error;

  AddColorErrorState({required this.error});
}

class ClearFormState extends ColorState {}

//allColor

class AllColorInitalState extends ColorState {}

class AllColorLoadingState extends ColorState {}

class AllColorSuccessState extends ColorState {}

class AllColorErrorState extends ColorState {
  final String error;

  AllColorErrorState({required this.error});
}

//Delete Color

class DeleteColorInitalState extends ColorState {}

class DeleteColorLoadingState extends ColorState {}

class DeleteColorSuccessState extends ColorState {}

class DeleteColorErrorState extends ColorState {
  final String error;

  DeleteColorErrorState({required this.error});
}
//Edit Color

class EditColorInitalState extends ColorState {}

class EditColorLoadingState extends ColorState {}

class EditColorSuccessState extends ColorState {}

class EditColorErrorState extends ColorState {
  final String error;

  EditColorErrorState({required this.error});
}

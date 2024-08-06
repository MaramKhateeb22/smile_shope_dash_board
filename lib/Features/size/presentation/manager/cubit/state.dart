abstract class SizeState {}

class AddSizeInitalState extends SizeState {}

class AddSizeLoadingState extends SizeState {}

class AddSizeSuccessState extends SizeState {}

class AddSizeErrorState extends SizeState {
  final String error;

  AddSizeErrorState({required this.error});
}

class ClearFormState extends SizeState {}

//allSize

class AllSizeInitalState extends SizeState {}

class AllSizeLoadingState extends SizeState {}

class AllSizeSuccessState extends SizeState {}

class AllSizeErrorState extends SizeState {
  final String error;

  AllSizeErrorState({required this.error});
}

//Delete Size

class DeleteSizeInitalState extends SizeState {}

class DeleteSizeLoadingState extends SizeState {}

class DeleteSizeSuccessState extends SizeState {}

class DeleteSizeErrorState extends SizeState {
  final String error;

  DeleteSizeErrorState({required this.error});
}
//Edit Size

class  EditSizeInitalState extends SizeState {}

class  EditSizeLoadingState extends SizeState {}

class  EditSizeSuccessState extends SizeState {}

class  EditSizeErrorState extends SizeState {
  final String error;

 EditSizeErrorState({required this.error});
}

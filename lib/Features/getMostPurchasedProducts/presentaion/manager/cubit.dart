import 'package:bloc/bloc.dart';
import 'package:smile_shope_dash_board/Features/getMostPurchasedProducts/data/model/getMostPurchasedProducts_model.dart';
import 'package:smile_shope_dash_board/Features/getMostPurchasedProducts/data/repo/repo.dart';
import 'package:smile_shope_dash_board/Features/getMostPurchasedProducts/presentaion/manager/state.dart';

class GetMostPurchasedProductsCubit
    extends Cubit<GetMostPurchasedProductsState> {
  GetMostPurchasedProductsCubit(
    this.getMostPurchasedProductsRepo,
  ) : super(GetMostPurchasedProductsInitState());

  final getMostPurchasedProductsReoposetry getMostPurchasedProductsRepo;

  List<getMostPurchasedProductsModel>? getMostPurchasedProductsmodel;
  getMostPurchasedProductsCubit() async {
    emit(GetMostPurchasedProductsLoadinGState());
    final response =
        await getMostPurchasedProductsRepo.getMostPurchasedProducts();
    response.fold(
        (errMessage) =>
            emit(GetMostPurchasedProductsFailureState(errMessaGe: errMessage)),
        (product) {
      getMostPurchasedProductsmodel = product;
      emit(GetMostPurchasedProductsSuccessState());
    });
  }
}

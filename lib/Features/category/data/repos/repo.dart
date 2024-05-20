// import 'package:smile_shope_dash_board/core/utils/api/api_consumer.dart';
// import 'package:dartz/dartz.dart';

// class ProductRopositry {
//   final ApiConsumer api;
//   ProductRopositry({required this.api});

//   Future<Either<String, SignUpModel>> ProductSave({
//     required String name,
//     required String detail,
//     required String price,
//     required XFile profilePic,
//   }) async {
//     try {
//       final response = await api.post(
//         EndPoint.signUp,
//         isFromData: true,
//         data: {
//           ApiKey.name: name,
//           ApiKey.phone: phone,
//           ApiKey.email: email,
//           ApiKey.password: password,
//           ApiKey.confirmPassword: confirmPassword,
//           ApiKey.location:
//               '{"name":"methalfa","address":"meet halfa","coordinates":[30.1572709,31.224779]}',
//           ApiKey.profilePic: await uploadImageToAPI(profilePic)
//         },
//       );
//       final signUPModel = SignUpModel.fromJson(response);
//       return Right(signUPModel);
//     } on ServerException catch (e) {
//       return Left(e.errModel.errorMessage);
//     }
//   }
// }

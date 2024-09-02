import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smile_shope_dash_board/Features/order/data/model/show_payment_proof.dart';
import 'package:smile_shope_dash_board/Features/order/presentation/manager/cubit.dart';
import 'package:smile_shope_dash_board/Features/order/presentation/manager/satate.dart';
import 'package:smile_shope_dash_board/core/utils/constants.dart';

class AllPaymentProof extends StatefulWidget {
  const AllPaymentProof({super.key});
  // AllUsersModel? allUsers;
  @override
  State<AllPaymentProof> createState() => _GetAllAllPaymentProofState();
}

class _GetAllAllPaymentProofState extends State<AllPaymentProof> {
  @override
  // void initState() {
  //   context.read<AllUsersCubit>().getNumberUsersCubit();
  //   // TODO: implement initState
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('إثبات الدفع   '),
        // leading: const Icon(Icons.people),
      ),
      body: FutureBuilder(
        // future: Future.wait<List<dynamic>>([
        // context.read<AllUsersCubit>().getAllUsersCubit(),
        // context.read<AllUsersCubit>().getNumberUsersCubit(),
        // ]),
        future: context.read<GetAllOrderCubit>().getAllpaymentProor(),

        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snap.hasError) {
            return const Text("Something has error");
          } else {
            ShowAllPaymentProofModel allPaymentProof =
                context.read<GetAllOrderCubit>().allPaymentProof!;
            // NumberUserModel numberUseres =
            // context.read<AllUsersCubit>().numberUseres!;
            // print('kkkkkkkkkkkkkkkkkkk\n' '${allPaymentProof.}');
            return BlocConsumer<GetAllOrderCubit, OrderState>(
              listener: (context, state) {
                if (state is VerifyPaidSuccessAcceptState) {
                  message(context, 'تم  القبول بنجاح');
                  context.replace('/all_order_paid_view');
                }
                if (state is VerifyPaidSuccessRejectState) {
                  message(context, 'تم  الرفض ');
                  context.replace('/all_order_view');
                }
              },
              builder: (context, state) {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // BlocBuilder<AllUsersCubit, AllUsersState>(
                      //   builder: (context, state) {
                      //     if (state is GetNumberUsersStateSuccess) {
                      //       return Text(
                      //         '  عدد المستخدمين'
                      //         ' : '
                      //         '${state.numberUserModel.numberOfUsers}',
                      //         style: const TextStyle(fontSize: 25, color: Colors.red),
                      //       );
                      //     } else if (state is GetNumberUsersStateFailure) {
                      //       return Text(state.errMessage);
                      //     } else if (state is GetNumberUsersStateLoading) {
                      //       return const CircularProgressIndicator();
                      //     } else {
                      //       return Text(
                      //         ' المستخدمين  '
                      //         ' : '
                      //         '${numberUseres.numberOfUsers}',
                      //         style: const TextStyle(fontSize: 25, color: Colors.red),
                      //       );
                      //     }
                      //   },
                      // ),
                      SizedBox(
                        width: 1500,
                        height: 500,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          itemCount: allPaymentProof.paymentProofs!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 8),
                              child: Card(
                                color: Colors.grey[200],
                                margin: const EdgeInsets.symmetric(vertical: 4),
                                child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Row(
                                      // mainAxisAlignment: MainAxisAlignment.center,
                                      // crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Image.network(
                                            '${allPaymentProof.paymentProofs![index].paymentProof}'),
                                        // Image.asset(
                                        //   'assets/images/55455278_2383138915059271_4684744095032147968_n.jpg',
                                        //   height: 500,
                                        //   // width: 500,
                                        //   fit: BoxFit.fill,
                                        // ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              // crossAxisAlignment:
                                              // CrossAxisAlignment.center,
                                              children: [
                                                const Text(
                                                  'رقم الفاتورة:',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  '${allPaymentProof.paymentProofs![index].orderId}',
                                                  style: const TextStyle(
                                                      color: Colors.red,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                const Text(
                                                  ' اسم المستخدم:',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  '${allPaymentProof.paymentProofs![index].userName}',
                                                  style: const TextStyle(
                                                      color: Colors.red,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                const Text(
                                                  ' المبلغ الاجمالي للدفع   :'
                                                  'S.Y',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  '${allPaymentProof.paymentProofs![index].totalAmount}',
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                const Text(
                                                  ' حالة الدفع:',
                                                  style: TextStyle(
                                                      color: Colors.orange,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                allPaymentProof
                                                            .paymentProofs![
                                                                index]
                                                            .paid ==
                                                        0
                                                    ? const Text(
                                                        'لم يتم الدفع',
                                                        style: TextStyle(
                                                            fontSize: 18),
                                                      )
                                                    : const Text(
                                                        '✔ تم الدفع',
                                                        style: TextStyle(
                                                            fontSize: 18),
                                                      ),
                                              ],
                                            ),
                                            allPaymentProof
                                                        .paymentProofs![index]
                                                        .paid ==
                                                    0
                                                ? Row(
                                                    children: [
                                                      state is VerifyPaidLoadingAcceptState
                                                          ? const CircularProgressIndicator()
                                                          : MaterialButton(
                                                              onPressed: () {
                                                                context.read<GetAllOrderCubit>().verifyAcceptCubit(
                                                                    allPaymentProof
                                                                        .paymentProofs![
                                                                            index]
                                                                        .orderId
                                                                        .toString(),
                                                                    1,
                                                                    context);
                                                              },
                                                              color:
                                                                  Colors.green,
                                                              textColor:
                                                                  Colors.white,
                                                              child: const Text(
                                                                  'قبول'),
                                                            ),
                                                      const SizedBox(
                                                        width: 20,
                                                      ),
                                                      // state is VerifyPaidLoadingRejectState
                                                      //     ? const CircularProgressIndicator()
                                                      //     : MaterialButton(
                                                      //         onPressed: () {
                                                      //           context.read<GetAllOrderCubit>().verifyCubitReject(
                                                      //               allPaymentProof
                                                      //                   .paymentProofs![
                                                      //                       index]
                                                      //                   .orderId
                                                      //                   .toString(),
                                                      //               0,
                                                      //               context);
                                                      //         },
                                                      //         color:
                                                      //             Colors.green,
                                                      //         textColor:
                                                      //             Colors.white,
                                                      //         child: const Text(
                                                      //             'رفض'),
                                                      //       ),
                                                    ],
                                                  )
                                                : const Text(''),
                                          ],
                                        ),
                                      ],
                                    )),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_shope_dash_board/Features/order/data/model/show_payment_proof.dart';
import 'package:smile_shope_dash_board/Features/order/presentation/manager/cubit.dart';

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
                  ListView.builder(
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
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/55455278_2383138915059271_4684744095032147968_n.jpg',
                                  height: 400,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Row(
                                  // crossAxisAlignment:
                                  // CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'رقم الفاتورة:',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '${allPaymentProof.paymentProofs![index].orderId}',
                                      style: const TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      ' اسم المستخدم:',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '${allPaymentProof.paymentProofs![index].userName}',
                                      style: const TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      ' المبلغ الاجمالي للدفع   :',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '${allPaymentProof.paymentProofs![index].totalAmount}',
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                )

                                // Row(
                                //   children: [
                                //     const Text(
                                //       ' حالة الدفع:',
                                //       style: TextStyle(
                                //           color: Colors.orange,
                                //           fontWeight: FontWeight.bold),
                                //     ),
                                //     const SizedBox(
                                //       width: 10,
                                //     ),
                                //     allPaymentProof
                                //                 .paymentProofs![index].paid ==
                                //             0
                                //         ? const Text(
                                //             'لم يتم الدفع',
                                //             style: TextStyle(fontSize: 18),
                                //           )
                                //         : const Text(
                                //             '✔ تم الدفع',
                                //             style: TextStyle(fontSize: 18),
                                //           ),
                                //   ],
                                // ),
                                // allPaymentProof.paymentProofs![index].paid == 0
                                //     ? Row(
                                //         children: [
                                //           MaterialButton(
                                //             onPressed: () {},
                                //             child: const Text('قبول'),
                                //           ),
                                //           MaterialButton(
                                //             onPressed: () {},
                                //             child: const Text('رفض'),
                                // ),
                                // ],
                                // )
                                // : const Text(''),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
